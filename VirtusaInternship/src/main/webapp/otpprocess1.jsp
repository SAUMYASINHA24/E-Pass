<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String username=(String)session.getAttribute("username");
String password=(String)session.getAttribute("password");
String phone=(String)session.getAttribute("phone");
String email = (String)session.getAttribute("email");
int otp= (Integer) session.getAttribute("otp");
String otpvalue=request.getParameter("otpvalue");
out.println(username);
out.println(password);
out.println(phone);
out.println(email);
out.println(otp);
int enterOtp=Integer.parseInt(otpvalue);
if(otp==enterOtp)
	{
		response.sendRedirect("Renewpassword.jsp");
	}
else
{
	%>
	<html>
		<head>
			<script>
				alert("Incorrect OTP value");
			</script>
		</head>
	</html>
	<%
	response.sendRedirect("otp1.jsp");
	}
	
	%>
	





