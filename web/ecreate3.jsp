<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page import="java.net.*" %> 
<%@ page session="true" %>


<% 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
%>
<%
String eventname =request.getParameter("eventname");
String noq =request.getParameter("noq");
String time =request.getParameter("time");
String deptid=request.getParameter("deptid");
String subjectid = request.getParameter("subjectname");
String semester=request.getParameter("semester");

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


<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="ecreate.jsp">Conduct exam</a></li></ul></li>
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
	String type="e";String a;String b="0";
	PreparedStatement pstmt = null;
        pstmt = con.prepareStatement("select max(eventid)+1 from event");
        ResultSet rs=pstmt.executeQuery();
        rs.next();
        if(rs.getString(1)==null)
{
a="1";
}
else
{
a=rs.getString(1);
}
        int k;

        PreparedStatement pstmt1 = null;
        pstmt1 = con.prepareStatement("insert into event values(?,?,?,?,?,?,?,?,?)");
        pstmt1.setString(1,a);
        pstmt1.setString(2,eventname);
        pstmt1.setString(3,userid);
        pstmt1.setString(4,deptid);
        pstmt1.setString(5,subjectid);
        pstmt1.setString(6,semester);
        pstmt1.setString(7,time);
        pstmt1.setString(8,noq);
        pstmt1.setInt(9,0);
        k= pstmt1.executeUpdate();

		if(k>0)
                {
                response.sendRedirect("ecreate4.jsp");
                }
                     }

             
                           
catch(Exception e)
{
    out.print(e);
}    
%>
</div></div><div class="clear" style="height:500px"></body></html>