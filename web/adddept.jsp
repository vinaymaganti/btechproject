<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<%
    	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
   
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
<script language="javascript">
   function use()
   {
      frm.deptname.focus();
   }

function check()
{
   k=frm.deptname.value.length; 
   j= frm.deptid.value.length;
   if( (k <=0 ) || ( j<=0))
   {
		 if(k<=0)
	 	{
			alert('Enter Department name');
			frm.deptname.value=""; 
			frm.deptname.focus();
			return false;
		 }
		if(j<=0)
		 {
			alert('Enter dept id');
			frm.deptid.value="";
			frm.deptid.focus();
			return false;
		   }
		   else
		   {
		   return true;
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


<div class="bd"><div id="page"><div id="main"><div class="content">
<h1><b>""ADMIN""</h1><center><h2><b>Add Department</h2></center>
<form method=post action="adddept2.jsp" name=frm onSubmit="return check()">
<br>
<br><br>
<center><b>
Department Name&nbsp;&nbsp;<input type=textbox name="deptname" size=25 maxlength=30></center><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Dept id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=name name="deptid" size=15 maxlength=4><br>
<br><center><input type="submit" name="Submit" value="add">
<br><br>




</div></div><div class="clear" style="height:500px">
</BODY>
</HTML>

