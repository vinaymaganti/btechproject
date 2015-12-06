<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<html>
<table border="1">
<%
 short a=0;
  short b=1;
  short c=2;
  short d=3;
  int i=0;
   String   value1="", value2="",value3=" ", value4="";
    String filename ="C:/hello.xls"; 
    if (filename != null && !filename.equals("")) {
    try{
    FileInputStream fs =new FileInputStream(filename);
    HSSFWorkbook wb = new HSSFWorkbook(fs);
    for (int k = 0; k < wb.getNumberOfSheets(); k++){
    int j=i+1;
    HSSFSheet sheet = wb.getSheetAt(k);
    int rows  = sheet.getPhysicalNumberOfRows();
    for (int r = 0; r < rows; r++){
    HSSFRow row   = sheet.getRow(r);
    int     cells = row.getPhysicalNumberOfCells(); 
    out.write("<br>");
    HSSFCell cell1  = row.getCell(a);
      value1 = cell1.getStringCellValue();
      HSSFCell cell2  = row.getCell(b);
        value2 = cell2.getStringCellValue();
         HSSFCell cell3  = row.getCell(c);
         value3 = cell3.getStringCellValue();
          HSSFCell cell4  = row.getCell(d);
          value4 = cell4.getStringCellValue();
    %>
    <tr><td><%=value1%></td><td><%=value2%></td><td><%=value3%></td><td><%=value4%></td></tr>
    <%
    }
        i++;
    }
    }
    catch(Exception e){
        System.out.println(e);
    }
    }
    %>
    </table>
    </html>