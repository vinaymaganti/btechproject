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
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div><div class="content"><div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">
<li class="current" style="border:none">
<a class="toplvl sf-with-ul" href="facultyhome.jsp">Home</a></li>
<li><a href="#" class="toplvl">Profile</a>
<ul><li><a href="fview.jsp">View</a></li><li><a href="fchange.jsp">Change Password</a></li><li><a href="flogout.jsp">Logout</a></li></ul></li>

<li><a class="toplvl sf-with-ul" href="#">Mock Paper</a><ul><li><a href="mupload.jsp">Upload</a></li></ul></li>


<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="ecreate.jsp">Conduct exam</a></li><li><a href="ereports.jsp">Old reports</a></li></ul></li>
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
PreparedStatement pstmt = null;
        pstmt = con.prepareStatement("select * from event where userid=? and status=?");
pstmt.setString(1,userid);
pstmt.setInt(2,0);
ResultSet rs=pstmt.executeQuery();
if(rs.next())
       {%><center>  <font colo="red" size="6" align="center">Following are pending events that are created by you</font><br><br>
<%
    PreparedStatement pstmt1 = null;
        pstmt1 = con.prepareStatement("select * from event where userid=? and status=?");
pstmt1.setString(1,userid);
pstmt1.setInt(2,0);
ResultSet rs1=pstmt1.executeQuery();
while(rs1.next())
       {%>
     
    <font size="4" colour="purple">Eventid:<%=rs1.getString(1)%><br>Semester:<%=rs1.getString(6)%><br>Dept:<%=rs1.getString(4)%><br>
                    <form name="frm" action="eview.jsp">
    <input type="hidden" name="eventid" value="<%=rs1.getString(1)%>">
    <input type="submit" value="view" name="view">
                    </form>
    
   <br>
        <br>
<%
}}
else
{
out.print("<center>");
out.print("<font size=5 color=purple>");
out.print("No pending events");
}

}
catch(Exception e)
               {
out.print(e);
}
	%>
</div></div><div class="clear" style="height:500px"></body></html>