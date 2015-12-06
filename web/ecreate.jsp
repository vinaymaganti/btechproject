<%-- 
    Document   : ecreate
    Created on : Feb 23, 2013, 9:08:33 AM
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
  <script>  
      function use()
   {
      frm.eventname.focus();
   }

   function check()
{
    
   j= frm.eventname.value.length;
   		 if(j<=0)
	 	{
			alert('Enter event name');
			frm.eventname.value=""; 
			frm.eventname.focus();
			return false;
		 }
		   else
		   {
		   return true;
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
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Event Exam</h1>
                
<br>
<center>
   <table align="center"> <form name="frm" action="ecreate2.jsp" onsubmit="check()">
<tr><td><br></td></tr>           
<tr><td><b>Event name</td><td><input type="name" name="eventname"></td>
<tr><td><br></td></tr>
    <tr><td><b>Dept id</td><td><select size=1 name=deptid>
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
<tr><td><b>Semester</td>
<td><select size=1 name=semester>
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
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name=submit type="submit" onclick="return validateR();"></td></tr>
</table></form>


</div></div><div class="clear" style="height:500px"></body></html>