<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>


<%	            
       	 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);

        String deptid = request.getParameter("deptid");
        String semester = request.getParameter("semester");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme"/>
<script language="javascript">
function validateR()
  {
  var selectedCombobox=(frm.subjectname.value);
  var selectedCombobox1=(frm.unit.value);
  if( (selectedCombobox <=0 ) || (selectedCombobox1 <=0))
   {
		 if(selectedCombobox<=0)
	 	{
			alert('select subject');
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
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div><div class="content"><div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">
<li class="current" style="border:none">
<a class="toplvl sf-with-ul" href="facultyhome.jsp">Home</a></li>
<li><a href="#" class="toplvl">Profile</a>
<ul><li><a href="fview.jsp">View</a></li><li><a href="fchange.jsp">Change Password</a></li><li><a href="flogout.jsp">Logout</a></li></ul></li>

<li><a class="toplvl sf-with-ul" href="#">Mock Paper</a><ul><li><a href="mupload.jsp">Upload</a></li></ul></li>


<li><a class="toplvl sf-with-ul" href="#">Event Exam</a><ul><li><a href="ecreate.jsp">Conduct exam</a></li><li><a href="ereports.jsp">old reports</a></li></ul></li>
<li><a class="toplvl sf-with-ul" href="#">Instructions</a><ul><li><a href="instruct.jsp">instructions</a></li>
                </div></div>
<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Subjects</h1><br>
<center>
<%try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
	PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from subject where deptid = ? and semester = ?");   
           pstmt.setString(1,deptid);  
           pstmt.setString(2,semester);                
           ResultSet rs = pstmt.executeQuery();
	   if(rs.next())
{
	out.print("<br><center><font size=4>Subjects of "+deptid+" in semester "+semester+" are following </font></center><br>");
PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("select subjectid from subject where deptid = ? and semester = ?");   
            pstmt1.setString(1,deptid);  
           pstmt1.setString(2,semester);                    
           ResultSet rs1 = pstmt1.executeQuery();
	%>
 <table align="center"><form method=post action="mupload3.jsp" name="frm" onSubmit="return check()">
<tr><td><br></td></tr>
         <tr><td>
        
Select subject</td><td><select size=1 name=subjectname>
<option value="0">< - - -Select- - -></option>
	<%
while(rs1.next())
	{
	String subjectname=rs1.getString(1);
%>
<option><%=subjectname%></option>
<%
	}%>
	</select></td></tr>
<tr><td><br></td></tr>
        <tr><td>
       Select Unit</td><td><select name=unit>
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
         <tr><td><br></td></tr>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name=submit type="submit" onclick="return validateR();"></td></tr></table>
</form>
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
  




</div></div><div class="clear" style="height:500px"></body></html>