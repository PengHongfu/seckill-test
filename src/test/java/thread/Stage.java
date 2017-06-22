package thread;

/**
 * Created by Peng
 * 舞台
 * Time: 2017/5/24 14:02
 */
public class Stage extends Thread {

    @Override
    public void run() {

        ArmyRunnable armyTask1 = new ArmyRunnable();
        ArmyRunnable armyTask2 = new ArmyRunnable();

        Thread t1 = new Thread(armyTask1,"悟空");
        Thread t2 = new Thread(armyTask2,"八戒");
        t1.start();
        t2.start();

        try {
            Thread.sleep(50);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("沙僧加入战斗");
        KeyPersonThread t3 = new KeyPersonThread();
        t3.setName("沙僧");
        System.out.println("沙僧结束战斗");

        armyTask1.keepRunning = false;
        armyTask2.keepRunning = false;

        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        t3.start();

        try {
            t3.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        new Stage().start();
    }
}
