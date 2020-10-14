<%@page import="com.Signin.LoginUserDao"%>
<%@page import="com.emailverification.EmailVerification"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload Example in JSP and Servlet - Java web application</title>
        <style type="text/css">
		body
		{
	  		background-color:#FFFACD;
		}
		</style>
    </head>
  
    <body> 
        <div id="result" style="margin-top:200px;">
        
        <%
        		HttpSession session1 = request.getSession();
        		int token = (Integer)(session1.getAttribute("token"));
        		String username1 = (String)(session1.getAttribute("username"));
        		
        		LoginUserDao ld = new LoginUserDao();
        		String email = ld.getEmail(username1);
        		
        		String username = "saumyasinhatest@gmail.com";
        		String password = "Jaimatadi@123";
        		String subject = "Thank you! Your E-Pass application has been submitted.";
        		String body = "Hi "+ username1 +",\n" +
						"Greetings from E-Pass Seva.\n" +
        				"Your application has been submitted successfully.It will take 2-3 days to get processed." +
						"You can track the status of your application using the generated token ID "+token + ".\n" +
        				"\n"+
        				"Incase of any discrepancy kindly mail it to "+ username +
        				"\n"+"\n"+"\n"+"\n"+"\n"+
        				
						"Disclaimer: This is a sample mail." ;
        				
        		 
        		EmailVerification e = new EmailVerification();
        		e.sendFromGmail(username, password, email, subject, body);
        		
        %>
        	
        	<h3 style = "text-align:center;color:red;">Your unique token id is <%out.println(token);%></h3>
            <h3 style = "text-align:center;color:red;">Your form is successfully submitted.It will take 2-3 days to process it.</h3>           
            <h3 style = "text-align:center;color:red;"> Kindly track the status of your form using the above generated token id.</h3>            
            <h3 style="text-align:center;"><a href = "gettoken.jsp" >Check your status</a></h3>
        </div>      
    </body>
</html>