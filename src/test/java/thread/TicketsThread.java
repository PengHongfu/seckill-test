package thread;

/**
 * Created by Peng
 * Time: 2017/5/24 15:37
 */
public class TicketsThread {
    public static void main(String[] args) {
        MyThread t1 = new MyThread();
        t1.setName("窗口一");
        MyThread t2 = new MyThread();
        t2.setName("窗口二");
        MyThread t3 = new MyThread();
        t3.setName("窗口三");

        t1.start();
        t2.start();
        t3.start();
    }
}

class MyThread extends Thread {
    private int ticketcount = 5;

    @Override
    public void run() {
        while (ticketcount > 0) {
            ticketcount--;
            System.out.println(getName() + "卖了一张，还剩票数" + ticketcount);
        }
    }
}