<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %>  
<%@ page session="true" %>


<%	            
       	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
        int e=Integer.parseInt(request.getParameter("eventid"));
        int time=Integer.parseInt(request.getParameter("time"))*60;
       int noq = Integer.parseInt(request.getParameter("noq"));

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
<script type="text/javascript" src="CountDown.js"></script>
<script type="text/javascript">
window.onload=WindowLoad;

function WindowLoad(event) 
{
	ActivateCountDown("CountDownPanel",<%=time%>);
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


<div class="bd"><div id="page"><div id="main"><div class="content"><h1><%=userid%></h1>
<br>

<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	PreparedStatement pstmt=null;
        pstmt=con.prepareStatement("select marks from marks where eventid=? and studentid=?");
        pstmt.setInt(1,e);
        pstmt.setString(2,userid);
        ResultSet rs=pstmt.executeQuery();
        if(rs.next())
        {
            out.print("<font align=center color=red size=5>");
            out.print("Sorry Your exam already submitted");
            out.print("</div></div><div class=clear style=height:10000px></body></html>");
}
               else{
            %><table><form name="frm" id="frm" action="count.jsp">
              <font size="4" color="red">Time remaining: <span id="CountDownPanel"></span>
<%
               PreparedStatement pstmt1=null;
               pstmt1=con.prepareStatement("select count(eventid) from paper where eventid=?");
               pstmt1.setInt(1,e);
               ResultSet rs1=pstmt1.executeQuery();
               rs1.next();
               int total=rs1.getInt(1);
               int i=1;
               while(i<=noq)
                                     {
                   int a=1;
               int b=total;
               int numbr = (int) (a + Math.random( ) * (b - a + 1));
                   PreparedStatement pstmt2=null;
               pstmt2=con.prepareStatement("select * from paper where eventid=? and questionid=?");
               pstmt2.setInt(1,e);
               pstmt2.setInt(2,numbr);
               ResultSet rs2=pstmt2.executeQuery();
               rs2.next();
               String op1=rs2.getString(5);
               String op2=rs2.getString(6);
               String op3=rs2.getString(7);
               String op4=rs2.getString(8);
               %>
               <input type="hidden" name="eventid" value="<%=e%>"/>
                <input type="hidden" name="noq" value="<%=noq%>"/>
                <input type="hidden" name="id<%=i%>" value="<%=rs2.getString(3)%>"/>
                <input type="hidden" name="ans<%=i%>" value="<%=rs2.getString(9)%>"/>
               <tr>
        <td>
          <%=i%>
        &nbsp         <%=rs2.getString(4)%>
        </td></tr>
                <tr><td>
            <input type="radio"  name="radio<%=i%>" value="<%=op1%>"/><%=op1%>
        </td>
        <td>
          <input type="radio" value="<%=op2%>" name="radio<%=i%>" /><%=op2%>
        </td>
       <td>
          <input type="radio" value="<%=op3%>" name="radio<%=i%>" /><%=op3%>
        </td>
        <td>
          <input type="radio" value="<%=op4%>" name="radio<%=i%>" /><%=op4%>
          </td> </tr>
          <tr><td> <br></td></tr>
          <tr><td><br> </td></tr>
            
     
      <%
i++;

               
               }
              

               %>
               </table>
<br><br><input type="submit"></form>
               <%}
}
catch(Exception ere)
               {
out.print(ere);
}
%>

</div></div><div class="clear" style="height:10000px"></body></html>