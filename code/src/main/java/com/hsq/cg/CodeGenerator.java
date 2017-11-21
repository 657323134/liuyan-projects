package com.hsq.cg;

import com.hsq.sqlparse.DDLParser;
import com.hsq.sqlparse.Field;
import com.hsq.sqlparse.Table;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;

/**
 * @author hsq
 */
public class CodeGenerator {

    //配置文件的目录
    public static final String fieldConfigPath = ReadConfigFiles.CONFIG_PATH + ReadConfigFiles.getExecuteDir() + File.separator;

    public static final String sqlConfPath = ReadConfigFiles.CONFIG_PATH + ReadConfigFiles.getExecuteDir() + File.separator;

    //生成文件的目录
    public static final String srcResultDir = ReadConfigFiles.RESULT_PATH + "src" + ReadConfigFiles.getPubConfigPara().get("resultFileDir") + File.separator;

    public static final String jspResultDir = ReadConfigFiles.RESULT_PATH + "jsp" + ReadConfigFiles.getPubConfigPara().get("resultjspFileDir") + File.separator;

    public static final String confResultDir = ReadConfigFiles.RESULT_PATH + "config" + File.separator;

    public static final String encodeing = "UTF-8";

    /**
     * 根据模板生成代码文件
     *
     * @param makefiles
     */
    public static void processVaribleReplace(MakeFiles makefiles) {

        //取得模板配置文件的每一条配置
        String tplConf[] = ReadConfigFiles.getTplConfig();
        Hashtable<String, String> paraMap = ReadConfigFiles.getPubConfigPara();

        for (int k = 0; k < tplConf.length; k++) {
            if(!tplConf[k].startsWith("#")){
                String[] cfgList = tplConf[k].split(",");
                makefiles.replaceAllTplVar(cfgList[0], cfgList[1], cfgList[2], cfgList[3]);
            }
        }

        String s1 = jspResultDir + paraMap.get("objectNameL").toLowerCase();
        for (int i1 = 0; i1 < tplConf.length; i1++) {
            if(!tplConf[i1].startsWith("#")){
                String args3[] = tplConf[i1].split(",");
                if (args3[3].trim().equals("jsp")) {
                    makefiles.processLoop(s1 + args3[2]);
                }
            }
        }

        String[] fileNameSuffixs = {".java", "Search.java", "Service.java",  "Controller.java", "Dao.java", "Mapper.xml"};
        for(String fileNameSuffix:fileNameSuffixs){
            makefiles.processLoop(srcResultDir  + paraMap.get("objectNameU") + fileNameSuffix);
        }

        makefiles.processLoop(confResultDir + paraMap.get("objectNameL") + File.separator + "ApplicationResources.properties");
    }

    /**
     * 若用户没有手动编辑filed和属性对应文件, 则生成fieldList文件
     *
     * @param fieldListFile
     * @param fieldList
     * @param ddlparser
     */
    public static void generatFieldListFile(String fieldListFile, ArrayList<Table> fieldList, DDLParser ddlparser) {
        File file = new File(fieldListFile);
        if ((fieldList != null) && (!file.exists())) {
            FileWriter filewriter = null;
            try {
                filewriter = new FileWriter(fieldListFile);

                PrintWriter printwriter = new PrintWriter(filewriter);
                Table table = (Table) fieldList.get(0);

                for (int l = 0; l < table.getFieldList().size(); l++) {
                    Field field = (Field) table.getFieldList().get(l);

                    if(field.getName().equalsIgnoreCase("primary")){
                        continue;
                    }
                    if(field.getName().equalsIgnoreCase("unique")){
                        continue;
                    }

                    printwriter.print(field.getName().trim() + ",");
                    printwriter.print(field.getName().toLowerCase().trim() + ",");
                    printwriter.print(ddlparser.getVarType(field) + ",");
                    printwriter.print(field.getDescription().trim().replaceAll(",", ""));
                    printwriter.print("," + ddlparser.getDataType(field).trim() + ",");
                    if (field.isPrimaryKey()) {
                        printwriter.print("pk,");
                    } else {
                        printwriter.print("npk,");
                    }
                    if (field.isNotNull()) {
                        printwriter.print("r,");
                    } else {
                        printwriter.print("nr,");
                    }
                    printwriter.print(field.getRangeStr() + ",");
                    printwriter.print(field.getSize());
                    printwriter.print("\r\n");
                }
                printwriter.close();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (filewriter != null) {
                    try {
                        filewriter.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
}