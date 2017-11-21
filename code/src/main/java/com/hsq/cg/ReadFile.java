package com.hsq.cg;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class ReadFile {
	
	/**
	 * 获取文件内容
	 * @param srcFile
	 * @return String[]
	 * @author huangshaoqing
	 */
	public String[] getFileContent(String srcFile) {
		String contents[] = null;
		FileInputStream fileInputStream = null;
		try {
			File file = new File(srcFile);
			byte buff[] = new byte[(int) file.length()];
			
			fileInputStream = new FileInputStream(file);
			fileInputStream.read(buff);
			String fieldStr = new String(buff);
			
			contents = fieldStr.trim().split("\n");
		} catch (Exception exception) {
			exception.printStackTrace();
		} finally {
			if(fileInputStream!=null){
				try {
					fileInputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return contents;
	}

}