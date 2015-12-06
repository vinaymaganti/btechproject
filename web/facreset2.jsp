<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%String facid = request.getParameter("facid");
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
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Faculty Password</h1>

<%try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
	
String flag="f";
	   PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("select * from users where userid = ? and flag = ?");   
            pstmt1.setString(1,facid);  
           pstmt1.setString(2,flag);                    
           ResultSet rs1 = pstmt1.executeQuery();
	
	if(rs1.next())
	{
	
           PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("Update users set password =? where userid=? and flag =?");   
            pstmt.setString(1,facid);  
           pstmt.setString(2,facid);
           pstmt.setString(3,flag);
                               
           int c = pstmt.executeUpdate();
if(c==1)
{
              
out.print("<center>");
out.print("<br><center>Password Succesfully set as his/her id</center>");
}
}	

else{

out.print("<center>");
out.print("<font size=4 color=green>");
out.print("Student with ID "+facid+" Not Registered");
}
	
}
catch(Exception e)
    {
        e.printStackTrace();
        out.println("ERROR: "+ e + "\n");
    }
   %>
  
</table>



</div></div><div class="clear" style="height:500px"></body></html>