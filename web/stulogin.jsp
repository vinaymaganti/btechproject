<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>

<jsp:useBean id="clock" class="java.util.Date" />

<%	            
	String id ="",str1="",str2="",str3="";
	boolean flag1 = false, flag2 = false;
	String userid = request.getParameter("T1");
	String pwdt = request.getParameter("T2"); 
       
	out.println("<html>");
	out.println("<body>");
	out.println("<br>");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	PreparedStatement st = null;
	String flag="s";
	st=con.prepareStatement("select userid,password from users where flag=?");
        st.setString(1,flag);
        ResultSet rs=st.executeQuery();
	while(rs.next())
	{
		str1 = rs.getString(1);
		str2 = rs.getString(2);
		if(str1.equals(userid))
		{
			flag1 = true;                              
			if(str2.equals(pwdt))
				flag2 = true;
			break;
		}
	}
	//rs.close();
	//st.close();
	if(!flag1 || !flag2) 	
	{
		out.println("<font color = red><center><h1>Sorry Wrong Id/Password ");
		out.println("!!!</h1></center>");
		out.println("</font><br>");  
		out.println("<A HREF='student.html' ><center>");
		out.println("<h2>Click Here To Try Again</h2></center></A>");
	} 
	else
	{	 session.setAttribute("userid",userid);
	   response.sendRedirect("studenthome.jsp?str="+userid);    

    
 

        }	 
 
		 
}catch(Exception e)
{	
	e.printStackTrace();   
}
%><html><head><script>document.onkeydown = function() {    
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
</body>
</html>