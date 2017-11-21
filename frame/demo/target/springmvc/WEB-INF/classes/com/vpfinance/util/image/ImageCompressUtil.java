package com.vpfinance.util.image;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.apache.log4j.Logger;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;

public class ImageCompressUtil {
    private static final Logger LOGGER = Logger.getLogger(ImageCompressUtil.class);


    /**
     * 直接指定压缩后的宽高：
     * (先保存原文件，再压缩、上传)
     * 壹拍项目中用于二维码压缩
     *
     * @param oldFile   要进行压缩的文件全路径
     * @param width     压缩后的宽度
     * @param height    压缩后的高度
     * @param quality   压缩质量
     * @param smallIcon 文件名的小小后缀(注意，非文件后缀名称),入压缩文件名是yasuo.jpg,则压缩后文件名是yasuo(+smallIcon).jpg
     * @return 返回压缩后的文件的全路径
     */
    public static String zipImageFile(String oldFile, int width, int height,
                                      float quality, String smallIcon) {
        if (oldFile == null) {
            return null;
        }
        String newImage = null;
        try {
            /**对服务器上的临时文件进行处理 */
            BufferedImage srcFile = ImageIO.read(new File(oldFile));
            width = srcFile.getWidth();
            height = srcFile.getHeight();
            /** 宽,高设定 */
            BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            tag.getGraphics().drawImage(srcFile, 0, 0, width, height, null);
            String filePrex = oldFile.substring(0, oldFile.indexOf('.'));
            /** 压缩后的文件名 */
            newImage = filePrex + smallIcon + oldFile.substring(filePrex.length());
            /** 压缩之后临时存放位置 */
            FileOutputStream out = new FileOutputStream(newImage);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(tag);
            /** 压缩质量 */
            jep.setQuality(quality, true);
            encoder.encode(tag, jep);
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newImage;
    }

    /**
     * 保存文件到服务器临时路径(用于文件上传)
     *
     * @param fileName
     * @param is
     * @return 文件全路径
     */
    public static String writeFile(String fileName, InputStream is) {
        if (fileName == null || fileName.trim().length() == 0) {
            return null;
        }
        FileOutputStream fos = null;
        try {
            /** 首先保存到临时文件 */
            fos = new FileOutputStream(fileName);
            byte[] readBytes = new byte[512];// 缓冲大小
            int readed = 0;
            while ((readed = is.read(readBytes)) > 0) {
                fos.write(readBytes, 0, readed);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return fileName;
    }

    /**
     * 等比例压缩算法：
     * 算法思想：根据压缩基数和压缩比来压缩原图，生产一张图片效果最接近原图的缩略图
     *
     * @param srcURL  原图地址
     * @param deskURL 缩略图地址
     * @param comBase 压缩基数
     * @param scale   压缩限制(宽/高)比例  一般用1：
     *                当scale>=1,缩略图height=comBase,width按原图宽高比例;若scale<1,缩略图width=comBase,height按原图宽高比例
     * @throws Exception
     * @author shenbin
     * @createTime 2014-12-16
     * @lastModifyTime 2014-12-16
     */
    public static void saveMinPhoto(String srcURL, String deskURL, double comBase,
                                    double scale) throws Exception {
        File srcFile = new File(srcURL);
        Image src = ImageIO.read(srcFile);
        int srcHeight = src.getHeight(null);
        int srcWidth = src.getWidth(null);
        int deskHeight = 0;// 缩略图高
        int deskWidth = 0;// 缩略图宽
        double srcScale = (double) srcHeight / srcWidth;
        /**缩略图宽高算法*/
        if ((double) srcHeight > comBase || (double) srcWidth > comBase) {
            if (srcScale >= scale || 1 / srcScale > scale) {
                if (srcScale >= scale) {
                    deskHeight = (int) comBase;
                    deskWidth = srcWidth * deskHeight / srcHeight;
                } else {
                    deskWidth = (int) comBase;
                    deskHeight = srcHeight * deskWidth / srcWidth;
                }
            } else {
                if ((double) srcHeight > comBase) {
                    deskHeight = (int) comBase;
                    deskWidth = srcWidth * deskHeight / srcHeight;
                } else {
                    deskWidth = (int) comBase;
                    deskHeight = srcHeight * deskWidth / srcWidth;
                }
            }
        } else {
            deskHeight = srcHeight;
            deskWidth = srcWidth;
        }
        BufferedImage tag = new BufferedImage(deskWidth, deskHeight, BufferedImage.TYPE_3BYTE_BGR);
        tag.getGraphics().drawImage(src, 0, 0, deskWidth, deskHeight, null); //绘制缩小后的图
        FileOutputStream deskImage = new FileOutputStream(deskURL); //输出到文件流
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(deskImage);
        encoder.encode(tag); //近JPEG编码
        deskImage.close();
    }


    public static void copyDirectiory(String sourceDir, String targetDir) throws IOException {

        //新建目标目录

        (new File(targetDir)).mkdirs();

        //获取源文件夹当下的文件或目录
        File[] file = (new File(sourceDir)).listFiles();

        for (int i = 0; i < file.length; i++) {

            if (file[i].isDirectory()) {
                //准备复制的源文件夹
                String dir1 = sourceDir + file[i].getName();
                //准备复制的目标文件夹
                String dir2 = targetDir + "/" + file[i].getName();

                copyDirectiory(dir1, dir2);
            }
        }

    }


    public static void main(String args[]) throws Exception {

//		ImageCompressUtil.zipImageFile("D:/work/img/hahaha.JPG", 1280, 1280, 1f, "x2");
        //单个图片压缩，可调整comBase参数改变图片大小
//		ImageCompressUtil.saveMinPhoto("D:/work/img/hahaha.JPG", "D:/work/img/s_hahaha.JPG", 800, 1d);


        String dirpath = "D:\\borroserfilesbak";//原文件夹路径
        String dir_bakpath = "D:\\borroserfiles";//复制文件夹路径


        File dir = new File(dirpath);

        File dir_bak = new File(dir_bakpath);

        (new File(dir_bakpath)).mkdirs();


        //复制文件夹

        File[] file = (new File(dirpath)).listFiles();
        for (int i = 0; i < file.length; i++) {

            if (file[i].isDirectory()) {
                //复制目录
                String sorceDir = dirpath + File.separator + file[i].getName();
                String targetDir = dir_bakpath + File.separator + file[i].getName();
                copyDirectiory(sorceDir, targetDir);
            }
        }

//		File dir_bak = new File(dir_bakpath);
//
//		(new File(dir_bakpath)).mkdirs();
//
//
//		//复制文件夹
//
//		File[] file=(new File(dirpath)).listFiles();
//		for (int i = 0; i < file.length; i++) {
//
//			if(file[i].isDirectory()){
//				//复制目录
//				String sorceDir=dirpath+File.separator+file[i].getName();
//				String targetDir=dir_bakpath+File.separator+file[i].getName();
//				copyDirectiory(sorceDir, targetDir);
//			}
//		}

        if (dir.exists()) {
            File[] files = dir.listFiles();
            if (files.length > 0) {
                for (File f : files) {
                    if (!f.isDirectory()) {
                        String filename = f.getName();

                        String srcpath = dirpath + File.separator + filename;

                        String distpath = dir_bakpath + File.separator + filename;//缩小

                        String distpath2 = dir_bakpath + File.separator + "t_" + filename;//缩略图

                        try {
                            ImageCompressUtil.saveMinPhoto(srcpath, distpath, 8000, 0.5d);
                            LOGGER.info("success--s--->" + filename);
                            ImageCompressUtil.saveMinPhoto(srcpath, distpath2, 139, 0.9d);
                            LOGGER.info("success--t--->" + filename);
                        } catch (Exception e) {
//							e.printStackTrace();
                            LOGGER.info("fail--->" + filename);
                        }
                    }
                }
            }
        }


    }
}
