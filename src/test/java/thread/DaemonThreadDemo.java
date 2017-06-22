package thread;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Scanner;

/**
 * Created by Peng
 * Time: 2017/5/24 16:37
 */
public class DaemonThreadDemo {
    public static void main(String[] args) {

        System.out.println("进入主线程"+Thread.currentThread().getName());
        DaemonThread daemonThread = new DaemonThread();
        Thread thread = new Thread(daemonThread);
        thread.setDaemon(true);
        thread.start();
        Scanner s = new Scanner(System.in);
        s.next();
        System.out.println("退出主线程"+Thread.currentThread().getName());
    }
}

class DaemonThread implements Runnable{

    @Override
    public void run() {
        System.out.println("进入守护线程"+Thread.currentThread().getName());
        try {
            writeTofile();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("退出守护线程"+Thread.currentThread().getName());

    }
    private void writeTofile() throws Exception{
        File filename = new File("D:"+File.separator+"daemon.txt");
        OutputStream outputStream = new FileOutputStream(filename,true);
        int count = 0;
        while(count<999){
            outputStream.write(("\r\nword"+count).getBytes());
            System.out.println("守护线程"+Thread.currentThread().getName()
                +"向文件中写入了word"+count++);
            Thread.sleep(1000);
        }
    }
}