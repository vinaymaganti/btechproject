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
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div><div class="content"><div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">
<li class="current" style="border:none">
<a class="toplvl sf-with-ul" href="facultyhome.jsp">Home</a></li>
<li><a href="#" class="toplvl">Profile</a>
<ul><li><a href="fview.jsp">View</a></li><li><a href="fchange.jsp">Change Password</a></li><li><a href="flogout.jsp">Logout</a></li></ul></li>

<li><a class="toplvl sf-with-ul" href="#">Mock Paper</a><ul><li><a href="mupload.jsp">Upload</a></li></ul></li>

<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="ecreate.jsp">Conduct exam</a></li><li><a href="ereports.jsp">Old reports</a></li></ul></li>
<li><a class="toplvl sf-with-ul" href="#">Instructions</a><ul><li><a href="instruct.jsp">instructions</a></li>
</div></div>
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Welcome <%= userid%></h1><br>
<center><h1><font color="red" size="5">Faculty must follow these instructions to know how to upload Question papers into database</font></h1>
<br>
    <h2><font size="4" color="orange">Format of question paper:</font></h2></center><br>
    <ol>
        <li>Every question starting with an question id</li><br>
        <li>Question in next line</li><br>
        <li>Option 1 for that question in next line</li><br>
        <li>Option 2 for that question in next line</li><br>
        <li>Option 3 for that question in next line</li><br>
        <li>Option 4 for that question in next line</li><br>
        <li>Actual answer for that question in next line</li><br>
        <li>Question id of next question in next line</li><br>
            <li><h2><font color="green">repeat for every question</font></h2></li><br>
        <li><h3><font color="red" size="2">Blank lines should not be allowed</font></h3></li><br>
        <li><h4><font color="red" size="3">no external data to be provided in paper apart from these....</font></h4></li>
        </ol>
        
        
        </div></div><div class="clear" style="height:500px"></body></html>