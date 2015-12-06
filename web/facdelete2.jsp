<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>

<jsp:useBean id="clock" class="java.util.Date" />

<%	String id = request.getParameter("T1");
 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
 %>

<html><head><script>document.onkeydown = function() {    
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
</script></head>
<body>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
        String flag="f";
	PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("select *from users where userid = ? and flag=?");   

	   pstmt1.setString(1,id);             
           pstmt1.setString(2,flag);
ResultSet rs=pstmt1.executeQuery();

if(rs.next())
{
	   PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("delete from users where userid = ? and flag=?");   

	   pstmt.setString(1,id);             
           pstmt.setString(2,flag);
                                 
         

           int c = pstmt.executeUpdate();
if(c==1)
{
              
out.print("<center>");
out.print("<br><center>Successfully removed</center>");
out.print("<br><center><a href='adminhome.jsp'>Click Here to Go Back</a>");
out.print("</body>");
out.print("</HTML>");      
}

    
if(pstmt != null)
               
             con.close();
      } 

else           
{
out.print("<center>");
out.print("<font size=4 color=green>");
out.print("Faculty with ID "+id+" Not Registered");
} }
          catch(Exception e)
 {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>
 
</body>
</html>