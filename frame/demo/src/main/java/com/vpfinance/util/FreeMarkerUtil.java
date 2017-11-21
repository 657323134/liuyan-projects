package com.vpfinance.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.util.Map;

/**
 * FreeMarker工具
 *
 * @author ldd
 */
public class FreeMarkerUtil {


    private static final Logger logger = LoggerFactory.getLogger(FreeMarkerUtil.class);

    /**
     * 初始化配置
     */
    private static final Configuration CONFIGURATION = new Configuration() {
        {
            setClassForTemplateLoading(FreeMarkerUtil.class, "/");
            setDefaultEncoding("utf-8");
        }
    };

    /**
     * 执行
     *
     * @param config    配置信息
     * @param modelName 模板名字
     * @param encoding  编码
     * @param root      map
     * @return 填充后的文本
     * @throws IOException       文件操作异常
     * @throws TemplateException 填充异常
     */
    public static String execute(Configuration config, String modelName,
                                 String encoding, Map<?, ?> root) throws IOException,
            TemplateException {

        BufferedWriter writer = null;

        try {
            Template tp = config.getTemplate(modelName, encoding);

            StringWriter stringWriter = new StringWriter();
            writer = new BufferedWriter(stringWriter);
            tp.setEncoding(encoding);
            tp.process(root, writer);
            return stringWriter.toString();
        } finally {
            if (null != writer) {
                writer.flush();
                writer.close();
            }

        }

    }

    /**
     * 执行
     *
     * @param config       配置信息
     * @param modelName    模板名字
     * @param encoding     编码
     * @param root         map
     * @param outputStream 输出流
     * @throws TemplateException 填充异常
     * @throws IOException       文件操作异常
     */
    public static void execute(Configuration config, String modelName,
                               String encoding, Map<?, ?> root, FileOutputStream outputStream)
            throws TemplateException, IOException {

        Writer out = null;

        try {

            // 合并数据模型与模板
            out = new OutputStreamWriter(outputStream, encoding);

            // 获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
            config.getTemplate(modelName, encoding).process(root, out);

        } finally {

            try {
                out.flush();
                if (out != null) {
                    out.close();
                }
                outputStream.flush();
                if (outputStream != null) {
                    outputStream.close();
                }
            } catch (IOException e) {
                logger.error("关闭输出流失败！", e);
            }

        }

    }

    /**
     * 执行
     *
     * @param config   配置信息
     * @param name     模板名字
     * @param encoding 编码
     * @param root     map
     * @param file     保存至文件
     * @throws TemplateException 填充异常
     * @throws IOException       文件操作异常
     */
    public static void execute(Configuration config, String name,
                               String encoding, Map<?, ?> root, File file)
            throws TemplateException, IOException {
        execute(config, name, encoding, root, new FileOutputStream(file));
    }

    /**
     * 执行
     *
     * @param config       配置信息
     * @param modelName    模板名字
     * @param encoding     编码
     * @param root         map
     * @param filePathName 文件保存路径
     * @throws TemplateException 填充异常
     * @throws IOException       文件操作异常
     */
    public static void execute(Configuration config, String modelName,
                               String encoding, Map<?, ?> root, String filePathName)
            throws TemplateException, IOException {
        execute(config, modelName, encoding, root, new FileOutputStream(
                filePathName));
    }

    /**
     * 执行
     *
     * @param modelName    模板名字
     * @param encoding     编码
     * @param root         map
     * @param filePathName 文件保存路径
     * @throws TemplateException 填充异常
     * @throws IOException       文件操作异常
     */
    public static void execute(String modelName, String encoding,
                               Map<?, ?> root, String filePathName) throws TemplateException,
            IOException {
        execute(CONFIGURATION, modelName, encoding, root, new FileOutputStream(
                filePathName));
    }

    /**
     * 执行
     *
     * @param modelName 模板名字
     * @param encoding  编码
     * @param root      map
     * @return 填充后的文本
     * @throws IOException       文件操作异常
     * @throws TemplateException 填充异常
     */
    public static String execute(String modelName, String encoding,
                                 Map<?, ?> root) throws IOException, TemplateException {
        return execute(CONFIGURATION, modelName, encoding, root);
    }
}