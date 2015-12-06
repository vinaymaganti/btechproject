<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%String semester = request.getParameter("semester");
 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />

<script language="javascript">
function validateR()
  {
  var selectedCombobox=(frm.subjectid.value);
  var selectedCombobox1=(frm.unit.value);
  if( (selectedCombobox <=0 ) || (selectedCombobox1 <=0))
   {
		 if(selectedCombobox<=0)
	 	{
			alert('select Subject');
			return false;
		 }
		if(selectedCombobox1<=0)
		 {
			alert('select Unit');
			return false;
		   }
		   else
		   {
		   return true;
		   }
   };
  }
  </script>
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
<br><h1>SELECT SUBJECT</h1>
<br>
<center>
<table border="0"><form method=post action="mockexam3.jsp" name="frm" onSubmit="return check()">
<tr><td>Select subject</td><td><select size=1 name=subjectid>
<option value="0">< - - -Select- - -></option>

<%try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
	PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select deptid from users where userid=?");   
           pstmt.setString(1,userid);                
           ResultSet rs = pstmt.executeQuery();
if(rs.next())
{
	  String deptid = rs.getString(1);
	   PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("select * from subject where deptid = ? and semester = ?");   
           pstmt1.setString(1,deptid);  
           pstmt1.setString(2,semester);                
           ResultSet rs1 = pstmt1.executeQuery();
	 
     while(rs1.next())
	{
	String subjectid=rs1.getString(1);
%>
<option><%=subjectid%></option>
<%
	}%>
	</select></td></tr>


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
  <tr><td><br></td></tr>
<tr><td>Select Unit</td><td><select name=unit>
<option value="0"><- - - select- - -></option>
<option >Unit 1</option>
<option >Unit 2</option>
<option >Unit 3</option>
<option >Unit 4</option>
<option >Mid 1</option>
<option >Unit 5</option>
<option >Unit 6</option>
<option >Unit 7</option>
<option >Unit 8</option>
<option >Grand Test</option>
</select></td></tr>
   <tr><td><br></td></tr>
   <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name=submit type="submit" onclick="return validateR();"></td></tr></table>
</form>



</div></div><div class="clear" style="height:500px"></body></html>