[1mdiff --git a/src/main/java/reflection/ReflectionDemo.java b/src/main/java/reflection/ReflectionDemo.java[m
[1mindex f47b2a3..bdeaaeb 100644[m
[1m--- a/src/main/java/reflection/ReflectionDemo.java[m
[1m+++ b/src/main/java/reflection/ReflectionDemo.java[m
[36m@@ -1,4 +1,283 @@[m
 package reflection;[m
 [m
[32m+[m[32mimport java.lang.reflect.*;[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Java反射机制练习[m
[32m+[m[32m */[m
 public class ReflectionDemo {[m
[32m+[m
[32m+[m[32m    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, InvocationTargetException, NoSuchFieldException, NoSuchMethodException {[m
[32m+[m[32m        //Demo1.  通过Java反射机制得到类的包名和类名[m
[32m+[m[32m        demo1();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //Demo2.  验证所有的类都是Class类的实例对象[m
[32m+[m[32m        demo2();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //Demo3.  通过Java反射机制，用Class 创建类对象[这也就是反射存在的意义所在]，无参构造[m
[32m+[m[32m        demo3();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //Demo4: 通过Java反射机制得到一个类的构造函数，并实现创建带参实例对象[m
[32m+[m[32m        demo4();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //Demo5:  通过Java反射机制操作成员变量, set 和 get[m
[32m+[m[32m        demo5();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //Demo6: 通过Java反射机制得到类的一些属性： 继承的接口，父类，函数信息，成员信息，类型等[m
[32m+[m[32m        demo6();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //Demo7: 通过Java反射机制调用类方法[m
[32m+[m[32m        demo7();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //Demo8.  通过Java反射机制得到类加载器信息[m
[32m+[m[32m        demo8();[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo1: 通过Java反射机制得到类的包名和类名[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo1() throws ClassNotFoundException {[m
[32m+[m[32m        Person person = new Person();[m
[32m+[m[32m        System.out.println("Demo1写法1，包名：" + person.getClass().getPackage().getName() + ",完整类名：" + person.getClass().getName());[m
[32m+[m
[32m+[m[32m        Class<?> clazz = Class.forName("reflection.Person");[m
[32m+[m[32m        System.out.println("Demo1写法2，包名：" + clazz.getPackage().getName() + ",完整类名：" + clazz.getName());[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo2: 验证所有的类都是Class类的实例对象[m
[32m+[m[32m     *[m
[32m+[m[32m     * @throws ClassNotFoundException[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo2() throws ClassNotFoundException {[m
[32m+[m[32m        //定义两个类型都未知的Class , 设置初值为null, 看看如何给它们赋值成Person类[m
[32m+[m[32m        Class<?> clazz1 = null;[m
[32m+[m[32m        Class<?> clazz2 = null;[m
[32m+[m
[32m+[m[32m        //写法1, 可能抛出 ClassNotFoundException [多用这个写法][m
[32m+[m[32m        clazz1 = Class.forName("reflection.Person");[m
[32m+[m[32m        System.out.println("demo2,写法1：包名：" + clazz1.getPackage().getName() + ",类名：" + clazz1.getName() + ",简写类名:" + clazz1.getSimpleName());[m
[32m+[m[32m        //写法2[m
[32m+[m[32m        clazz2 = Person.class;[m
[32m+[m[32m        System.out.println("demo2,写法2：包名：" + clazz2.getPackage().getName() + ",类名：" + clazz2.getName() + ",简写类名:" + clazz2.getSimpleName());[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo3: 通过Java反射机制，用Class 创建类对象[这也就是反射存在的意义所在][m
[32m+[m[32m     *[m
[32m+[m[32m     * @throws ClassNotFoundException[m
[32m+[m[32m     * @throws IllegalAccessException[m
[32m+[m[32m     * @throws InstantiationException[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo3() throws IllegalAccessException, InstantiationException, ClassNotFoundException {[m
[32m+[m[32m        Class<?> clazz = null;[m
[32m+[m[32m        clazz = Class.forName("reflection.Person");[m
[32m+[m[32m        //由于这里不能带参数，所以你要实例化的这个类Person，一定要有无参构造函数哈～[m
[32m+[m[32m        Person person = (Person) clazz.newInstance();[m
[32m+[m[32m        person.setAge(27);[m
[32m+[m[32m        person.setName("Brain");[m
[32m+[m[32m        System.out.println("demo3,姓名：" + person.getName() + ",年龄：" + person.getAge());[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo4: 通过Java反射机制得到一个类的构造函数，并实现创建带参实例对象[m
[32m+[m[32m     *[m
[32m+[m[32m     * @throws ClassNotFoundException[m
[32m+[m[32m     * @throws IllegalAccessException[m
[32m+[m[32m     * @throws InstantiationException[m
[32m+[m[32m     * @throws IllegalArgumentException[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo4() throws ClassNotFoundException, IllegalAccessException, InvocationTargetException, InstantiationException, NoSuchMethodException {[m
[32m+[m[32m        Class<?> clazz = null;[m
[32m+[m[32m        Person person1 = null;[m
[32m+[m[32m        Person person2 = null;[m
[32m+[m[32m        Person person3 = null;[m
[32m+[m
[32m+[m[32m        clazz = Class.forName("reflection.Person");[m
[32m+[m[32m        //得到一系列构造参数集合[m
[32m+[m[32m        Constructor<?>[] constructors = clazz.getConstructors();[m
[32m+[m[32m        person1 = (Person) constructors[0].newInstance();[m
[32m+[m[32m        person1.setName("Brian");[m
[32m+[m[32m        person1.setAge(27);[m
[32m+[m
[32m+[m[32m        person2 = (Person) constructors[1].newInstance("Danney", 32);[m
[32m+[m
[32m+[m[32m        Constructor<?> constructor = clazz.getConstructor(String.class,int.class);[m
[32m+[m[32m        person3 = (Person) constructor.newInstance("Gary",33);[m
[32m+[m
[32m+[m[32m        System.out.println("demo4:" + person1.getName() + ":" + person1.getAge() + "," + person2.getName() + ":" + person2.getAge()+"\n"+person3.getName()+":"+person3.getAge());[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo5: 通过Java反射机制操作成员变量, set 和 get[m
[32m+[m[32m     *[m
[32m+[m[32m     * @throws IllegalAccessException[m
[32m+[m[32m     * @throws IllegalArgumentException[m
[32m+[m[32m     * @throws NoSuchFieldException[m
[32m+[m[32m     * @throws SecurityException[m
[32m+[m[32m     * @throws InstantiationException[m
[32m+[m[32m     * @throws ClassNotFoundException[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo5() throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchFieldException {[m
[32m+[m[32m        Class<?> clazz = Class.forName("reflection.Person");[m
[32m+[m[32m        Object obj = clazz.newInstance();[m
[32m+[m
[32m+[m[32m        Field personField = clazz.getDeclaredField("name");[m
[32m+[m[32m        personField.setAccessible(true);[m
[32m+[m[32m        personField.set(obj, "胖虎先森");[m
[32m+[m
[32m+[m[32m        System.out.println("Demo5: 修改属性之后得到属性变量的值：" + personField.get(obj));[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo6: 通过Java反射机制得到类的一些属性： 继承的接口，父类，函数信息，成员信息，类型等[m
[32m+[m[32m     *[m
[32m+[m[32m     * @throws ClassNotFoundException[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo6() throws ClassNotFoundException {[m
[32m+[m[32m        Class<?> clazz = Class.forName("reflection.SuperMan");[m
[32m+[m
[32m+[m[32m        //获取父类的名字[m
[32m+[m[32m        Class<?> superClass = clazz.getSuperclass();[m
[32m+[m[32m        System.out.println("demo6,父类的名字：" + superClass.getName());[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        Field[] fields = clazz.getDeclaredFields();[m
[32m+[m[32m        for (int i = 0; i < fields.length; i++) {[m
[32m+[m[32m            System.out.println("类中的成员：" + fields[i]);[m
[32m+[m[32m        }[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //取得类中的方法[m
[32m+[m[32m        Method[] methods = clazz.getDeclaredMethods();[m
[32m+[m[32m        for (int i = 0; i < methods.length; i++) {[m
[32m+[m[32m            System.out.println("demo6,取得SuperMan的方法：");[m
[32m+[m[32m            System.out.println("函数名：" + methods[i].getName());[m
[32m+[m[32m            System.out.println("函数返回类型：" + methods[i].getReturnType());[m
[32m+[m[32m            System.out.println("函数访问修饰符：" + Modifier.toString(methods[i].getModifiers()));[m
[32m+[m[32m            System.out.println("函数代码写法：" + methods[i]);[m
[32m+[m[32m        }[m
[32m+[m[32m        System.out.println("====================================================");[m
[32m+[m
[32m+[m[32m        //取得类实现的接口,因为接口类也属于Class,所以得到接口中的方法也是一样的方法得到哈[m
[32m+[m[32m        Class<?> interfaces[] = clazz.getInterfaces();[m
[32m+[m[32m        for (int i = 0; i < interfaces.length; i++) {[m
[32m+[m[32m            System.out.println("实现的接口名：" + interfaces[i].getName());[m
[32m+[m[32m        }[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo7: 通过Java反射机制调用类方法[m
[32m+[m[32m     *[m
[32m+[m[32m     * @throws ClassNotFoundException[m
[32m+[m[32m     * @throws NoSuchMethodException[m
[32m+[m[32m     * @throws SecurityException[m
[32m+[m[32m     * @throws InvocationTargetException[m
[32m+[m[32m     * @throws IllegalAccessException[m
[32m+[m[32m     * @throws IllegalArgumentException[m
[32m+[m[32m     * @throws InstantiationException[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo7() throws ClassNotFoundException, IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {[m
[32m+[m[32m        Class<?> clazz = Class.forName("reflection.SuperMan");[m
[32m+[m
[32m+[m[32m        System.out.println("Demo7:调用无参构造方法fly");[m
[32m+[m[32m        Method fly = clazz.getDeclaredMethod("fly");[m
[32m+[m[32m        fly.invoke(clazz.newInstance());[m
[32m+[m
[32m+[m[32m        System.out.println("Demo7：调用有参构造方法walk");[m
[32m+[m[32m        Method walk = clazz.getDeclaredMethod("walk", int.class);[m
[32m+[m[32m        walk.invoke(clazz.newInstance(), 100);[m
[32m+[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * Demo8: 通过Java反射机制得到类加载器信息[m
[32m+[m[32m     *[m
[32m+[m[32m     * 在java中有三种类类加载器。[这段资料网上截取][m
[32m+[m[32m     * 1）Bootstrap ClassLoader 此加载器采用c++编写，一般开发中很少见。[m
[32m+[m[32m     * 2）Extension ClassLoader 用来进行扩展类的加载，一般对应的是jre\lib\ext目录中的类[m
[32m+[m[32m     * 3）AppClassLoader 加载classpath指定的类，是最常用的加载器。同时也是java中默认的加载器。[m
[32m+[m[32m     *[m
[32m+[m[32m     * @throws ClassNotFoundException[m
[32m+[m[32m     */[m
[32m+[m[32m    public static void demo8() throws ClassNotFoundException {[m
[32m+[m[32m        Class<?> clazz = Class.forName("reflection.SuperMan");[m
[32m+[m
[32m+[m[32m        String nameString = clazz.getClassLoader().getClass().getName();[m
[32m+[m[32m        System.out.println("Demo8:类构造器类名："+nameString);[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mclass Person {[m
[32m+[m[32m    private String name;[m
[32m+[m[32m    private int age;[m
[32m+[m
[32m+[m[32m    public Person() {[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * @param name 姓名[m
[32m+[m[32m     * @param age  年龄[m
[32m+[m[32m     */[m
[32m+[m[32m    public Person(String name, int age) {[m
[32m+[m[32m        this.name = name;[m
[32m+[m[32m        this.age = age;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public String getName() {[m
[32m+[m[32m        return name;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setName(String name) {[m
[32m+[m[32m        this.name = name;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public int getAge() {[m
[32m+[m[32m        return age;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setAge(int age) {[m
[32m+[m[32m        this.age = age;[m
[32m+[m[32m    }[m
 }[m
[32m+[m
[32m+[m[32mclass SuperMan extends Person implements ActionInterface {[m
[32m+[m
[32m+[m[32m    private boolean isBlueBriefs;[m
[32m+[m
[32m+[m[32m    public boolean isBlueBriefs() {[m
[32m+[m[32m        return isBlueBriefs;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void setBlueBriefs(boolean blueBriefs) {[m
[32m+[m[32m        isBlueBriefs = blueBriefs;[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    @Override[m
[32m+[m[32m    public void walk(int m) {[m
[32m+[m[32m        System.out.println("超人会走耶～～走了" + m + "米就走不动了！");[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m    public void fly() {[m
[32m+[m[32m        System.out.println("超人会飞耶～～");[m
[32m+[m[32m    }[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32minterface ActionInterface {[m
[32m+[m
[32m+[m[32m    /**[m
[32m+[m[32m     * @param m 走的距离[m
[32m+[m[32m     */[m
[32m+[m[32m    void walk(int m);[m
[32m+[m[32m}[m
\ No newline at end of file[m
