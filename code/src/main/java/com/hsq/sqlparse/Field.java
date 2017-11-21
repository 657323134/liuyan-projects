package com.hsq.sqlparse;

import java.io.Serializable;

/**
 * 字段属性
 */
public class Field implements Serializable {

    private static final long serialVersionUID = -2048856147938458139L;
    private String name;                //字段名
    private String description = "";    //描述
    private String type;                //类型
    private int precision;              //小数位
    private int size;                   //
    private double range;               //
    private String rangeStr;            //
    private boolean notNull;            //是否不允许为空
    private String defaultValue;        //默认值
    private boolean primaryKey;         //是否是主键
    private String descKey;             //

    public void setRange() {
        double d1 = 0.0D;
        if (precision < 0) {
            d1 = Math.pow(10D, size) - 1.0D;
        }else {
            d1 = Math.pow(10D, size - precision) - 1.0D;
        }
        range = d1;
    }

    public void setRangeStr() {
        String s = "";
        StringBuffer stringbuffer = new StringBuffer();
        if (precision <= 0) {
            for (int l = 0; l < size; l++) {
                stringbuffer.append("9");
            }
        } else {
            for (int i1 = 0; i1 < size - precision; i1++) {
                stringbuffer.append("9");
            }
            stringbuffer.append(".");
            for (int j1 = 0; j1 < precision; j1++) {
                stringbuffer.append("9");
            }
        }
        rangeStr = stringbuffer.toString();
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the precision
     */
    public int getPrecision() {
        return precision;
    }

    /**
     * @param precision the precision to set
     */
    public void setPrecision(int precision) {
        this.precision = precision;
    }

    /**
     * @return the size
     */
    public int getSize() {
        return size;
    }

    /**
     * @param size the size to set
     */
    public void setSize(int size) {
        this.size = size;
    }

    /**
     * @return the notNull
     */
    public boolean isNotNull() {
        return notNull;
    }

    /**
     * @param notNull the notNull to set
     */
    public void setNotNull(boolean notNull) {
        this.notNull = notNull;
    }

    /**
     * @return the defaultValue
     */
    public String getDefaultValue() {
        return defaultValue;
    }

    /**
     * @param defaultValue the defaultValue to set
     */
    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    /**
     * @return the primaryKey
     */
    public boolean isPrimaryKey() {
        return primaryKey;
    }

    /**
     * @param primaryKey the primaryKey to set
     */
    public void setPrimaryKey(boolean primaryKey) {
        this.primaryKey = primaryKey;
    }

    /**
     * @return the descKey
     */
    public String getDescKey() {
        return descKey;
    }

    /**
     * @param descKey the descKey to set
     */
    public void setDescKey(String descKey) {
        this.descKey = descKey;
    }

    /**
     * @return the serialVersionUID
     */
    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    /**
     * @return the range
     */
    public double getRange() {
        return range;
    }

    /**
     * @return the rangeStr
     */
    public String getRangeStr() {
        return rangeStr;
    }

}