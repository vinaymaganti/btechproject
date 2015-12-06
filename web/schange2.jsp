<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<% String userid = session.getAttribute("userid")+"";
   String opass = request.getParameter("opass");      
   String npass = request.getParameter("npass");
   String pass="";  
   String tuserid="";
   boolean flag = false;
%>

<html>
<head>
<title>Password change Page</title>
 </head>
<body>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");tatement st=con.createStatement();
PreparedStatement pstmt=null;
pstmt = con.prepareStatement("select password from users where userid=?");
pstmt.setString(1,userid);
ResultSet rs = pstmt.executeQuery();
while(rs.next())
{
pass=rs.getString(1);

}
if(pass.equals(opass))
{
PreparedStatement pstmt1= null;
pstmt1 = con.prepareStatement("update users set password = ? where userid = ?");
           pstmt1.setString(1,npass);
           pstmt1.setString(2,userid);
           int rowcount = pstmt1.executeUpdate();
if(rowcount>0)
{%>
<font color=green size=6><b><center>Your Password has changed</center></b> </font><br><br>Click on to <a href="index.html">login</a> again
<%
}
pstmt.close();
con.close();
}
else{
out.println("Invalid Current Password");
}
}
catch(Exception e){
out.println(e);
}
%>
</body>  
</html>