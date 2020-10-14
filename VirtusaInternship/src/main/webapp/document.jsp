<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %> 
<%@ page import = "java.sql.PreparedStatement" %> 
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.io.FileOutputStream"%> 
<%@ page import = "java.io.ObjectOutputStream" %>
<%@ page import = "java.io.InputStream" %>
<%@ page import = "java.io.File" %>
<%@page language="java" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Blob file = null;
byte[] filedata = null;
try
{
	HttpSession sessions = request.getSession();
	
	int token = (Integer)(sessions.getAttribute("token"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
	PreparedStatement pt = null;
	pt = con.prepareStatement("select * from applicant_details_form where token=?");
	pt.setInt(1, token);
	ResultSet rs = pt.executeQuery();
	int i =0;


	while (rs.next())
	{
		file = rs.getBlob("Documents");
		
		filedata = file.getBytes(1,(int)file.length());
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition","inline");
		response.setContentLength(filedata.length);
		OutputStream output = response.getOutputStream();
		output.write(filedata);
		output.flush();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>