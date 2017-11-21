package com.vpfinance.util.file;

import com.vpfinance.util.image.ThumbnailatorUtil;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

/**
 * 上传文件到本地
 */
public class FileUploadToLocal {

    private static final int BUFFER_SIZE = 16 * 1024;

    /*
     * 文件上传到本地
     *
     * */
    public static void upload(File src, File dst) {
        InputStream in = null;
        OutputStream out = null;
        try {
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(dst),
                    BUFFER_SIZE);
            byte[] buffer = new byte[BUFFER_SIZE];
            int len = 0;
            while ((len = in.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != in) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (null != out) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    /**
     * multi文件上传
     *
     * @param file
     * @param dst
     */
    public static String uploadmultiple(MultipartFile file, final String dst) {
        try {
            if (file == null || file.getSize() == 0) {
                return "1";
            }
            // 取得根目录

            final CommonsMultipartFile mf = (CommonsMultipartFile) file;
            String name = mf.getOriginalFilename();
            // 取得后缀
            String postfix = null;
            postfix = name.substring(name.indexOf(".")).toUpperCase();
            // 如果不是图片格式
            if (!postfix.equals(".JPG") && !postfix.equals(".GIF")
                    && !postfix.equals(".PNG") && !postfix.equals(".JPEG")) {
                return "2";
            }
            // 保存图片名称
            Random random = new Random();
            final String str = random.nextInt(9999) + new SimpleDateFormat("yyyyMMddHHmmss")
                    .format(new Date()) + random.nextInt(9999) + postfix;
            //读取存储文件路劲
            Properties prop = null;
            try {
                prop = PropertiesLoaderUtils.loadAllProperties("sys.properties");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            final String root = (String) prop.get("FILE_PATH");
            System.out.println(root);
            if (!createFolder(root + File.separator + dst)) {
                return null;
            }
            Thread t=new Thread(){
                public void run(){
                    File newFile = new File(root + File.separator + dst + File.separator + str);
                    try {
                        mf.getFileItem().write(newFile);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    ThumbnailatorUtil.compressByPercent(newFile.getAbsolutePath(), 1f, "");//google压缩插件
                    ThumbnailatorUtil.compressBySize(newFile.getAbsolutePath(), 200, "_200");
                    ThumbnailatorUtil.compressBySize(newFile.getAbsolutePath(), 800, "_800");
                }
            };
            t.start();

            return File.separator + dst + File.separator + str;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static String uploadmultiples(MultipartFile file, final String dst) {
        try {
            if (file == null || file.getSize() == 0) {
                return "1";
            }
            // 取得根目录

            final CommonsMultipartFile mf = (CommonsMultipartFile) file;
            String name = mf.getOriginalFilename();
            // 取得后缀
            String postfix = null;
            postfix = name.substring(name.indexOf(".")).toUpperCase();
            // 如果不是图片格式
            if (!postfix.equals(".JPG") && !postfix.equals(".GIF")
                    && !postfix.equals(".PNG") && !postfix.equals(".JPEG")) {
                return "2";
            }
            // 保存图片名称
            Random random = new Random();
            final String str = random.nextInt(9999) + new SimpleDateFormat("yyyyMMddHHmmss")
                    .format(new Date()) + random.nextInt(9999) + postfix;
            //读取存储文件路劲
            Properties prop = null;
            try {
                prop = PropertiesLoaderUtils.loadAllProperties("sys.properties");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            final String root = (String) prop.get("FILE_PATH");
            System.out.println(root);
            if (!createFolder(root + File.separator + dst)) {
                return null;
            }
            Thread t=new Thread(){
                public void run(){
                    File newFile = new File(root + File.separator + dst + File.separator + str);
                    try {
                        mf.getFileItem().write(newFile);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    ThumbnailatorUtil.compressByPercent(newFile.getAbsolutePath(), 1f, "");//google压缩插件
                    ThumbnailatorUtil.compressBySize(newFile.getAbsolutePath(), 200, "_200");
                    ThumbnailatorUtil.compressBySize(newFile.getAbsolutePath(), 800, "_800");
                }
            };
            t.start();

            return File.separator + dst + File.separator + str;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    private static boolean createFolder(String folderPath) {
        boolean result = false;

        File f = new File(folderPath);
        result = f.exists();
        if (!result) {
            result = f.mkdirs();
        }

        return result;
    }


}
