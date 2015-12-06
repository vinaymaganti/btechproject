<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 

<%
    	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
    String opass = request.getParameter("opass");      
   String npass = request.getParameter("npass");
   String pass="";  
   String tuserid="";
   boolean flag = false;
%>

<html>
<head>
<title>Password change Page</title><script>document.onkeydown = function() {    
    switch (event.keyCode) { 
        case 116 : //F5 button
            event.returnValue = false;
            event.keyCode = 0;
            return false; 
        case 82 : //R button
            if (event.ctrlKey) { 
                event.returnValue = false; 
                event.keyCode = 0;  
                return false; 
            } 
    }
}
</script>
 </head>
<body>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");tatement st=con.createStatement();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from admin");
while(rs.next())
{
tuserid=rs.getString(1);
pass=rs.getString(2);
}
if(pass.equals(opass))
{
PreparedStatement pstmt= null;
pstmt = con.prepareStatement("update admin set password = ? where name = ?");
           pstmt.setString(1,npass);
           pstmt.setString(2,tuserid);
           int rowcount = pstmt.executeUpdate();
if(rowcount>0)
{%>
<font color=green size=6><b><center>Your Password has changed</center></b> </font><br><br>Click on to <a href="index.html">login</a> again
<%}
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