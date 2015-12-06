<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Reading Text File</title>
</head>
<body>
<%
String fileName = "/WEB-INF/que.txt";
InputStream ins = application.getResourceAsStream(fileName);
try
{
if(ins == null)
{
response.setStatus(response.SC_NOT_FOUND);
}
else
{
BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
String data;
while((data= br.readLine())!= null)
{
out.println(data+"<br>");
}
} 
}
catch(IOException e)
{
out.println(e.getMessage());
}
%>
</body>
</html>