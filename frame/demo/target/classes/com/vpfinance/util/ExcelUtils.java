package com.vpfinance.util;

import java.beans.PropertyDescriptor;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import jxl.Workbook;
import jxl.write.*;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;


public class ExcelUtils {

    // 用于表格标题
    private static WritableCellFormat wcf_tabletitle = null;

    // 用于正文左
    private static WritableCellFormat wcf_center = null;

    private static WritableCellFormat wcf_table = null;

    private static void init() {
        /** ************设置单元格字体************** */
        //字体
        WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10);

        WritableFont tableFont = new WritableFont(WritableFont.ARIAL, 12,
                WritableFont.NO_BOLD);


        /** ************以下设置几种格式的单元格************ */
        try {
            // 用于表格标题
            wcf_tabletitle = new WritableCellFormat(
                    tableFont);
            wcf_tabletitle.setBorder(jxl.format.Border.NONE, jxl.format.BorderLineStyle.THIN); // 线条
            wcf_tabletitle.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE); // 垂直对齐

            wcf_tabletitle.setAlignment(jxl.format.Alignment.CENTRE); // 水平对齐

            wcf_tabletitle.setWrap(true); // 是否换行

            // 用于正文
            wcf_center = new WritableCellFormat(NormalFont);
            wcf_center.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN); // 线条
            wcf_center.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE); // 垂直对齐
            wcf_center.setAlignment(jxl.format.Alignment.CENTRE);
            wcf_center.setWrap(true); // 是否换行

            wcf_table = new WritableCellFormat(NormalFont);
            wcf_table.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN); // 线条
            wcf_table.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE); // 垂直对齐
            wcf_table.setAlignment(jxl.format.Alignment.CENTRE);
            wcf_table.setBackground(jxl.format.Colour.GRAY_25);
            wcf_table.setWrap(true); // 是否换行
        } catch (WriteException e) {
            e.printStackTrace();
        }
        /** ************单元格格式设置完成****************** */
    }

    public static void main(String[] args) throws Exception {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < 10; i++) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("name1", "第一个——" + i);
            map.put("name2", "第er个——" + i);
            map.put("name3", "第san个——" + i);
            list.add(map);
        }
        // exportExcel(list);
    }

    /**
     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
     *
     * @param file       读取数据的源Excel
     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
     * @return 读出的Excel中数据的内容
     * @throws FileNotFoundException
     * @throws IOException
     */
    public static String[][] getData(File file, int ignoreRows) throws FileNotFoundException, IOException {
        List<String[]> result = new ArrayList<String[]>();
        int rowSize = 0;
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
        // 打开HSSFWorkbook
        POIFSFileSystem fs = new POIFSFileSystem(in);
        HSSFWorkbook wb = new HSSFWorkbook(fs);
        HSSFCell cell = null;
        for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
            HSSFSheet st = wb.getSheetAt(sheetIndex);
            // 第一行为标题，不取
            for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
                HSSFRow row = st.getRow(rowIndex);
                if (row == null) {
                    continue;
                }
                int tempRowSize = row.getLastCellNum() + 1;
                if (tempRowSize > rowSize) {
                    rowSize = tempRowSize;
                }
                String[] values = new String[rowSize];
                Arrays.fill(values, "");
                boolean hasValue = false;
                for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
                    String value = "";
                    cell = row.getCell(columnIndex);
                    if (cell != null) {
                        // 注意：一定要设成这个，否则可能会出现乱码
                        cell.setEncoding(HSSFCell.ENCODING_UTF_16);
                        switch (cell.getCellType()) {
                            case HSSFCell.CELL_TYPE_STRING:
                                value = cell.getStringCellValue();
                                break;
                            case HSSFCell.CELL_TYPE_NUMERIC:
                                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                                    Date date = cell.getDateCellValue();
                                    if (date != null) {
                                        value = new SimpleDateFormat("yyyy-MM-dd").format(date);
                                    } else {
                                        value = "";
                                    }
                                } else {
                                    value = new DecimalFormat("0").format(cell.getNumericCellValue());
                                }
                                break;
                            case HSSFCell.CELL_TYPE_FORMULA:
                                // 导入时如果为公式生成的数据则无值
                                if (!cell.getStringCellValue().equals("")) {
                                    value = cell.getStringCellValue();
                                } else {
                                    value = cell.getNumericCellValue() + "";
                                }
                                break;
                            case HSSFCell.CELL_TYPE_BLANK:
                                break;
                            case HSSFCell.CELL_TYPE_ERROR:
                                value = "";
                                break;
                            case HSSFCell.CELL_TYPE_BOOLEAN:
                                value = (cell.getBooleanCellValue() == true ? "Y" : "N");
                                break;
                            default:
                                value = "";
                        }
                    }
                    if (columnIndex == 0 && value.trim().equals("")) {
                        break;
                    }
                    values[columnIndex] = rightTrim(value);
                    values[columnIndex] = value.trim();
                    hasValue = true;
                }
                if (hasValue) {
                    result.add(values);
                }
            }
        }
        in.close();
        String[][] returnArray = new String[result.size()][rowSize];
        for (int i = 0; i < returnArray.length; i++) {
            returnArray[i] = result.get(i);
        }
        return returnArray;
    }

    /**
     * 去掉字符串右边的空格
     *
     * @param str 要处理的字符串
     * @return 处理后的字符串
     */
    public static String rightTrim(String str) {
        if (str == null) {
            return "";
        }
        int length = str.length();
        for (int i = length - 1; i >= 0; i--) {
            if (str.charAt(i) != 0x20) {
                break;
            }
            length--;
        }
        return str.substring(0, length);
    }

    public static HSSFWorkbook exportExcel(String sheetName, List<Map<String, Object>> list, String[] titles, String[] fieldNames) {
        HSSFWorkbook wb = new HSSFWorkbook();
        try {
            HSSFSheet sheet = null;
            // 对每个表生成一个新的sheet,并以表名命名
            if (sheetName == null) {
                sheetName = "sheet1";
            }
            sheet = wb.createSheet("sheet1");
            // 设置表头的说明
            HSSFRow topRow = sheet.createRow(0);

            // 设置列宽
            // sheet.setColumnWidth((short) 0, (short) 2000);
            // sheet.setColumnWidth((short) 1, (short) 5000);
            // sheet.setColumnWidth((short) 2, (short) 5000);
            // sheet.setColumnWidth((short) 3, (short) 2000);
            // sheet.setColumnWidth((short) 4, (short) 7000);
            // sheet.setColumnWidth((short) 5, (short) 7000);
            for (int i = 0; i < titles.length; i++) {
                setCellGBKValue(topRow.createCell((short) i), titles[i]);
            }

            int k = 1;
            for (Map<String, Object> map : list) {
                HSSFRow row = sheet.createRow(k);
                for (int i = 0; i < fieldNames.length; i++) {
                    setCellGBKValue(row.createCell((short) i), map.get(fieldNames[i]) + "");
                }
                k++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wb;
    }

    /**
     * excel导出模版(有待优化)
     *
     * @param sheetName  单元名称
     * @param list       数据列表
     * @param titles     列名
     * @param fieldNames 属性字段
     * @param os         导出io流
     * @param clas       指定Class
     * @author xty
     */
    public static void exportExcel(String sheetName, List<?> list, String[] titles, String[] fieldNames, OutputStream os, Class<?> clas) {
        try {
            WritableWorkbook wbook = Workbook.createWorkbook(os);
            if (null == sheetName) {
                sheetName = "sheet1";
            }
            WritableSheet wsheet = wbook.createSheet(sheetName, 0);
            //设置Excel字体
            WritableFont wfont = new WritableFont(WritableFont.ARIAL, 16, WritableFont.BOLD, false, jxl.format.UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.BLACK);
            WritableCellFormat titleFormat = new WritableCellFormat(wfont);
            String[] title = titles;
            //设置Excel表头
            for (int i = 0; i < title.length; i++) {
                Label excelTitle = new Label(i, 0, title[i], titleFormat);
                wsheet.addCell(excelTitle);
            }
            int c = 1; //用于循环时Excel的行号
            Iterator<?> it = list.iterator();
            while (it.hasNext()) {
                Class<?> clazz = clas;
                Object obj = it.next();
                Field[] fields = clazz.getDeclaredFields();
                //读数据
                Object value = null;
                for (Field f : fields) {
                    for (int i = 0; i < fieldNames.length; i++) {
                        if (f.getName().equals(fieldNames[i])) {
                            PropertyDescriptor pd = new PropertyDescriptor(f.getName(), clazz);
                            Method rM = pd.getReadMethod();
                            if (null != rM.invoke(obj)) {
                                value = rM.invoke(obj);
                                //如果type是日期的转换模式为yyyy-mm-dd
                                if (f.getGenericType().toString().equals("class java.util.Date")) {
                                    value = DateUtil.dateToString((java.util.Date) value);
                                }
                                Label content = new Label(i, c, value.toString());
                                wsheet.addCell(content);
                            }
                        }
                    }
                }
                c++;
            }
            wbook.write();
            wbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void setCellGBKValue(HSSFCell cell, String value) {
        cell.setCellType(HSSFCell.CELL_TYPE_STRING);
        // 设置CELL的编码信息
        cell.setEncoding(HSSFCell.ENCODING_UTF_16);
        if (value == null || "".equals(value) || "null".equals(value)) {
            cell.setCellValue("");
        } else {
            cell.setCellValue(value);
        }
    }

    public static WritableWorkbook generateXls(HttpServletResponse response, String name, String sheetName) {
        try {
            /** **********创建工作簿************ */
//            WritableWorkbook workbook = Workbook.createWorkbook(new File("/Users/candle/test.xls"));
            String mimetype = "application/vnd.ms-excel";
            response.setContentType(mimetype);

            String downFileName = name;
            String inlineType = "attachment"; // 是否内联附件
            response.setHeader("Content-Disposition", inlineType + ";filename=\"" + downFileName + "\"");
            WritableWorkbook workbook = Workbook.createWorkbook(response.getOutputStream());

            /** **********创建工作表************ */
            WritableSheet sheet = workbook.createSheet(sheetName, 0);

//            /** *********设置列宽**************** */
//            sheet.setColumnView(0, 15); // 第1列
//            sheet.setColumnView(1, 18); // 第2列
//            sheet.setColumnView(2, 13);
//            sheet.setColumnView(3, 13);
//            sheet.setColumnView(4, 15);
//            sheet.setColumnView(5, 15);
//            //设置行高
//            sheet.setRowView(0, 600, false);
//            sheet.setRowView(1, 400, false);
//            sheet.setRowView(7, 400, false);
            //设置页边距
            sheet.getSettings().setRightMargin(0.5);

            return workbook;
        } catch (Exception e) {
            System.out.println("在输出到EXCEL的过程中出现错误，错误原因：" + e.toString());
        }
        return null;
    }

    public static void addTitle(WritableSheet sheet, String tableName, List<String> title) throws WriteException {
        sheet.mergeCells(0, 0, title.size() - 1, 0);
        if (wcf_tabletitle == null) {
            init();
        }
        // table标题
        sheet.addCell(new Label(0, 0, tableName, wcf_tabletitle));
        //添加tr
        for (int i = 0; i < title.size(); i++) {
            sheet.addCell(new Label(i, 1, title.get(i), wcf_table));
        }
//        return sheet;
    }

    public static WritableCellFormat getWcf_center() {
        return wcf_center;
    }

    public static void setWcf_center(WritableCellFormat wcf_center) {
        ExcelUtils.wcf_center = wcf_center;
    }


    public static boolean downloadExcel(String title, Integer[] column,
                                        String[] header, List<Map<String, String>> content,
                                        HttpServletResponse response) {
        try {
            String filename = title
                    + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
            filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            response.reset();
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/msexcel");// 设置为下载application/x-download
            response.setHeader("Content-Disposition", "inline;filename=\""
                    + filename + ".xls\"");
            OutputStream os = response.getOutputStream();// 取得输出流
            // 提示下载
            WritableWorkbook wwb = Workbook.createWorkbook(os);
            // 创建excel工作表，指定名字和位置
            WritableSheet sheet = wwb.createSheet(title, 0);

            // 添加标题（行宽）
            for (int i = 0; i < header.length; i++) {
                sheet.addCell(new Label(i, 0, header[i]));
                // 设置excel列宽
                if (column != null) {
                    sheet.setColumnView(i, column[i]);
                } else {// 如果没有设置默认为宽度为50
                    sheet.setColumnView(i, 15);
                }
            }

            // 添加内容
            for (int i = 0; i < content.size(); i++) {
                for (int j = 0; j < content.get(i).size(); j++) {
                    sheet.addCell(new Label(j, i + 1, content.get(i).get(
                            header[j])
                            + ""));
                }
            }

            // 写入工作表
            wwb.write();
            wwb.close();
            os.close();
        } catch (IOException | WriteException e) {
            // TODO: handle exception
        }
        return true;
    }
}