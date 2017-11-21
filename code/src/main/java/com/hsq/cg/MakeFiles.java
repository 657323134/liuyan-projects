package com.hsq.cg;

import com.hsq.lib.ConvertString;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;

public class MakeFiles {
    ReadFile readFile;

    int fieldNum;

    //配置文件的目录
    public static final String fieldConfigPath = ReadConfigFiles.CONFIG_PATH + ReadConfigFiles.getExecuteDir() + File
            .separator;

    public static final String sqlConfPath = ReadConfigFiles.CONFIG_PATH + ReadConfigFiles.getExecuteDir() + File
            .separator;

    //生成文件的目录
    public static final String srcResultDir = ReadConfigFiles.RESULT_PATH + "src" + ReadConfigFiles.getPubConfigPara()
            .get("resultFileDir").toLowerCase() + File.separator;

    public static final String jspResultDir = ReadConfigFiles.RESULT_PATH + "jsp" + ReadConfigFiles.getPubConfigPara()
            .get("resultjspFileDir").toLowerCase() + File.separator;

    public static final String confResultDir = ReadConfigFiles.RESULT_PATH + "config" + File.separator;

    /**
     *
     */
    MakeFiles() {
        readFile = new ReadFile();
        fieldNum = -1;
    }

    /**
     * 将数据替换模板中的标记
     *
     * @param templatePath   模板路径
     * @param subFolder      子目录
     * @param targetFileName 生成的文件名
     * @param targetFolder   所在目录
     */
    public void replaceAllTplVar(String templatePath, String subFolder, String targetFileName, String targetFolder) {
        try {
            String templateContent[] = readFile.getFileContent(ReadConfigFiles.TEMPLATE_PATH + ConvertString.omitBlank(templatePath));

            String targetFileContent = "";
            if (targetFolder.trim().equals("src")) {
                targetFileContent = srcResultDir + ConvertString.omitBlank(subFolder) + File.separator + ReadConfigFiles.getPubConfigPara().get("objectNameU") + ConvertString.omitBlank(targetFileName);
                printGenterationLog(ReadConfigFiles.getPubConfigPara().get("objectNameU") + ConvertString.omitBlank(targetFileName));

            }
            if (targetFolder.trim().equals("jsp")) {
                targetFileContent = jspResultDir + (ReadConfigFiles.getPubConfigPara().get("objectNameL")).toLowerCase() + ConvertString.omitBlank(targetFileName);
                printGenterationLog(ReadConfigFiles.getPubConfigPara().get("objectNameL") + ConvertString.omitBlank(targetFileName));

            }
            if (targetFolder.trim().equals("config")) {
                targetFileContent = confResultDir + ReadConfigFiles.getPubConfigPara().get("objectNameL") + File.separator + ConvertString.omitBlank(targetFileName);
                printGenterationLog(ConvertString.omitBlank(targetFileName));
            }

            FileWriter filewriter = new FileWriter(targetFileContent.trim());
            PrintWriter printwriter = new PrintWriter(filewriter);

            for (int i = 0; i < templateContent.length; i++) {
                printwriter.println(replaceAll(templateContent[i]).replaceAll("\r", ""));
            }
            printwriter.close();
            filewriter.close();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    /**
     * 根据模板的标记生成代码
     *
     * @param fileContent
     */
    public void processLoop(String fileContent) {
        try {
            String as[] = readFile.getFileContent(fileContent.trim());
            String as1[] = ReadConfigFiles.getFieldCofig();
            StringBuffer stringbuffer = new StringBuffer(100);

            for (int i = 0; i < as.length; i++){
                if (as[i].indexOf("<L>") != -1) {
                    StringBuffer astringbuffer[] = new StringBuffer[9];
                    while (as[++i].indexOf("</L>") == -1)
                        if (as[i].indexOf("<LA>") != -1) {
                            StringBuffer stringbuffer1 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LA>") == -1; stringbuffer1.append(as[i] + "\n")) ;
                            astringbuffer[0] = stringbuffer1;
                        } else if (as[i].indexOf("<LP>") != -1) {
                            StringBuffer stringbuffer2 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LP>") == -1; stringbuffer2.append(as[i] + "\n")) ;
                            astringbuffer[1] = stringbuffer2;
                        } else if (as[i].indexOf("<LNP>") != -1) {
                            StringBuffer stringbuffer3 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LNP>") == -1; stringbuffer3.append(as[i] + "\n")) ;
                            astringbuffer[2] = stringbuffer3;
                        } else if (as[i].indexOf("<LS>") != -1) {
                            StringBuffer stringbuffer4 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LS>") == -1; stringbuffer4.append(as[i] + "\n")) ;
                            astringbuffer[3] = stringbuffer4;
                        } else if (as[i].indexOf("<LR>") != -1) {
                            StringBuffer stringbuffer5 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LR>") == -1; stringbuffer5.append(as[i] + "\n")) ;
                            astringbuffer[4] = stringbuffer5;
                        } else if (as[i].indexOf("<LT>") != -1) {
                            StringBuffer stringbuffer6 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LT>") == -1; stringbuffer6.append(as[i] + "\n")) ;
                            astringbuffer[5] = stringbuffer6;
                        } else if (as[i].indexOf("<LN>") != -1) {
                            StringBuffer stringbuffer7 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LN>") == -1; stringbuffer7.append(as[i] + "\n")) ;
                            astringbuffer[6] = stringbuffer7;
                        } else if (as[i].indexOf("<LI>") != -1) {
                            StringBuffer stringbuffer8 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LI>") == -1; stringbuffer8.append(as[i] + "\n")) ;
                            astringbuffer[7] = stringbuffer8;
                        } else if (as[i].indexOf("<LF>") != -1) {
                            StringBuffer stringbuffer9 = new StringBuffer(100);
                            for (; as[++i].indexOf("</LF>") == -1; stringbuffer9.append(as[i] + "\n")) ;
                            astringbuffer[8] = stringbuffer9;
                        }
                    stringbuffer.append(processLoopArea(astringbuffer, as1));
                } else {
                    stringbuffer.append(as[i] + "\n");
                }
            }
            FileWriter filewriter = new FileWriter(fileContent.trim());
            PrintWriter printwriter = new PrintWriter(filewriter);
            printwriter.println(stringbuffer.toString().replaceAll("\r\r", ""));
            printwriter.close();
            filewriter.close();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    /**
     * @param astringbuffer
     * @param as
     * @return
     */
    public StringBuffer processLoopArea(StringBuffer astringbuffer[], String as[]) {
        StringBuffer stringbuffer = new StringBuffer(100);
        for (int i = 0; i < as.length; i++) {
            fieldNum = i;
            String as1[] = as[i].split(",");
            String s = getLoopType(as1[4].trim());
            boolean flag = false;
            if (as1[5].trim().equals("pk")) {
                flag = true;
            }

            if (flag && astringbuffer[1] != null) {
                stringbuffer.append(replaceField(replaceAll(astringbuffer[1].toString()), as1));
            }

            if (!flag && astringbuffer[2] != null) {
                stringbuffer.append(replaceField(replaceAll(astringbuffer[2].toString()), as1));
            }

            if (s.equals("LS")) {
                if (astringbuffer[0] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[0].toString()), as1));
                } else if (astringbuffer[3] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[3].toString()), as1));
                }
            }
            if (s.equals("LT")) {
                if (astringbuffer[0] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[0].toString()), as1));
                } else if (astringbuffer[4] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[4].toString()), as1));
                } else if (astringbuffer[5] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[5].toString()), as1));
                }
            }
            if (s.equals("LI")) {
                if (astringbuffer[0] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[0].toString()), as1));
                } else if (astringbuffer[4] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[4].toString()), as1));
                } else if (astringbuffer[6] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[6].toString()), as1));
                } else if (astringbuffer[7] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[7].toString()), as1));
                }
            }
            if (s.equals("LF")) {
                if (astringbuffer[0] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[0].toString()), as1));
                } else if (astringbuffer[4] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[4].toString()), as1));
                } else if (astringbuffer[6] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[6].toString()), as1));
                } else if (astringbuffer[8] != null) {
                    stringbuffer.append(replaceField(replaceAll(astringbuffer[8].toString()), as1));
                }
            }
        }

        return stringbuffer;
    }

    /**
     * @param type
     * @return
     */
    public String getLoopType(String type) {

        ArrayList<String> arraylist = new ArrayList<String>();
        String[] charArr = {"nvarchar","char","text","ntext","varchar","VARCHAR2","NVARCHAR2","CHAR","NCHAR"};
        for(String charEle:charArr){
            arraylist.add(charEle);
        }

        ArrayList<String> arraylist1 = new ArrayList<String>();
        String[] dateArr = {"datetime","Datetime","DATETIME","date","Date","DATE"};
        for(String charEle:charArr){
            arraylist.add(charEle);
        }

        ArrayList<String> arraylist2 = new ArrayList<String>();
        String[] intArr = {"bigint","tinyint","int","Int","INT"};
        for(String intEle:intArr){
            arraylist2.add(intEle);
        }

        ArrayList<String> arraylist3 = new ArrayList<String>();
        String[] doubleArr = {"double","Double","DOUBLE","float","Float","FLOAT","NUMBER","Number","number"};
        for(String doubleEle:doubleArr){
            arraylist3.add(doubleEle);
        }

        String loopType = type;

        //字符串
        if (arraylist.contains(type)) {
            loopType = "LS";
        }
        //日期
        if (arraylist1.contains(type)) {
            loopType = "LT";
        }
        //整型
        if (arraylist2.contains(type)) {
            loopType = "LI";
        }
        //浮点
        if (arraylist3.contains(type)) {
            loopType = "LF";
        }
        return loopType;
    }

    /**
     * @param s
     * @param as
     * @return
     */
    public String replaceField(String s, String as[]) {
        String requiredMsg = "";
        String requiredValid = "";
        if (as[6].equals("r")) {
            requiredMsg = "<spring:message code=\"validation.required\"/>";
            requiredValid = "required, ";
        }
        String s3 = as[7];
        String s4;
        s4 = s.replaceAll("@fieldType", as[2]);
        s4 = s4.replaceAll("@typeByGet", ConvertString.changeFirstChar(as[2], "U"));
        s4 = s4.replaceAll("@fieldNameL", ConvertString.changeFirstChar(as[1], "L"));
        s4 = s4.replaceAll("@fieldNameU", ConvertString.changeFirstChar(as[1], "U"));
        s4 = s4.replaceAll("@fieldNameA", as[0]);
        s4 = s4.replaceAll("@fieldDesc", as[3].replaceAll("\r", ""));
        s4 = s4.replaceAll("@range", s3);
        s4 = s4.replaceAll("@requiredResources", requiredMsg);
        s4 = s4.replaceAll("@requiredValidation", requiredValid);
        s4 = s4.replaceAll("@maxlength", as[8].trim());
        s4 = s4.replaceAll("@fieldNumber", String.valueOf(fieldNum));
        s4 = s4.replaceAll("@fieldNumAddOne", String.valueOf(fieldNum + 1));

        return s4;
    }

    /**
     * @param content
     * @return
     */
    public String replaceAll(String content) {
        String fileContent;
        Hashtable<String, String> paraHashTable = ReadConfigFiles.getPubConfigPara();
        Hashtable<String, String> contentHashTable = ReadConfigFiles.getPkContent();

        fileContent = content.replaceAll("@packageDir", paraHashTable.get("packageDir"));
        fileContent = fileContent.replaceAll("@objectNameU", paraHashTable.get("objectNameU"));
        fileContent = fileContent.replaceAll("@objectNameL", paraHashTable.get("objectNameL"));
        fileContent = fileContent.replaceAll("@objectNameAL", paraHashTable.get("objectName"));
        fileContent = fileContent.replaceAll("@jndiName", paraHashTable.get("jndiName"));
        fileContent = fileContent.replaceAll("@tableName", paraHashTable.get("tableName"));
        fileContent = fileContent.replaceAll("@tablename_cn", paraHashTable.get("tablename_cn"));
        fileContent = fileContent.replaceAll("@fieldSumAddOne", paraHashTable.get("fieldSumAddOne"));
        fileContent = fileContent.replaceAll("@pFieldName", contentHashTable.get("pFieldName"));
        fileContent = fileContent.replaceAll("@pObjectNameL", contentHashTable.get("pObjectNameL"));
        fileContent = fileContent.replaceAll("@pObjectNameU", contentHashTable.get("pObjectNameU"));
        fileContent = fileContent.replaceAll("@resultjspFileDir", paraHashTable.get("resultjspFileDir"));
        fileContent = fileContent.replaceAll("@resourcesPrefixJsp", paraHashTable.get("resourcesPrefixJsp"));
        fileContent = fileContent.replaceAll("@resourcesPrefixObjectForm", paraHashTable.get("resourcesPrefixObjectForm"));
        fileContent = fileContent.replaceAll("@resourcesPrefixObjectListForm", paraHashTable.get("resourcesPrefixObjectListForm"));
        fileContent = fileContent.replaceAll("@resourcesBundle", paraHashTable.get("resourcesBundle"));
        fileContent = fileContent.replaceAll("@applicationName", paraHashTable.get("applicationName"));
        fileContent = fileContent.replaceAll("@authorName", paraHashTable.get("authorName"));

        return fileContent;
    }

    /**
     * @param fileName
     */
    public void printGenterationLog(String fileName) {
        System.out.println(fileName + " \u521B\u5EFA\u6210\u529F");
    }

}
