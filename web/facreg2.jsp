<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>


<%	            
       	String facultyid = request.getParameter("facultyid").toUpperCase();
	String username = request.getParameter("username");
	String cpass = request.getParameter("cpass");      
       	String deptid = request.getParameter("deptid");
	String gender = request.getParameter("gender");
	
	out.print("<html>");
	out.print("<body bgcolor=violet>");
	out.print("<br>");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
        
	   PreparedStatement pstmt = null;
           pstmt = con.prepareStatement("select * from users where userid = ? and deptid = ?");   
           pstmt.setString(1,facultyid);
	   pstmt.setString(2,deptid);
         ResultSet rs = pstmt.executeQuery();
	   if(rs.next())
{
         out.print("<center><font size=5 color=black>Already Registered with this faculty id in that department<br><center>Please check again</font>");
	 out.print("<br><br><center><a href='facreg.jsp'>Click here</a>&nbsp;for registration page");
	 out.print("</body>");
	 out.print("</html>");
}          
       
           else
{
   String s="f";
   String semester="";
PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");   
           pstmt1.setString(1,facultyid);
           pstmt1.setString(2,username);
	   pstmt1.setString(3,cpass);
	   pstmt1.setString(4,deptid);
	   pstmt1.setString(6,gender);
	   pstmt1.setString(5,semester);
	   pstmt1.setString(7,s);
           int c = pstmt1.executeUpdate();
if(c==1)
{
              
out.print("<center>");
out.print("<br><center>Successfully registered</center>");
out.print("<br><center><a href='faculty.html'>Click Here to Log in</a>");
out.print("</body>");
out.print("</HTML>");      
}

}
         }
catch(Exception e)
    {
        e.printStackTrace();
        out.println("ERROR: "+ e + "\n");
    }
   %>
 
