<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%
 String s=request.getParameter("mfile");
String h=getServletContext().getRealPath(s);
out.print(s);
out.print(h);
String n=h.replace('\\','/');
out.print(n);
             %>
