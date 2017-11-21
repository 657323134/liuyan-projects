package com.vpfinance.util.image;

import net.coobird.thumbnailator.Thumbnails;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 图片处理工具类
 * <p/>
 * <p/>
 * 使用google框架，自行打jar包 ：http://code.google.com/p/thumbnailator/
 * <p/>
 * 需要引入maven
 * <p/>
 * <dependency>
 * <groupId>net.coobird</groupId>
 * <artifactId>thumbnailator</artifactId>
 * <version>[0.4, 0.5)</version>
 * </dependency>
 */
public class ThumbnailatorUtil {

    //图片大小标识
    public final static String LARGE = "large";
    public final static String MIDDLE = "middle";
    public final static String SMALL = "small";

    /**
     * 等比压缩  三张图片
     *
     * @param origialFilePath
     * @return
     */
    public static Map compressByPercent(String origialFilePath) {

        if (origialFilePath == null || "".equals(origialFilePath)) return null;

        String suffix = origialFilePath.substring(0, origialFilePath.indexOf(".")).toLowerCase();
        String postfix = origialFilePath.substring(origialFilePath.indexOf(".")).toLowerCase();

        Map<String, String> compressPathsMap = new HashMap<String, String>();

        try {

            String compresspath01 = suffix + SMALL + postfix;
            Thumbnails.of(origialFilePath).scale(0.1f).toFile(compresspath01);
            compressPathsMap.put(SMALL, compresspath01);

            String compresspath025 = suffix + MIDDLE + postfix;
            Thumbnails.of(origialFilePath).scale(0.25f).toFile(compresspath025);
            compressPathsMap.put(MIDDLE, compresspath025);

            String compresspath10 = suffix + LARGE + postfix;
            Thumbnails.of(origialFilePath).scale(1.0f).toFile(compresspath10);
            compressPathsMap.put(LARGE, compresspath10);

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return compressPathsMap;
    }

    /**
     * 重载 自定义等比压缩
     *
     * @param origialFilePath
     * @param percent         比例
     * @param extName         扩展名
     * @return
     */
    public static String compressByPercent(String origialFilePath, float percent, String extName) {

        if (origialFilePath == null || "".equals(origialFilePath)) return null;

        String suffix = origialFilePath.substring(0, origialFilePath.indexOf(".")).toLowerCase();
        String postfix = origialFilePath.substring(origialFilePath.indexOf(".")).toLowerCase();

        String compresspath = suffix + extName + postfix;

        try {
            Thumbnails.of(origialFilePath).scale(percent).toFile(compresspath);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return compresspath;
    }

    /**
     * 压缩图片为指定大小
     * @param origialFilePath 图片路径
     * @param size 大小
     * @param extName 扩展名
     * @return
     */
    public static String compressBySize(String origialFilePath, int size, String extName) {
        {

            if (origialFilePath == null || "".equals(origialFilePath)) return null;

            String suffix = origialFilePath.substring(0, origialFilePath.indexOf(".")).toLowerCase();
            String postfix = origialFilePath.substring(origialFilePath.indexOf(".")).toLowerCase();

            String compresspath = suffix + extName + postfix;

            try {
                Thumbnails.of(origialFilePath).size(size, size).toFile(compresspath);
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }

            return compresspath;
        }
    }


    public static void main(String[] args) {

        String origialFilePath = "E:" + File.separator + "imagecompress" + File.separator + "town.jpg";
        compressByPercent(origialFilePath);

    }


}
