package com.hsq.sqlparse;

import java.io.Serializable;
import java.util.ArrayList;


public class Table implements Serializable {

	private static final long serialVersionUID = -6923575265277122006L;
	ArrayList<Field> fieldList;
	String tableName;
	String descKey;
	String tableDescription;

	/**
	 * @return the fieldList
	 */
	public ArrayList<Field> getFieldList() {
		return fieldList;
	}

	/**
	 * @param fieldList
	 *            the fieldList to set
	 */
	public void setFieldList(ArrayList<Field> fieldList) {
		this.fieldList = fieldList;
	}

	/**
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}

	/**
	 * @param tableName
	 *            the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	/**
	 * @return the descKey
	 */
	public String getDescKey() {
		return descKey;
	}

	/**
	 * @param descKey
	 *            the descKey to set
	 */
	public void setDescKey(String descKey) {
		this.descKey = descKey;
	}

	/**
	 * @return the tableDescription
	 */
	public String getTableDescription() {
		return tableDescription;
	}

	/**
	 * @param tableDescription
	 *            the tableDescription to set
	 */
	public void setTableDescription(String tableDescription) {
		this.tableDescription = tableDescription;
	}

	public void printTableInfo(){
		System.out.print("==================================\r\n");
		System.out.print("TableName:" + this.tableName + "\r\n");
		System.out.print("DescKey:" + this.descKey +"\r\n");
		System.out.print("TableDescription:" + this.tableDescription +"\r\n");
		for(Field f:this.fieldList){
        	System.out.print("FieldName:"+ f.getName() + "|FieldType:" + f.getType() + "\r\n");
        }
		System.out.print("==================================");
	}

}
