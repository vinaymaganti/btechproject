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
try
{	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");

PreparedStatement pstmt=null;
pstmt=con.prepareStatement("select *from users where userid=? and flag=?");
pstmt.setString(1,userid);
pstmt.setString(2,"s");
ResultSet rs=pstmt.executeQuery();
rs.next();
String deptid=rs.getString(4);
int semester=rs.getInt(5);

PreparedStatement pstmt1=null;
pstmt1=con.prepareStatement("select *from event where deptid=? and semester=? and status=?");
pstmt1.setString(1,deptid);
pstmt1.setInt(2,semester);
pstmt1.setInt(3,1);
ResultSet rs1=pstmt1.executeQuery();
    
       if(rs1.next())
       { %><center><font size="5" color="red">Present Running events</font><br><br><%
           PreparedStatement pstmt2=null;
pstmt2=con.prepareStatement("select *from event where deptid=? and semester=? and status=?");
pstmt2.setString(1,deptid);
pstmt2.setInt(2,semester);
pstmt2.setInt(3,1);
ResultSet rs2=pstmt2.executeQuery();
while(rs2.next())
       {
    %>
   
                         <font size="4" color="blue">   <table><tr><td>Event id:</td><td><%=rs2.getInt(1)%></td></tr><br>
               <tr><td> Subject id:</td><td><%=rs2.getString(5)%></td></tr>
            <form name="frm" action="attend2.jsp">
                <input type="hidden" name="eventid" value="<%=rs2.getInt(1)%>">
                    <input type="hidden" name="time" value="<%=rs2.getInt(7)%>">
                        <input type="hidden" name="noq" value="<%=rs2.getInt(8)%>">
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="attend" value="attend"></td></tr></form></font>
           </table>  <br><br>
                    
                    <%

       }}
else
{
    out.print("<center>");
    out.print("<font size=5 color=red>");
out.print("No event exam scheduled for your class");
}}
catch(Exception e)
{
out.print(e);}

%>
</div></div><div class="clear" style="height:500px"></body></html>