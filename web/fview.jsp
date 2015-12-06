<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>
<jsp:useBean id="clock" class="java.util.Date" /> 
<%String userid = session.getAttribute("userid")+"";%>
<%session.setAttribute("userid", userid);%>
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


<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="ecreate.jsp">Conduct exam</a></li><li><a href="ereports.jsp">Old reports</a></li></ul></li>
<li><a class="toplvl sf-with-ul" href="#">Instructions</a><ul><li><a href="instruct.jsp">instructions</a></li>
                </div></div>
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Profile</h1>

<br>

<center><table border="0">
        <tr><td colspan="2"><font size="4" color="red">Details of the faculty</font></td></tr>
        <tr><td><br></td></tr>
<%try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
	
PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("select username,userid,deptid,gender from users where userid = ?");   
            
	   pstmt1.setString(1,userid);  
                              
           ResultSet rs1 = pstmt1.executeQuery();
	
	while(rs1.next())
	{
        
	out.print("<tr>");
	out.print("<td width=75><font size=4 color=blue>Name         :</td><td><font size=4 color=blue>"+rs1.getString(1)+"</td>");
	out.print("</tr><td><br></td><tr>");
	out.print("<td width=75><font size=4 color=blue>User Id:</td><td><font size=4 color=blue>"+rs1.getString(2)+"</td>");
	out.print("</tr><td><br></td><tr>");
        out.print("<td width=75><font size=4 color=blue>Dept Id:</td><td><font size=4 color=blue>"+rs1.getString(3)+"</td>");
	out.print("</tr><td><br></td><tr>");
	out.print("<td width=75><font size=4 color=blue>Gender:</td><td><font size=4 color=blue>"+rs1.getString(4)+"</td>");
	out.print("</tr>");
	}
	out.print("</table>");
}
	

catch(Exception e)
    {
        e.printStackTrace();
        out.println("ERROR: "+ e + "\n");
    }
   %>
  
</table>



</div></div><div class="clear" style="height:500px"></body></html>