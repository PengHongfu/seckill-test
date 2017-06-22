package thread;

/**
 * Created by Peng
 * Time: 2017/5/24 15:01
 */
public class KeyPersonThread extends Thread{

    @Override
    public void run() {
        System.out.println(getName()+"开始战斗！");
        for(int i=0;i<10;i++){
            System.out.println(getName()+"攻击...");
        }
        System.out.println(getName()+"结束了站斗！");
    }
}
