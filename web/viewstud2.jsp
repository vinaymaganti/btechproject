<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<% 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);

String deptid = request.getParameter("deptid");%>
<%String semester = request.getParameter("semester");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
</head>
<body>
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div>  
<div class="content"><div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">
<li class="current" style="border:none">
<a class="toplvl sf-with-ul" href="adminhome.jsp">Home</a></li>
<li><a href="#" class="toplvl">Profile</a>
<ul>
<li><a href="changeadmin.jsp">Change Password</a></li><li><a href="adminlogout.jsp">Logout</a></li></ul></li>
<li><a href="#" class="toplvl">Student</a>
<ul><li><a href="viewstud.jsp">View Students</a></li><li><a href="stureset.jsp">Reset Password</a></li>
<li><a href="studelete.jsp">Remove Student</a></li></ul></li>

<li><a href="#" class="toplvl">Faculty</a>
<ul><li><a href="viewfac.jsp">View Faculty</a></li>
<li><a href="facdelete.jsp">Remove Faculty</a></li><li><a href="facreset.jsp">Reset passwword</a></li></ul></li>

<li><a href="" class="toplvl">Department</a>
<ul><li><a href="viewdept.jsp">View Department</a></li><li><a href="adddept.jsp">Add department</a></li>
<li><a href="deptdelete.jsp">Delete Department</a></li><li><a href="viewsub.jsp">View subjects</a></li>
<li><a href="addsub.jsp">add subject</a></li><li><a href="delsub.jsp">Remove subject</a></li></ul></li>
</div></div>
<div class="bd"><div id="page"><div id="main"><div class="content">
                <h1>""ADMIN""</h1><center><h2>STUDENTS LIST</h2></center><br>
<center><table width="75%" border=1>
<%try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	String flag="s";
	PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from users where deptid = ? and semester = ? and flag= ?");   
           pstmt.setString(1,deptid);  
           pstmt.setString(2,semester);
           pstmt.setString(3,flag);
           ResultSet rs = pstmt.executeQuery();
	   if(rs.next())
{
	out.print("<tr>");
	out.print("<th colspan=1><font size=5 color=black>User Id</th>");
	out.print("<th colspan=1><font size=5 color=black>UserName</th>");
	out.print("<th colspan=1><font size=5 color=black>Password</th>");
	out.print("<th colspan=1><font size=5 color=black>Dept</th>");
	out.print("<th colspan=1><font size=5 color=black>Semester</th>");
	out.print("<th colspan=1><font size=5 color=black>Gender</th>");
	
	out.print("</tr>");
PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("select * from users where deptid = ? and semester = ? and flag=?");   
            pstmt1.setString(1,deptid);  
           pstmt1.setString(2,semester); 
	   pstmt1.setString(3,flag);                   
           ResultSet rs1 = pstmt1.executeQuery();
	
	while(rs1.next())
	{
	out.print("<tr>");
	out.print("<td width=75><font size=4 color=blue>"+rs1.getString(1)+"</td>");
	out.print("<td width=75><font size=4 color=blue>"+rs1.getString(2)+"</td>");
        out.print("<td width=75><font size=4 color=blue>"+rs1.getString(3)+"</td>");
	out.print("<td width=75><font size=4 color=blue>"+rs1.getString(4)+"</td>");
	out.print("<td width=75><font size=4 color=blue>"+rs1.getString(5)+"</td>");
	out.print("<td width=75><font size=4 color=blue>"+rs1.getString(6)+"</td>");

	out.print("</tr>");
	}
	out.print("</table>");
}
else{

out.print("<center>");
out.print("<font size=4 color=green>");
out.print("Students of "+deptid+" of semester "+semester+" are not registered");
}
	
}
catch(Exception e)
    {
        e.printStackTrace();
        out.println("ERROR: "+ e + "\n");
    }
   %>
  
</table>



</div></div><div class="clear" style="height:1500px"></body></html>