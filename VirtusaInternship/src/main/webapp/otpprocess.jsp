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
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
		Statement st=conn.createStatement();
		
		int j=st.executeUpdate("insert into user_login_table(username,password,phone,email)values('"+username+"','"+password+"','"+phone+"','"+email+"')");
		response.sendRedirect("epassfile.jsp");
	}
	catch(Exception e)
	{
		System.out.print(e);
		e.printStackTrace();
	}
}
else
{
	response.sendRedirect("otp_invalid.jsp");
}
%>




