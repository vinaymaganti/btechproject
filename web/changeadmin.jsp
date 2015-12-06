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
      frm.opass.focus();
   }

function check()
{
   k=frm.opass.value.length; 
   l=frm.npass.value.length; 
   m=frm.cpass.value.length; 
   var str1;
   var str2;   

   if(k<=0)
   {
		alert('Enter  Old Password');
		frm.opass.value=""; 
		frm.opass.focus();
		return false;
   }
   else if(l <= 0)
        {
		alert('Enter  New Password');
		frm.npass.value=""; 
		frm.npass.focus();
		return false;
         }
   else if(m <= 0)
        {
		alert('Confirm New Password');
		frm.cpass.value=""; 
		frm.cpass.focus();
		return false;
         }
   else {
           str1 = frm.npass.value;
           str2 = frm.cpass.value;  
           if(str1 != str2)
           {
              alert('Passwords typed do not match, please re-enter your password.\n\n');
              return false;
            }       
        } 
   return true;
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


<form action='changeadmin2.jsp?userid=<%=userid%>'name=frm onSubmit="return check()" method = post>


<FONT  face="arial" size=3 COLOR=red><center><b>Change Password</b></CENTER></font>
  <br>

<FONT  face=arial size="2" COLOR="blue"><CENTER>Enter Old Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      </font>
     <input type=password name=opass size=15 maxlength=20><br><BR>
   <FONT  face=arial size="2" COLOR="blue"><CENTER>Enter New Password  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </font>
     <input type=password name=npass size=15 maxlength=20><br><BR>

   <FONT  face=arial size="2" COLOR="blue"><CENTER>ReType New Password    &nbsp;&nbsp;&nbsp;
        </font>
    <input type=password name=cpass size=15 maxlength=20><BR><BR>
<input type="submit" name="Submit" value="Submit">
</form>

</div></div><div class="clear" style="height:500px">
</BODY>
</HTML>

