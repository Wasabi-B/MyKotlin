import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringDemo {

    private static String str1 = "123";

    public static void main(String[] args) {
//        boolean contains = str1.contains("12345");
//        System.out.print(contains);
        long now = System.currentTimeMillis();
        long targetTime = now + 1000 * 10 * 20 * 60;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String format1 = format.format(targetTime);
        String format2 = format.format(now);

        Date targetDate = null;
        try {
            targetDate = new Date(format.parse(format1).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date curDate = null;
        try {
            curDate = new Date(format.parse(format2).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (targetDate.after(curDate)){
            System.out.print("明天");
        }else {
            System.out.print("今天");
        }
    }
}
