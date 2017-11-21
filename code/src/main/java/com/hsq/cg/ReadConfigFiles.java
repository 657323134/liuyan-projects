package com.hsq.cg;

import com.hsq.lib.ConvertString;

import java.io.*;
import java.util.Hashtable;
import java.util.StringTokenizer;

public class ReadConfigFiles {

    public static final String CONFIG_PATH = System.getProperty("user.dir") + File.separator + "config" + File.separator;

    public static final String RESULT_PATH = System.getProperty("user.dir") + File.separator + "result" + File.separator;

    public static final String TEMPLATE_PATH = System.getProperty("user.dir") + File.separator + "template" + File.separator;

    /**
     * 获取执行目录
     *
     * @return
     */
    @SuppressWarnings("deprecation")
    public static String getExecuteDir() {
        String[] confPath = null;
        DataInputStream dataInputStream = null;
        try {
            dataInputStream = new DataInputStream(new BufferedInputStream(new FileInputStream(CONFIG_PATH + "executeDir.txt")));
            confPath = ConvertString.omitBlank(dataInputStream.readLine()).split("=");
            if (confPath != null && confPath.length > 0) {
                return confPath[1];
            }
            return null;
        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        } finally {
            try {
                if (dataInputStream != null) {
                    dataInputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 获取配置参数
     *
     * @return Hashtable
     */
    @SuppressWarnings("deprecation")
    public static Hashtable<String, String> getPubConfigPara() {
        Hashtable<String, String> paraHashTable = new Hashtable<String, String>();
        DataInputStream pubFileInputStream = null;
        StringBuilder s = new StringBuilder();
        String s1 = "";
        String s2 = null;
        String s3 = null;

        try {
            String pubFile = CONFIG_PATH + getExecuteDir() + File.separator + "pub.txt";
            pubFileInputStream = new DataInputStream(new BufferedInputStream(new FileInputStream(pubFile)));

            for (; pubFileInputStream.available() != 0; ) {
                String as[] = ConvertString.omitBlank(pubFileInputStream.readLine()).split("=");

                if (as[0].equals("packageDir")) {
                    StringTokenizer stringtokenizer = new StringTokenizer(as[1], ".");
                    for (int i = 0; i < stringtokenizer.countTokens(); i++) {
                        s.append(File.separator + stringtokenizer.nextToken("."));
                    }
                    s1 = as[1];
                    paraHashTable.put("packageDir", s1);
                    paraHashTable.put("resultFileDir", s.toString());
                } else if (as[0].equals("resourcesPrefixJsp")) {
                    if (as[1].equals("(default)")) {
                        s2 = s1;
                    } else {
                        s2 = as[1];
                    }
                    paraHashTable.put("resourcesPrefixJsp", s2);
                } else if (as[0].equals("resourcesPrefixObjectForm")) {
                    if (as[1].equals("(default)")) {
                        s3 = s2;
                    } else {
                        s3 = as[1];
                    }
                    paraHashTable.put("resourcesPrefixObjectForm", s3);
                } else if (as[0].equals("resourcesPrefixObjectListForm")) {
                    String s4 = null;
                    if (as[1].equals("(default)")) {
                        s4 = s3;
                    } else {
                        s4 = as[1];
                    }
                    paraHashTable.put("resourcesPrefixObjectListForm", s4);
                } else if (as[0].equals("resourcesBundle")) {
                    String s5 = null;
                    if (as[1].equals("(null)")) {
                        s5 = "";
                    } else {
                        s5 = "bundle=\"" + as[1] + "\"";
                    }
                    paraHashTable.put("resourcesBundle", s5);
                } else if (as[0].equals("jspResultDir")) {
                    paraHashTable.put("resultjspFileDir", as[1]);
                    paraHashTable.put("strutsConfigDir", as[1].substring(as[1].indexOf("/"), as[1].length()));
                } else if (as[0].equals("objectName")) {
                    paraHashTable.put("objectName", as[1].toLowerCase());
                    paraHashTable.put("objectNameU", as[1].substring(0, 1).toUpperCase() + as[1].substring(1, as[1].length()));
                    paraHashTable.put("objectNameL", as[1].substring(0, 1).toLowerCase() + as[1].substring(1, as[1].length()));
                } else if (as[0].equals("applicationName")) {
                    paraHashTable.put("applicationName", as[1].trim());
                } else if (as[0].equals("tableName")) {
                    paraHashTable.put("tableName", as[1].trim());
                } else if (as[0].equals("tablename_cn")) {
                    as[1] = new String(as[1].trim().getBytes("8859_1"), "utf-8");
                    paraHashTable.put("tablename_cn", as[1]);
                } else if (as[0].equals("jndiName")) {
                    paraHashTable.put("jndiName", as[1]);
                } else if (as[0].equals("authorName")) {
                    paraHashTable.put("authorName", as[1].trim());
                }
            }

            File fieldFile = new File(CONFIG_PATH + getExecuteDir() + File.separator + "fieldlist.txt");
            if (fieldFile.exists()) {
                ReadFile readfile = new ReadFile();
                String[] fieldList = readfile.getFileContent(CONFIG_PATH + getExecuteDir() + File.separator + "fieldlist.txt");
                paraHashTable.put("fieldSumAddOne", "" + (fieldList.length + 1));
            }
        } catch (IOException exception) {
            exception.printStackTrace();
        } finally {
            if (pubFileInputStream != null) {
                try {
                    pubFileInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return paraHashTable;
    }

    /**
     * 获取模板配置信息
     *
     * @return tplConfContents
     */
    public static String[] getTplConfig() {
        ReadFile readfile = new ReadFile();
        String tplConfContents[] = readfile.getFileContent(TEMPLATE_PATH + "tplconfig.txt");

        return tplConfContents;
    }

    /**
     * @return
     */
    public static Hashtable<String, String> getPkContent() {
        Hashtable<String, String> hashtable = new Hashtable<String, String>();
        try {
            ReadFile readfile = new ReadFile();
            String as[] = null;
            as = readfile.getFileContent(CONFIG_PATH + getExecuteDir() + File.separator + "fieldlist.txt");
            for (int i = 0; i < as.length; i++) {
                String as1[] = as[i].split(",");
                if (as1[5].trim().equals("pk")) {
                    hashtable.put("pFieldName", as1[0]);
                    hashtable.put("pObjectNameL", ConvertString.changeFirstChar(as1[1], "L"));
                    hashtable.put("pObjectNameU", ConvertString.changeFirstChar(as1[1], "U"));
                }
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return hashtable;
    }

    /**
     * @return fieldConfContents
     */
    public static String[] getFieldCofig() {
        ReadFile readfile = new ReadFile();
        String fieldConfContents[] = readfile.getFileContent(CONFIG_PATH + getExecuteDir() + File.separator + "fieldlist.txt");
        return fieldConfContents;
    }
}