<%-- 
    Document   : schange
    Created on : Feb 17, 2013, 11:22:20 AM
    Author     : maganti vinay kumar
--%>

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
   else{
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
<br><h1>Change Password</h1>
    <form action='schange2.jsp?userid=<%=userid%>'name=frm onSubmit="return check()" method = post>


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

