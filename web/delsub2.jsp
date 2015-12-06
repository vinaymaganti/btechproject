<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%
 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);

String deptid = request.getParameter("deptid");%>
<%String semester = request.getParameter("semester");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
<script language="javascript">
function validateR()
{
  var selectedCombobox=(frm.subjectname.value);
  if (selectedCombobox=="0") {
  alert("Please Select subject to be deleted");
  return false;
  }
  return true;
  }
  </script><script>document.onkeydown = function() {    
    switch (event.keyCode) { 
        case 116 : //F5 button
            event.returnValue = false;
            event.keyCode = 0;
            return false; 
        case 82 : //R button
            if (event.ctrlKey) { 
                event.returnValue = false; 
                event.keyCode = 0;  
                return false; 
            } 
    }
}
</script>
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
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Subjects</h1><br>
<center>
<%try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
	PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from subject where deptid = ? and semester = ?");   
           pstmt.setString(1,deptid);  
           pstmt.setString(2,semester);                
           ResultSet rs = pstmt.executeQuery();
	   if(rs.next())
{
	out.print("<br><center><font size=4>Subjects of "+deptid+" in semester "+semester+" are following </font></center>");
PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("select subjectname from subject where deptid = ? and semester = ?");   
            pstmt1.setString(1,deptid);  
           pstmt1.setString(2,semester);                    
           ResultSet rs1 = pstmt1.executeQuery();
	%>
<form method=post action="delsub3.jsp" name="frm" onSubmit="return check()">
Select subject<select size=1 name=subjectname>
<option value="0">< - - -Select- - -></option>
	<%
while(rs1.next())
	{
	String subjectname=rs1.getString(1);
%>
<option><%=subjectname%></option>
<%
	}%>
	</select>
<br><br>
<input name=submit type="submit" onclick="return validateR();">
</form>
<%}
else
{

out.print("<center>");
out.print("<font size=4 color=green>");
out.print("Subjects Not added for that dept in that semister");
}
	
}
catch(Exception e)
    {
        e.printStackTrace();
        out.println("ERROR: "+ e + "\n");
    }
   %>
  




</div></div><div class="clear" style="height:500px"></body></html>