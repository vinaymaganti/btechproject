<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>


<%	            
       	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
</head>
<body>
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div>  
<div class="content">
<div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">

<li class="current" style="border:none">
<a class="toplvl sf-with-ul" href="studenthome.jsp">Home</a></li>
<li><a href="#" class="toplvl">Profile</a>
<ul><li><a href="stuprof.jsp">View</a></li><li><a href="schange.jsp">Change Password</a></li></ul></li>

<li><a class="toplvl sf-with-ul" href="mockexam.jsp">Mock Exam</a></li>

<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="old.jsp">View old marks</li>
<li><a href="attend.jsp">Start Exam</li></ul><li>


<li><a class="toplvl sf-with-ul" href="stulogout.jsp">logout</a></li></div></div>


<div class="bd"><div id="page"><div id="main"><div class="content"><b><%=userid%>
<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
PreparedStatement pstmt=null;
pstmt=con.prepareStatement("select *from marks where studentid=?");
pstmt.setString(1,userid);
ResultSet rs=pstmt.executeQuery();
if(rs.next())
       {
    out.print("<center><table border=1 width=500>");
    out.print("<tr><td><font size=4 color=red>Subject id</td><td><font size=4 color=red>Marks</td></tr>");
PreparedStatement pstmt1=null;
pstmt1=con.prepareStatement("select *from marks where studentid=?");
pstmt1.setString(1,userid);
ResultSet rs1=pstmt1.executeQuery();
while(rs1.next())
{
    int e=rs1.getInt(1);
    PreparedStatement pstmt2=null;
pstmt2=con.prepareStatement("select *from event where eventid=?");
pstmt2.setInt(1,e);
   ResultSet rs2=pstmt2.executeQuery();
  rs2.next();
  out.print("<tr><td>"+rs2.getString(5)+"</td>");
out.print("<td>"+rs1.getString(3)+"</td></tr>");
}
out.print("</table>");
}
}



catch(Exception e){}
%>
</div></div><div class="clear" style="height:500px"></body></html>