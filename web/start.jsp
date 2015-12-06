<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>


<%	            
        	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
String eventid=request.getParameter("eventid");
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

<li><a class="toplvl sf-with-ul" href="#">Mock Paper</a><ul><li><a href="mupload.jsp">Upload</a></li><li><a href="mremove.jsp">Remove uploaded</a></li></ul></li>


<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="ecreate.jsp">Conduct exam</a></li><li><a href="ereports.jsp">Old reports</a></li></ul></li>
</div></div>
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Welcome <%= userid%></h1>
                
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
PreparedStatement pstmt = null;
int n=1;
        pstmt = con.prepareStatement("update event set status=? where eventid=?");
pstmt.setInt(1,n);
pstmt.setString(2,eventid);
int k=pstmt.executeUpdate();
if(k>=1)
{
    
out.print("<br>");
out.print("<center>");
out.print("<font size=4>Event Exam Started Successfully</font>");
pstmt.close();
con.close();
}
}
catch(Exception e)
               {
out.print(e);
}
	%>
</div></div><div class="clear" style="height:500px"></body></html>