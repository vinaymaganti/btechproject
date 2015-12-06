<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>

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
</script></head><body>
<%	 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
            
	String deptname = request.getParameter("deptname").toUpperCase(); 
       	String deptid = request.getParameter("deptid").toUpperCase();
	out.print("<html>");
	out.print("<body>");
	out.print("<br>");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	
        
	   PreparedStatement pstmt1 = null;
           pstmt1 = con.prepareStatement("insert into dept values(?,?)");   
           
           pstmt1.setString(1,deptid);
           pstmt1.setString(2,deptname);
         

           int c = pstmt1.executeUpdate();
if(c==1)
{
              
out.print("<center>");
out.print("<br><center>Successfully added</center>");
out.print("<br><center><font size=4>"+deptname+" Department id is "+deptid+"</font></center>");
out.print("<br><center><a href='adminhome.jsp'>Click Here to Go Back</a>");
out.print("</body>");
out.print("</HTML>");      
}
           
           if(pstmt1 != null)
               
             con.close();
         }
          catch(Exception e) {
           e.printStackTrace();
             out.println("ERROR: "+ e + "\n");
           }
%>
 
</body>
</html>