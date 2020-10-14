<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.status.StatusDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	</style>
</head>
<body>

	<%
	
		int token = Integer.parseInt(request.getParameter("token"));
		StatusDao sd = new StatusDao();
		boolean b = sd.checkToken(token);
		if(b)
		{
			String result[] = sd.getStatus(token);
			if(result[0].equals("Pending"))
			{%>
				<h3 style="color:blue;text-align:center;margin-top:250px;">Your application is still under observation.You will soon get the status of your application. </h3>
			<% }
			else if(result[0].equals("Rejected"))
			{%>
				<h3 style="color:red;text-align:center;margin-top:250px;">Your application has been rejected. </h3>
			<% }
			else
			{%>
				<h3 style="color:green;text-align:center;margin-top:250px;">Congratulations! Your E-pass has been accepted.Click below to generate your E-Pass</h3>
				
					<div class="submit" style="margin-top:70px;margin-left:600px;">
						<a href = "EpassGeneration.jsp?token=<%=token %>" >Generate your E-Pass</a> 
					</div>
				
			<%}
			
			
			
		}
		%>
	
</body>
</html>