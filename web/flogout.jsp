<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<%
String userid = session.getAttribute("userid")+"";
String uname = session.getAttribute("uname")+"";
session.invalidate();  %>
<HTML>
<BODY bgcolor="violet">
<br><br><br><br><br><br><br><br>

    <font color=black size=4 face = arial><b><center>Bye&nbsp;<%=userid%></font> 
                  <font color=blue size=3 face = verdana></center></b></font> 
<br><font color=red size=3 face = arial><center><b>You have been successfully loggedout</b></center> </b></font>

<br><br><br> <font color = green size = 3 face = arial><center><b>
                       <a href = index.html><b>Main Page</b></a></center> </b></font>
<br><br><br>

</BODY>
</HTML>