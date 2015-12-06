<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %>  
<%@ page session="true" %>
<%	            
       	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
        int id[]=new int[1000];
        String ans[]=new String[1000];
       String sol[]=new String[1000];
       int eventid=Integer.parseInt(request.getParameter("eventid"));
       int noq=Integer.parseInt(request.getParameter("noq"));
       for(int i=1;i<=noq;i++)
                       {
       ans[i]=request.getParameter("ans"+i);
       sol[i]=request.getParameter("radio"+i);
       id[i]=Integer.parseInt(request.getParameter("id"+i));
        } 
       %>
       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>

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


<div class="bd"><div id="page"><div id="main"><div class="content"><b><%=userid%><table>
                    <%
int count=0;
for(int j=1;j<=noq;j++)
       {
    if(ans[j].equals(sol[j]))
        count++;
}
  Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	PreparedStatement pstmt=null;
  pstmt=con.prepareStatement("insert into marks values(?,?,?)");
  pstmt.setInt(1,eventid);
  pstmt.setString(2,userid);
  pstmt.setInt(3,count);
  int k=pstmt.executeUpdate();
  if(k>0)
{%>
<br>
    <h1><b>Your score is <%=count%></b></h1><br>
    <br>
<%
  int n=1;
  while(n<=noq)
       {
      PreparedStatement pstmt1=null;
  pstmt1=con.prepareStatement("select * from paper where eventid=? and questionid=?");
  pstmt1.setInt(1,eventid);
  pstmt1.setInt(2,id[n]);
ResultSet rs=pstmt1.executeQuery();
rs.next();
  %>
  <tr><td><%=n%>.<%=rs.getString(4)%><br>
      
 <tr><td>ANSWER&nbsp;&nbsp;<%=rs.getString(9)%><br><br>
  <%n++;
  }
      
  }%></table>
</div></div><div class="clear" style="height:10000px"></body></html>