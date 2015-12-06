<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%
String unit = request.getParameter("unit");
String subjectid=request.getParameter("subjectid");
 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);%>

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
<form name='frm' action="mockexam4.jsp">
<%
try
{
int i=1;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
PreparedStatement pstmt1= null;
   
  pstmt1 = con.prepareStatement("Select * from mock where paperid=? and subjectid=?");

pstmt1.setString(1,unit);
pstmt1.setString(2,subjectid);
  
ResultSet rs1=pstmt1.executeQuery();
if(rs1.next())     
     {
    int mockid=rs1.getInt(1);

PreparedStatement pstmt2=con.prepareStatement("select max(questionid) from paper where mockid=?");
pstmt2.setInt(1,mockid);
ResultSet rs3=pstmt2.executeQuery();
rs3.next();
String number=rs3.getString(1);
int n=Integer.parseInt(number);
if(n>0)
       {
    
PreparedStatement pstmt3=con.prepareStatement("select * from paper where mockid=?");
pstmt3.setInt(1,mockid);
ResultSet rs2=pstmt3.executeQuery();

    while(rs2.next())
{

    
%>

      <tr>
        <td>
          <%=i%>
        </td>
        <td>
          <%=rs2.getString(4)%>
        </td></tr><br>
        <tr><td>
                <input type="hidden" name="num" value="<%=n%>"/>
                <input type="hidden" name="mockid" value="<%=mockid%>"/>
                
          <input type="radio" value="<%=rs2.getString(5)%>" name="radio<%=i%>"><%=rs2.getString(5)%>
        </td>
        <td>
          <input type="radio" value="<%=rs2.getString(6)%>" name="radio<%=i%>"><%=rs2.getString(6)%>
        </td>
        <td>
          <input type="radio" value="<%=rs2.getString(7)%>" name="radio<%=i%>"><%=rs2.getString(7)%>
        </td>
        <td>
          <input type="radio" value="<%=rs2.getString(8)%>" name="radio<%=i%>"><%=rs2.getString(8)%>
          <input type="hidden" name="ans<%=i%>" value="<%=rs2.getString(9)%>"/>
        </td>
        <br>
            <br>
           
      </tr>

<br><br>
      <%
i++;

}
%>
<input type=submit></input>
<%
}
}
else
{
    out.print("<center>");
    out.print("<font size=5 color=red>");
out.print("No mock paper uploaded for subject "+subjectid+" "+unit+"");
}

}

catch(Exception e)
    {
    out.print(e);
}
   %>
<br><br>

</form>
</div></div><div class="clear" style="height:500px"></body></html>