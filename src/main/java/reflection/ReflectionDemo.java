package reflection;

import java.lang.reflect.*;

/**
 * Java反射机制练习
 */
public class ReflectionDemo {

    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, InvocationTargetException, NoSuchFieldException, NoSuchMethodException {
        //Demo1.  通过Java反射机制得到类的包名和类名
        demo1();
        System.out.println("====================================================");

        //Demo2.  验证所有的类都是Class类的实例对象
        demo2();
        System.out.println("====================================================");

        //Demo3.  通过Java反射机制，用Class 创建类对象[这也就是反射存在的意义所在]，无参构造
        demo3();
        System.out.println("====================================================");

        //Demo4: 通过Java反射机制得到一个类的构造函数，并实现创建带参实例对象
        demo4();
        System.out.println("====================================================");

        //Demo5:  通过Java反射机制操作成员变量, set 和 get
        demo5();
        System.out.println("====================================================");

        //Demo6: 通过Java反射机制得到类的一些属性： 继承的接口，父类，函数信息，成员信息，类型等
        demo6();
        System.out.println("====================================================");

        //Demo7: 通过Java反射机制调用类方法
        demo7();
        System.out.println("====================================================");

        //Demo8.  通过Java反射机制得到类加载器信息
        demo8();
        System.out.println("====================================================");
    }

    /**
     * Demo1: 通过Java反射机制得到类的包名和类名
     */
    public static void demo1() throws ClassNotFoundException {
        Person person = new Person();
        System.out.println("Demo1写法1，包名：" + person.getClass().getPackage().getName() + ",完整类名：" + person.getClass().getName());

        Class<?> clazz = Class.forName("reflection.Person");
        System.out.println("Demo1写法2，包名：" + clazz.getPackage().getName() + ",完整类名：" + clazz.getName());

    }

    /**
     * Demo2: 验证所有的类都是Class类的实例对象
     *
     * @throws ClassNotFoundException
     */
    public static void demo2() throws ClassNotFoundException {
        //定义两个类型都未知的Class , 设置初值为null, 看看如何给它们赋值成Person类
        Class<?> clazz1 = null;
        Class<?> clazz2 = null;

        //写法1, 可能抛出 ClassNotFoundException [多用这个写法]
        clazz1 = Class.forName("reflection.Person");
        System.out.println("demo2,写法1：包名：" + clazz1.getPackage().getName() + ",类名：" + clazz1.getName() + ",简写类名:" + clazz1.getSimpleName());
        //写法2
        clazz2 = Person.class;
        System.out.println("demo2,写法2：包名：" + clazz2.getPackage().getName() + ",类名：" + clazz2.getName() + ",简写类名:" + clazz2.getSimpleName());

    }

    /**
     * Demo3: 通过Java反射机制，用Class 创建类对象[这也就是反射存在的意义所在]
     *
     * @throws ClassNotFoundException
     * @throws IllegalAccessException
     * @throws InstantiationException
     */
    public static void demo3() throws IllegalAccessException, InstantiationException, ClassNotFoundException {
        Class<?> clazz = null;
        clazz = Class.forName("reflection.Person");
        //由于这里不能带参数，所以你要实例化的这个类Person，一定要有无参构造函数哈～
        Person person = (Person) clazz.newInstance();
        person.setAge(27);
        person.setName("Brain");
        System.out.println("demo3,姓名：" + person.getName() + ",年龄：" + person.getAge());
    }

    /**
     * Demo4: 通过Java反射机制得到一个类的构造函数，并实现创建带参实例对象
     *
     * @throws ClassNotFoundException
     * @throws IllegalAccessException
     * @throws InstantiationException
     * @throws IllegalArgumentException
     */
    public static void demo4() throws ClassNotFoundException, IllegalAccessException, InvocationTargetException, InstantiationException, NoSuchMethodException {
        Class<?> clazz = null;
        Person person1 = null;
        Person person2 = null;
        Person person3 = null;

        clazz = Class.forName("reflection.Person");
        //得到一系列构造参数集合
        Constructor<?>[] constructors = clazz.getConstructors();
        person1 = (Person) constructors[0].newInstance();
        person1.setName("Brian");
        person1.setAge(27);

        person2 = (Person) constructors[1].newInstance("Danney", 32);

        Constructor<?> constructor = clazz.getConstructor(String.class,int.class);
        person3 = (Person) constructor.newInstance("Gary",33);

        System.out.println("demo4:" + person1.getName() + ":" + person1.getAge() + "," + person2.getName() + ":" + person2.getAge()+"\n"+person3.getName()+":"+person3.getAge());
    }

    /**
     * Demo5: 通过Java反射机制操作成员变量, set 和 get
     *
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     * @throws NoSuchFieldException
     * @throws SecurityException
     * @throws InstantiationException
     * @throws ClassNotFoundException
     */
    public static void demo5() throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchFieldException {
        Class<?> clazz = Class.forName("reflection.Person");
        Object obj = clazz.newInstance();

        Field personField = clazz.getDeclaredField("name");
        personField.setAccessible(true);
        personField.set(obj, "胖虎先森");

        System.out.println("Demo5: 修改属性之后得到属性变量的值：" + personField.get(obj));
    }

    /**
     * Demo6: 通过Java反射机制得到类的一些属性： 继承的接口，父类，函数信息，成员信息，类型等
     *
     * @throws ClassNotFoundException
     */
    public static void demo6() throws ClassNotFoundException {
        Class<?> clazz = Class.forName("reflection.SuperMan");

        //获取父类的名字
        Class<?> superClass = clazz.getSuperclass();
        System.out.println("demo6,父类的名字：" + superClass.getName());
        System.out.println("====================================================");

        Field[] fields = clazz.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            System.out.println("类中的成员：" + fields[i]);
        }
        System.out.println("====================================================");

        //取得类中的方法
        Method[] methods = clazz.getDeclaredMethods();
        for (int i = 0; i < methods.length; i++) {
            System.out.println("demo6,取得SuperMan的方法：");
            System.out.println("函数名：" + methods[i].getName());
            System.out.println("函数返回类型：" + methods[i].getReturnType());
            System.out.println("函数访问修饰符：" + Modifier.toString(methods[i].getModifiers()));
            System.out.println("函数代码写法：" + methods[i]);
        }
        System.out.println("====================================================");

        //取得类实现的接口,因为接口类也属于Class,所以得到接口中的方法也是一样的方法得到哈
        Class<?> interfaces[] = clazz.getInterfaces();
        for (int i = 0; i < interfaces.length; i++) {
            System.out.println("实现的接口名：" + interfaces[i].getName());
        }
    }

    /**
     * Demo7: 通过Java反射机制调用类方法
     *
     * @throws ClassNotFoundException
     * @throws NoSuchMethodException
     * @throws SecurityException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     * @throws InstantiationException
     */
    public static void demo7() throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {
        Class<?> clazz = Class.forName("reflection.SuperMan");

        System.out.println("Demo7:调用无参构造方法fly");
        Method fly = clazz.getDeclaredMethod("fly");
        fly.invoke(clazz.newInstance());

        System.out.println("Demo7：调用有参构造方法walk");
        Method walk = clazz.getDeclaredMethod("walk", int.class);
        walk.invoke(clazz.newInstance(), 100);

    }

    /**
     * Demo8: 通过Java反射机制得到类加载器信息
     *
     * 在java中有三种类类加载器。[这段资料网上截取]
     * 1）Bootstrap ClassLoader 此加载器采用c++编写，一般开发中很少见。
     * 2）Extension ClassLoader 用来进行扩展类的加载，一般对应的是jre\lib\ext目录中的类
     * 3）AppClassLoader 加载classpath指定的类，是最常用的加载器。同时也是java中默认的加载器。
     *
     * @throws ClassNotFoundException
     */
    public static void demo8() throws ClassNotFoundException {
        Class<?> clazz = Class.forName("reflection.SuperMan");

        String nameString = clazz.getClassLoader().getClass().getName();
        System.out.println("Demo8:类构造器类名："+nameString);
    }

}

class Person {
    private String name;
    private int age;

    public Person() {
    }

    /**
     * @param name 姓名
     * @param age  年龄
     */
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}

class SuperMan extends Person implements ActionInterface {

    private boolean isBlueBriefs;

    public boolean isBlueBriefs() {
        return isBlueBriefs;
    }

    public void setBlueBriefs(boolean blueBriefs) {
        isBlueBriefs = blueBriefs;
    }

    @Override
    public void walk(int m) {
        System.out.println("超人会走耶～～走了" + m + "米就走不动了！");
    }

    public void fly() {
        System.out.println("超人会飞耶～～");
    }
}

interface ActionInterface {

    /**
     * @param m 走的距离
     */
    void walk(int m);
}