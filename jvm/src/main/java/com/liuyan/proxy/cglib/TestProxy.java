package com.liuyan.proxy.cglib;

import com.liuyan.proxy.BookFacade;
import com.liuyan.proxy.BookFacadeImpl;
import com.liuyan.proxy.jdk.BookFacadeProxy;
import jdk.internal.org.objectweb.asm.ClassReader;
import net.sf.cglib.core.DebuggingClassWriter;
import sun.misc.ProxyGenerator;

import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by liuyan on 2018/3/4.
 */
public class TestProxy {
    private static String outputFile = "c:/Temp/out";
    static {
        System.setProperty(DebuggingClassWriter.DEBUG_LOCATION_PROPERTY,outputFile);
    }

    public static void main(String[] args) throws IOException {
        TestProxy testProxy = new TestProxy();
        // cglib动态代理
        BookFacadeImpl bookProxy = testProxy.cglibProxyClient();

        // jdk 代理
//        BookFacade bookProxy = testProxy.jdkProxyClient();
//        bookProxy.addBook();
//        jdkToFile(bookProxy);
        testProxy.testSerail();
    }

    public void testSerail() throws IOException {
        BookFacadeImpl obj = new BookFacadeImpl();
        toFile(obj);
    }
    public BookFacade jdkProxyClient() {
        BookFacadeProxy proxy = new BookFacadeProxy();
        BookFacade bookProxy = (BookFacade) proxy.bind(new BookFacadeImpl());
        return bookProxy;
    }

    public BookFacadeImpl cglibProxyClient() {
        BookFacadeProxyCglib proxy = new BookFacadeProxyCglib();
        BookFacadeImpl bookProxy = (BookFacadeImpl) proxy.getInstance(new BookFacadeImpl());
        return bookProxy;
    }
    //JDK动态代理生成的字节码文件持久化
    public static void jdkToFile(BookFacadeImpl obj) throws IOException {
        Class clazz = obj.getClass();
        String className = clazz.getName();
        byte[] classFile = ProxyGenerator.generateProxyClass(className, BookFacadeImpl.class.getInterfaces());
        FileOutputStream fos = new FileOutputStream(outputFile);
        // ClassReader cr = new ClassReader(className);
        // byte[] bits = cr.b;
        fos.write(classFile);
    }
    //另一种JDK字节码文件持久化方法
    public static void toFile(BookFacadeImpl obj) throws IOException {
        Class clazz = obj.getClass();
        String className = clazz.getName();
        FileOutputStream fos = new FileOutputStream(outputFile);
        ClassReader cr = new ClassReader(className);
        byte[] bits = cr.b;
        fos.write(bits);
    }
}
