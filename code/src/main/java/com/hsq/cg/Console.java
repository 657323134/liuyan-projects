package com.hsq.cg;

import com.hsq.sqlparse.DDLParser;
import com.hsq.sqlparse.Table;

import java.io.File;
import java.util.ArrayList;

public class Console {

	/**
	 * 代码生成主程序.
	 * 
	 * @param args
	 */
	public static void main(String args[]) {
		try {
			MakeFiles makefiles = new MakeFiles();
			init();

			// 您的fieldlist文件是否配置完成？请检查(y/n)?:
			System.out.print("您的fieldlist文件是否配置完成？请检查(y/n)?");
			int i;
			while ((i = System.in.read()) != -1) {
				if ((char) i == 'y' || (char) i == 'Y') {
					break;
				}
				System.out.println("请配置fieldlist文件后重新运行!");
				System.exit(1);
			}

			// 生成结果文件存放目录
			makeResultDir();

			// 根据模板生成代码文件
			CodeGenerator.processVaribleReplace(makefiles);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		System.out.println("The End.");
	}

	public static void init() {
		DDLParser ddlparser = new DDLParser();
		
		// 数据表sql 文件
		ArrayList<Table> fieldList = ddlparser.parseSqlFile(CodeGenerator.sqlConfPath + "table.sql");
		
		// 数据字段配置文件
		String fieldListFile = CodeGenerator.fieldConfigPath + "fieldlist.txt";

		File f = new File(fieldListFile);
		// 如果fieldList文件不存在，生成该文件:filedlist.txt
		if (!f.exists()) {
			CodeGenerator.generatFieldListFile(fieldListFile, fieldList, ddlparser);
		}
	}

	/**
	 * 生成存放结果文件的文件夹
	 */
	public static void makeResultDir() {

		File srcDir1 = new File(ReadConfigFiles.RESULT_PATH + "src" + File.separator
				+ ReadConfigFiles.getPubConfigPara().get("resultFileDir")
				+ File.separator + "model" + File.separator);
		if (!srcDir1.exists()) {
			srcDir1.mkdirs();
		}

		File srcDir = new File(ReadConfigFiles.RESULT_PATH + "src" + File.separator
				+ ReadConfigFiles.getPubConfigPara().get("resultFileDir")
				+ File.separator + "servlet" + File.separator + "struts");
		if (!srcDir.exists()) {
			srcDir.mkdirs();
		}

		File jspDir = new File(ReadConfigFiles.RESULT_PATH
				+ "jsp"
				+ File.separator
				+ ((String) ReadConfigFiles.getPubConfigPara().get(
				"resultjspFileDir")).toLowerCase() + File.separator);
		if (!jspDir.exists()) {
			jspDir.mkdirs();
		}

		File confDir = new File(ReadConfigFiles.RESULT_PATH
				+ "config"
				+ File.separator
				+ (String) ReadConfigFiles.getPubConfigPara()
				.get("objectNameL"));
		if (!confDir.exists()) {
			confDir.mkdirs();
		}
	}

}
