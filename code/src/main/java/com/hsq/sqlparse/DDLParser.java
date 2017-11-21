package com.hsq.sqlparse;


import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

public class DDLParser {

    /**
     * parseSqlFile 解析SQL文件,用于将DDL定义文件解析成相应的表名和字段名
     *
     * @param sqlFile
     * @return
     */
    public ArrayList<Table> parseSqlFile(String sqlFile) {
        ArrayList<Table> arraylist = new ArrayList<Table>();
        LineNumberReader lineNumberReader = null;

        try {
            File file = new File(sqlFile);
            if (!file.exists()) {
                throw new IOException("FileParser: no such source file: " + sqlFile);
            }
            if (!file.isFile()) {
                throw new IOException("FileParser: can't read directory: " + sqlFile);
            }
            if (!file.canRead()) {
                throw new IOException("FileParser: source file is unreadable: " + sqlFile);
            }

            lineNumberReader = new LineNumberReader(new FileReader(file));
            Table table = null;

            for (String line = lineNumberReader.readLine(); line != null; ) {
                if (line.trim().toUpperCase().startsWith("CREATE TABLE")) {
                    table = getTableInfo(lineNumberReader, line);
                    arraylist.add(table);
                }else if (line.trim().toUpperCase().startsWith("COMMENT")) {
                    LineParser(lineNumberReader, arraylist, line);
                }else if (line.trim().toUpperCase().startsWith("ALTER")) {
                    b(lineNumberReader, arraylist, line);
                }
                line = lineNumberReader.readLine();
                if (line != null) {
                    line = symbolReplace(line);
                }
            }

        } catch (FileNotFoundException filenotfoundexception) {
            filenotfoundexception.printStackTrace();
        } catch (IOException ioexception) {
            ioexception.printStackTrace();
        } finally {
            if (lineNumberReader != null) {
                try {
                    lineNumberReader.close();
                } catch (IOException ioexception1) {
                    ioexception1.printStackTrace();
                }
            }
        }

        return arraylist;
    }

    /**
     * @param linenumberreader
     * @param s
     *
     * @return Table
     * @throws IOException
     */
    private Table getTableInfo(LineNumberReader linenumberreader, String line) throws IOException {
        Table table = new Table();
        for (StringTokenizer stringtokenizer = new StringTokenizer(line); stringtokenizer.hasMoreTokens(); ) {
            String s1 = stringtokenizer.nextToken();
            if (!s1.equalsIgnoreCase("CREATE") && !s1.equalsIgnoreCase("TABLE")) {
                table.setTableName(s1);
                break;
            }
        }

        String s2 = "";
        ArrayList<Field> arraylist = null;
        while (s2 != null) {
            s2 = linenumberreader.readLine();
            if (s2 == null) {
                break;
            }
            s2 = symbolReplace(s2);
            if (s2.startsWith("(") || s2.indexOf("(") >= 0) {
                arraylist = getFieldList(linenumberreader, s2);
                break;
            }
        }

        table.setFieldList(arraylist);
        return table;
    }

    private ArrayList<Field> getFieldList(LineNumberReader linenumberreader, String s) throws IOException {

        ArrayList<Field> arraylist = new ArrayList<Field>();
        while (s != null) {
            if (s.trim().length() > 2 && s.startsWith(" ") && s.indexOf(";") < 0) {
                Field field = getField(s);
                arraylist.add(field);
            }
            s = linenumberreader.readLine();
            if (s != null) {
                s = symbolReplace(s);
            }
            if ( s.startsWith(")")) {
                break;
            }
        }
        return arraylist;
    }

    private void LineParser(LineNumberReader linenumberreader, ArrayList arraylist, String s)
            throws IOException {
        if (s == null || s.trim().length() == 0) {
            return;
        }
        StringTokenizer stringtokenizer = new StringTokenizer(s);
        if (stringtokenizer.hasMoreTokens() && stringtokenizer.nextToken().equalsIgnoreCase("COMMENT") && stringtokenizer.hasMoreTokens() && stringtokenizer.nextToken().equalsIgnoreCase("ON")) {
            String s1 = null;
            String s2 = null;
            String s3 = null;
            if (stringtokenizer.hasMoreTokens()) {
                s1 = stringtokenizer.nextToken();
            }
            if (stringtokenizer.hasMoreTokens()) {
                s2 = stringtokenizer.nextToken();
            }
            s = linenumberreader.readLine();
            if (s == null) {
                return;
            }
            while (s.trim().length() == 0) {
                s = linenumberreader.readLine();
                if (s != null) {
                    s = symbolReplace(s);
                }else {
                    return;
                }
            }
            if (s != null && s.trim().toUpperCase().startsWith("IS")) {
                StringTokenizer stringtokenizer1 = new StringTokenizer(s.trim(), "'");
                if (stringtokenizer1.hasMoreTokens() && stringtokenizer1.nextToken().trim().equalsIgnoreCase("IS") && stringtokenizer1.hasMoreTokens()) {
                    s3 = stringtokenizer1.nextToken().trim();
                }
            }
            if (s1.equalsIgnoreCase("TABLE")) {
                for (int i = 0; i < arraylist.size(); i++) {
                    Table table = (Table) arraylist.get(i);
                    if (!table.getTableName().equals(s2)) {
                        continue;
                    }
                    table.setTableDescription(s3);
                    break;
                }

            } else if (s1.equalsIgnoreCase("COLUMN")) {
                String s4 = s2.substring(0, s2.lastIndexOf("."));
                String s5 = s2.substring(s2.lastIndexOf(".") + ".".length());
                for (int j = 0; j < arraylist.size(); j++) {
                    Table table1 = (Table) arraylist.get(j);
                    if (!table1.getTableName().equalsIgnoreCase(s4)) {
                        continue;
                    }
                    ArrayList<Field> arraylist1 = table1.getFieldList();
                    for (int k = 0; k < arraylist1.size(); k++) {
                        Field field = (Field) arraylist1.get(k);
                        if (!s5.equalsIgnoreCase(field.getName())) {
                            continue;
                        }
                        field.setDescription(s3);
                        break;
                    }

                    break;
                }
            }
        }
    }


    private void b(LineNumberReader linenumberreader, ArrayList<Table> arraylist, String line) throws IOException {
        if (line == null || line.trim().length() == 0) {
            return;
        }
        StringTokenizer stringtokenizer = new StringTokenizer(line);
        if (stringtokenizer.hasMoreTokens() && stringtokenizer.nextToken().equalsIgnoreCase("ALTER")
                && stringtokenizer.hasMoreTokens() && stringtokenizer.nextToken().equalsIgnoreCase("TABLE")) {

            String s1 = null;
            String s2 = "";
            if (stringtokenizer.hasMoreTokens()) {
                s1 = stringtokenizer.nextToken();
            }
            line = linenumberreader.readLine();
            if (line == null) {
                return;
            }
            while (line.trim().length() == 0) {
                line = linenumberreader.readLine();
                if (line != null) {
                    line = symbolReplace(line);
                } else {
                    return;
                }
            }
            if (line != null && line.toUpperCase().indexOf("PRIMARY") >= 0) {
                StringTokenizer stringtokenizer1 = new StringTokenizer(line.trim(), "()");
                if (stringtokenizer1.hasMoreTokens()) {
                    stringtokenizer1.nextToken();
                }
                if (stringtokenizer1.hasMoreTokens()) {
                    s2 = stringtokenizer1.nextToken().trim();
                }
                for (int i = 0; i < arraylist.size(); i++) {
                    Table table = (Table) arraylist.get(i);
                    if (!table.getTableName().equalsIgnoreCase(s1)) {
                        continue;
                    }
                    ArrayList<Field> arraylist1 = table.getFieldList();
                    for (int j = 0; j < arraylist1.size(); j++) {
                        Field field = (Field) arraylist1.get(j);
                        if (!s2.equalsIgnoreCase(field.getName())) {
                            continue;
                        }
                        field.setPrimaryKey(true);
                        break;
                    }
                    break;
                }
            } else {
                return;
            }
        }
    }

    private Field getField(String s) {
        Field field = new Field();
        String s1 = "";
        if (s.lastIndexOf("--") > 0) {
            s1 = s.substring(0, s.lastIndexOf("--")).trim();
        }else {
            s1 = s.trim();
        }
        if (s1.trim().endsWith(",")) {
            s1 = s1.substring(0, s1.length() - ",".length());
        }
        String s2 = "";
        if (s.lastIndexOf("--") > 0) {
            s2 = s.substring(s.lastIndexOf("--")).trim();
        }
        StringTokenizer stringtokenizer = new StringTokenizer(s1);
        if (stringtokenizer.hasMoreTokens()) {
            String s3 = stringtokenizer.nextToken();
            field.setName(s3);
        }
        if (stringtokenizer.hasMoreTokens()) {
            String s4 = stringtokenizer.nextToken();
            if (s4.indexOf("(") > 0) {
                s4 = s4.replace("BYTE", "").replace("byte", "").replace(" ", "");
                field.setType(s4.substring(0, s4.indexOf("(")));
                String s5 = s4.substring(s4.indexOf("(") + 1, s4.indexOf(")"));
                if (s5.indexOf(",") > 0) {
                    field.setSize(Integer.parseInt(s5.substring(0, s5.indexOf(","))));
                    field.setPrecision(Integer.parseInt(s5.substring(s5.indexOf(",") + 1)));
                    field.setRange();
                    field.setRangeStr();
                } else {
                    field.setSize(Integer.parseInt(s5));
                    if (s4.indexOf("NUMBER") != -1) {
                        field.setRange();
                        field.setRangeStr();
                    }
                }
            } else {
                field.setType(s4);
            }
        }
        if (stringtokenizer.hasMoreTokens() && stringtokenizer.nextToken().equalsIgnoreCase("NOT")) {
            field.setNotNull(true);
        }
        if (!s2.equals("") && s2.toUpperCase().startsWith("-- @FIELD")) {
            field.setDescription(s2.substring("--".length() + "@FIELD".length()));
        }
        return field;
    }

    /**
     *
     * @param s
     * @return
     */
    private String symbolReplace(String s) {
        s = s.replaceAll("[`\\[\\]\"]", "");
        s = s.replaceAll("\\t|\\s+", " ");
        return s;
    }

    /**
     * DB-JAVA类型对应
     * @param field
     * @return
     */
    public String getVarType(Field field) {
        Map<String,String> typeMap =  getTypeDefine();
        String dbFieldType = field.getType();
        String javaFieldType ;
        if(typeMap.containsKey(dbFieldType)){
            javaFieldType = typeMap.get(dbFieldType);
        }else{
            javaFieldType = dbFieldType;
        }

        return javaFieldType;
    }

    /**
     * 获取数据库字段类型
     *
     * @param field
     * @return
     */
    public String getDataType(Field field) {
        ArrayList<String> arraylist = new ArrayList<String>();
        arraylist.add("tinyint");
        arraylist.add("int");
        arraylist.add("NUMBER");
        String fieldType = "";
        String confFieldType = field.getType();
        if (arraylist.contains(confFieldType) && field.getPrecision() <= 0) {
            fieldType = "INT";
        } else if (arraylist.contains(confFieldType) && field.getPrecision() > 0) {
            fieldType = "FLOAT";
        } else {
            fieldType = confFieldType;
        }
        return fieldType;
    }

    public static Map<String,String> getTypeDefine(){
        Map map = new HashMap<String,String>();
        map.put("nvarchar","String");
        map.put("char","String");
        map.put("text","String");
        map.put("ntext","String");
        map.put("varchar","String");
        map.put("VARCHAR2","String");
        map.put("NVARCHAR2","String");
        map.put("CHAR","String");
        map.put("NCHAR","String");
        map.put("datetime","String");
        map.put("DATE","String");
        map.put("tinyint","int");
        map.put("int","int");
        map.put("NUMBER", "float");
        map.put("float","float");
        map.put("double","float");

        return map;
    }

    public static void main(String[] args) {
        DDLParser parser = new DDLParser();
        String filePath = "/Users/shaoqinghuang/Documents/project/CG/config/ad/table.sql";
        ArrayList<Table> l = parser.parseSqlFile(filePath);

        for (Table t : l) {
            ArrayList<Field> fs = t.getFieldList();
            for (Field f : fs) {
                System.out.println(f.getName().toString() + "|" + f.getPrecision());
            }
        }
    }
}