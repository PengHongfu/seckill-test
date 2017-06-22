package thread;

/**
 * Created by Peng
 * Time: 2017/5/24 13:42
 */
public class Actor extends Thread {
    @Override
    public void run() {
        System.out.println(getName()+"是一个演员！");
        int count = 0;
        int  keepRunning = 1;
        while(keepRunning<=100) {
            System.out.println(getName() + "登台演出：" + (++count));
            keepRunning++;
            try {
                if(count%10==0) {
                    Thread.sleep(1000);
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println(getName()+"的演出结束了！");
    }
    public static void main(String[] args) {
     Thread actor = new Actor();
     actor.setName("Mr.Thread");
     actor.start();
     Thread actressThread = new Thread(new Actress(),"Mrs.Runnable");
     actressThread.start();
    }
}
class Actress implements Runnable{

    @Override
    public void run() {
        System.out.println(Thread.currentThread().getName()+"是一个演员！");
        int count = 0;
        int  keepRunning = 1;
        while(keepRunning<=100) {
            System.out.println(Thread.currentThread().getName() + "登台演出：" + (++count));
            keepRunning++;
            try {
                if(count%10==0) {
                    Thread.sleep(1000);
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println(Thread.currentThread().getName()+"的演出结束了！");
    }
}