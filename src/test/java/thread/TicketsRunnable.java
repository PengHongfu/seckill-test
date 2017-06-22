package thread;

/**
 * Created by Peng
 * Time: 2017/5/24 15:43
 */
public class TicketsRunnable {
  public static void main(String[] args) {
      MyThredRunnable r1 = new MyThredRunnable();
      Thread t1 = new Thread(r1,"窗口1");
      Thread t2 = new Thread(r1,"窗口2");
      Thread t3 = new Thread(r1,"窗口3");
      t1.start();
      t2.start();
      t3.start();
  }
}
class MyThredRunnable implements Runnable{
    private int ticketcount = 5;//五张票

    @Override
    public void run() {
        while (ticketcount > 0) {
            ticketcount--;
            System.out.println(Thread.currentThread().getName() + "卖了一张，还剩票数" + ticketcount);
        }
    }
}
