<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page import="java.net.*" %> 
<%@ page session="true" %>


<% 	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
%>
<%String subjectid = request.getParameter("subjectname");
String paper=request.getParameter("unit");
%> 
<html>
</head>
<body>
    <%
    
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	int a;
		PreparedStatement pstmt = null;
        pstmt = con.prepareStatement("select max(mockid)+1 from mock");
        ResultSet rs=pstmt.executeQuery();
        rs.next();
        if(rs.getString(1)==null)
{
a=1;
}
else
{
a=rs.getInt(1);
}
		PreparedStatement pstmt1 = null;
        pstmt1 = con.prepareStatement("insert into mock values(?,?,?,?)");
        pstmt1.setInt(1,a);
        pstmt1.setString(2,userid);
        pstmt1.setString(3,subjectid);
        pstmt1.setString(4,paper);
        int k=pstmt1.executeUpdate();
        if(k>0)
                       {
                        response.sendRedirect("mupload4.jsp");

        }
}

catch(Exception e){
out.print(e);}

%>
</body>
</html>