<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<% 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
        String mockid=request.getParameter("mockid");
                long num=Long.parseLong(request.getParameter("num"));
        int i=1;
        String ans[]=new String[1000];
       String sol[]=new String[1000];
          for(i=1;i<=num;i++)
                       {
       ans[i]=request.getParameter("ans"+i);
       sol[i]=request.getParameter("radio"+i);
        }
        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
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
<br><h1>Mock Exam</h1>
<br>
<%
int count=0;
for(i=1;i<=num;i++)
       {
    if(ans[i].equals(sol[i]))
        count++;
}
%>
<br><center>
    <h1><b><font size="4" color='red'>Your score is <%=count%></font></b></h1>
    <br>
        To View correct answers click on answers<br><br>
<form action="mockexam5.jsp">
    <input type="hidden" name="num" value="<%=num%>"/>
                <input type="hidden" name="mockid" value="<%=mockid%>"/>
           
 <input type=submit name="answers" value="answers"></form>

        
</div></div><div class="clear" style="height:500px"></body></html>