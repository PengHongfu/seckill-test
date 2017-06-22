package thread;

/**
 * Created by Peng
 * Time: 2017/5/24 13:56
 */
public class ArmyRunnable implements Runnable {
    //volatile 保证了线程可以正确的读取其他线程写入的值
    //可见性
    volatile boolean keepRunning = true;
    @Override
    public void run() {
        while(keepRunning){
            //发动五连击
            for(int i = 0;i<5;i++){
                System.out.println(Thread.currentThread().getName()+"进攻对方["+i+"]");
                Thread.yield();
            }
        }
        System.out.println(Thread.currentThread().getName());
    }
}
