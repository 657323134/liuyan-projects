package com.liuyan.jvm;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.SelectionKey;

/**
 * Created by liuyan on 2018/3/4.
 */
public class NioTest {
    public static void main(String[] args) throws IOException {
        RandomAccessFile rdf = new RandomAccessFile("D:\\Temp\\123.txt", "rw");
//        File f = new File("d:" + File.separator + "test.txt") ; // 指定要操作的文件
//        RandomAccessFile rdf = null ;       // 声明RandomAccessFile类的对象a
//        rdf = new RandomAccessFile(f,"rw") ;// 读写模式，如果文件不存在，会自动创建

        FileChannel inChannel = rdf.getChannel();

//create buffer with capacity of 48 bytes
        ByteBuffer buf = ByteBuffer.allocate(48);

        int bytesRead = inChannel.read(buf); //read into buffer.
        while (bytesRead != -1) {

            buf.flip();  //make buffer ready for read

            while(buf.hasRemaining()){
                System.out.print((char) buf.get()); // read 1 byte at a time
            }

            buf.clear(); //make buffer ready for writing
            bytesRead = inChannel.read(buf);
        }
        rdf.close();
        int interestSet = SelectionKey.OP_READ | SelectionKey.OP_WRITE;
        int i = 1|2;
    }
}
