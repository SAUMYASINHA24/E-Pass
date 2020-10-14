<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.util.Random"%>
<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
<%@ page import ="com.emailverification.EmailVerification" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	</style>
<body>

<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String phone=request.getParameter("phone");
	HttpSession session1 = request.getSession();
	String email = (String)(session1.getAttribute("email"));
	session.setAttribute("username",username);
	session.setAttribute("password",password);
	session.setAttribute("phone",phone);
	session.setAttribute("email",email);
	out.println(username);
	out.println(password);
	out.println(phone);
	
	
	Random rand = new Random();
	int otp = rand.nextInt(900000) + 100000;
	session.setAttribute("otp",otp);
	System.out.println("Your OTP is"+otp);
	
	
	String message = "Your OTP is:"+" "+otp;
	
	
	String success="Your message sent sucessfully";
	
	
	
	final String emailusername= "saumyasinhatest@gmail.com";
	final String emailpassword = "Jaimatadi@123";
	String subject = "E-Pass - OTP form Email Verification ";
	String body = "Hi "+ username +",\n" +
					"Greetings from E-Pass Seva.\n" +
					"Your One Time Password (OTP) is " + otp +". Please do not share it with anyone.Incase of any discrepancy kindly mail it to "+emailusername;
	EmailVerification e = new EmailVerification();
	e.sendFromGmail(emailusername, emailpassword,email, subject, body);
	
	
	response.sendRedirect("otp.jsp");
	
%>
</body>
</html>