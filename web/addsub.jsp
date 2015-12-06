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
<script language="javascript">
function use()
   {
      frm.subjectname.focus();
   }

function check()
{
   k=frm.subjectname.value.length; 
   j= frm.subjectid.value.length;
   if( (k <=0 ) || ( j<=0))
   {
		 if(k<=0)
	 	{
			alert('Enter  subject name');
			frm.subjectname.value=""; 
			frm.subjectname.focus();
			return false;
		 }
		if(j<=0)
		 {
			alert('Enter subject id');
			frm.subjectid.value="";
			frm.subjectid.focus();
			return false;
		   }
		   else
		   {
		   return true;
		   }
   }
  }


function validateR()
  {
  var selectedCombobox=(frm.deptid.value);
  var selectedCombobox1=(frm.semester.value);
  if( (selectedCombobox <=0 ) || (selectedCombobox1 <=0))
   {
		 if(selectedCombobox<=0)
	 	{
			alert('select department');
			return false;
		 }
		if(selectedCombobox1<=0)
		 {
			alert('select semester');
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
<div class="bd"><div id="page"><div id="main"><div class="content"><H1>""ADMIN""</H1><CENTER><h2>Add Subject</h2>
<center>
<TABLE><form method=post action="addsub2.jsp" name="frm" onSubmit="return check()">
<TR><TD><BR></TD></TR>
<TR><TD>
<b>Subject Name</TD>
<TD><input type=textbox name="subjectname" size=25 maxlength=30></TD></TR>
<TR><TD><BR></TD></TR>
<TR><TD>
<b>subject id</TD>
<TD><input type=name name="subjectid" size=25 maxlength=4>(short form)</TD></TR>
<TR><TD><BR></TD></TR>
<TR><TD>
<b>Semester</TD>
<TD><select size=1 name=semester>
<option value="0">< - - -Select- - -></option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
</select></TD></TR>
<TR><TD><BR></TD></TR>
<TR><TD><b>Select Department</TD>
<TD><select size=1 name=deptid>
<option value="0">< - - -Select- - -></option>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	Statement stmt = con.createStatement();
ResultSet rs=stmt.executeQuery("select deptid from dept");
while(rs.next())
{
String dpt=rs.getString(1);
%>
<option><%=dpt%></option>
<%
} 	//rs.close();
	//st.close();
}

catch(Exception e)
{	
	e.printStackTrace();   
}%>
</select></TD>
<TR><TD><BR></TD></TR>
<TR><TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name=submit type="submit" onclick="return validateR();">
</TD></TR></TABLE></form>
</div></div><div class="clear" style="height:500px"></body></html>