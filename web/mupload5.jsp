<%@page import="javax.print.attribute.standard.MediaSize.Other"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page import="java.net.*" %> 
<%@ page session="true" %>


<% 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
</head>
<body>
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div><div class="content"><div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">
<li class="current" style="border:none">
<a class="toplvl sf-with-ul" href="facultyhome.jsp">Home</a></li>
<li><a href="#" class="toplvl">Profile</a>
<ul><li><a href="fview.jsp">View</a></li><li><a href="fchange.jsp">Change Password</a></li><li><a href="flogout.jsp">Logout</a></li></ul></li>

<li><a class="toplvl sf-with-ul" href="#">Mock Paper</a><ul><li><a href="mupload.jsp">Upload</a></li></ul></li>


<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="ecreate.jsp">Conduct exam</a></li><li><a href="ereports.jsp">old reports</a></li></ul></li>
<li><a class="toplvl sf-with-ul" href="#">Instructions</a><ul><li><a href="instruct.jsp">instructions</a></li>
                </div></div>
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Welcome <%= userid%></h1>    
                <%
    
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
PreparedStatement pstmt=null;
pstmt=con.prepareStatement("select max(mockid) from mock");
ResultSet rs=pstmt.executeQuery();
rs.next();
int e=rs.getInt(1);

  String id=br.readLine();
                id=br.readLine();
                id=br.readLine();
                id=br.readLine();
              int  qid=Integer.parseInt(br.readLine());              
              
PreparedStatement pstmt2 = null;
do
 {

String ques=br.readLine();
String op1=br.readLine();
String op2=br.readLine();
String op3=br.readLine();
String op4=br.readLine();
String actual=br.readLine();


pstmt2 = con.prepareStatement("insert into paper values(?,?,?,?,?,?,?,?,?,?)");

pstmt2.setInt(2,e);
pstmt2.setInt(3,qid);
pstmt2.setString(4,ques);
pstmt2.setString(5,op1);
pstmt2.setString(6,op2);
pstmt2.setString(7,op3);
pstmt2.setString(8,op4);
pstmt2.setString(9,actual);
pstmt2.setString(10,"m");   
pstmt2.setString(1,null);

int p= pstmt2.executeUpdate();

    qid=Integer.parseInt(br.readLine());
}
while(id!= null);

                         }
                           
catch(Exception ee)
{
    out.print("<center>");    
    out.print("<font size=5 color='red'>");
    out.print("mock paper successfully uploaded");
}    
%>
</div></div><div class="clear" style="height:500px"></body></html>