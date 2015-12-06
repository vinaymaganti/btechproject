<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<script language="javascript">
function use()
   {
      frm.studentid.focus();
   }

function check()
{
   j=frm.studentid.value.length; 
   k=frm.username.value.length; 
   l=frm.pass.value.length; 
   m=frm.cpass.value.length; 
   
		 if(j<=0)
	 	{
			alert('Enter student id');
			frm.studentid.value="";
                        frm.studentid.focus();
			return false;
		 }
		else if(k<=0)
		 {
			alert('Enter your name');
			frm.username.value="";
                        frm.username.focus();
			return false;
		   }
		else if(l<=0)
		 {
			alert('Enter password');
			frm.pass.value="";
                        frm.pass.focus();
			return false;
		 }
		else if(m<=0)
		 {
			alert('re enter your password');
			frm.cpass.value="";
                        frm.cpass.focus();
			return false;
		 }
		else	
		{ 	
	   var str1 = frm.pass.value;
          var str2 = frm.cpass.value;  
if(str1 != str2)
{
alert('Passwords doesnt match');
frm.pass.value="";
frm.cpass.value="";
frm.pass.focus();
return false;
} 
}

		   return true;
		   
} 
		
		
function validateR()
  {
  var selectedCombobox=(frm.deptid.value);
  var selectedCombobox1=(frm.semester.value);
  var selectedCombobox2=(frm.gender.value);
if( (selectedCombobox <=0 ) || (selectedCombobox1 <=0) || (selectedCombobox2 <=0))
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
               if(selectedCombobox2<=0)
		 {
			alert('select gender');
			return false;
		   }
		   else
		   {
		   return true;
		   }
   };
  }

  </script>

<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
</head>
<body>
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div>  
<div class="content"><div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">
<li class="current" style="border:none">


<a class="toplvl sf-with-ul" href="home.html">Home</a></li>
<li><a href="student.html" class="toplvl">Student</a></li>
<li><a class="toplvl sf-with-ul" href="faculty.html">Faculty</a></li>
<li><a class="toplvl sf-with-ul" href="admin.html">Admin</a></li></div></div>



<div class="bd"><div id="page"><div id="main"><div class="content"><h1><b>STUDENT Registration</h1>
<table align="center"><form method=post action="stureg2.jsp" name="frm" onSubmit="return check()">

      <tr><td><br></td></tr>
<tr><td>
Student Id</td><td><input type="text" name="studentid"></td></tr>
      <tr><td><br></td></tr>
<tr><td>
<b>  
Student Name</td><td>
<input type="text" name="username"></td></tr>
<tr><td><br></td></tr>
<tr><td><b>
Password</td><td>
<input type="password"  name="pass"><td></tr>
<tr><td><br></td></tr>
<tr><td><b>Reenter Password</td><td><input type="password" name="cpass" value=""></td></tr>
<tr><td><br></td></tr>
<tr><td><b>Select Department
</td><td>

    <select size=1 name=deptid>
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
</select></td></tr>
<tr><td><br></td></tr>
<tr><td><b>semester</td><td>
<select size=1 name=semester>
<option value="0">< - - -Select- - -></option>
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
</select></td></tr>
<tr><td><br></td></tr>
<tr><td><b>Gender</td><td>
<select size=1 name=gender>
<option value="0">< - - -Select- - -></option>
<option>Male</option>
<option>Female</option>
</select></td></tr>
<tr><td><br></td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name=submit type="submit" onclick="return validateR();"></td></tr>
</form></table>



</div></div><div class="clear" style="height:500px"></body></html>