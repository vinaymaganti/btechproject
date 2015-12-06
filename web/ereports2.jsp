<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>


<%	        String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
        int e=Integer.parseInt(request.getParameter("eventid"));  
        	

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
             <font size="3"> <table border="1" width="100%">  
<tr><td>Roll Number</td><td>Name</td><td>marks</td></tr>
    <%

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
PreparedStatement pstmt=null;
pstmt=con.prepareStatement("select *from marks where eventid=?");
pstmt.setInt(1,e);
ResultSet rs=pstmt.executeQuery();
while(rs.next())
{
    String id=rs.getString(2);
PreparedStatement pstmt2=null;
pstmt2=con.prepareStatement("select *from users where userid=? and flag=?");
pstmt2.setString(1,id);
pstmt2.setString(2,"s");
ResultSet rs1=pstmt2.executeQuery();
rs1.next();
out.print("<tr><td>"+id+"</td>");
out.print("<td>"+rs1.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td></tr>");

}
}
catch(Exception ex)
               {
}
    %></table>
</div></div><div class="clear" style="height:500px"></body></html>
