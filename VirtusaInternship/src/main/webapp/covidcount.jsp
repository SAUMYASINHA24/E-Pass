<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import = "java.util.Iterator" %>
<%@ page import = "java.io.FileNotFoundException" %>
<%@ page import = "java.io.FileReader" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "com.DetailDao.DetailDao" %>
<%@ page import = "com.trialCount.trialcount" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link href = "https://fonts.googleapis.com/css?family=Muli$display=swap" rel = "stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	table, th, td {
	  border: 1px solid black;
	  border-collapse: collapse;
	  margin-left:auto; 
 	 margin-right:auto;
 	 margin-top:auto;
 	 margin-bottom:auto;
	}
	th, td {
	  padding: 10px;
	  text-align: center;
	}
	
	body
	{
  		background-color:#FFFACD;
	}
	.btn {
	  background-color: #D2691E;
	  border: none;
	  color: white;
	  padding: 20px 16px;  
	  font-size: 14px;
	  cursor: pointer;
	  width:7%;
	  height:10%;
	  border-radius: 100%;
	}

	/* Darker background on mouse-over */
	.btn:hover {
	  background-color: RoyalBlue;	  
	}
</style>
</head>
<body>
<%
		String srcdistrict  = (String)(request.getParameter("srcdistrict"));
		String destdistrict  = (String)(request.getParameter("destdistrict"));
		String source = (String)(request.getParameter("source"));
		String destination = (String)(request.getParameter("destination"));
		String reason = (String)(request.getParameter("reason"));
		int token = Integer.valueOf(request.getParameter("token"));
		
		HttpSession session1 = request.getSession();
		session1.setAttribute("token",token);
		trialcount t = new trialcount();
		String recommendation = "";
		int a[] = t.getData(srcdistrict,destdistrict,source,destination);
		
		if(reason.equals("Medical Emergency") || reason.equals("Death") || reason.equals("Extreme emergency"))
		{
			recommendation = "E-Pass can be allowed due to urgent reason";
		}
		else if(Math.abs(a[0]-a[1]) >=10000)
		{
			recommendation  = "Travelling is risky";
		}
		else
		{
			recommendation = "Travelling is safe";
		}
		
		
%>
	<div class = "stats" style="margin-top:100px;">
		<table class="center">
			<caption>Active Cases</caption>
			<tr>
				<th>Source</th>
				<th>Destination</th>
			</tr>
			<tr>
				<td><%out.println(a[0]); %></td>
				<td><%out.println(a[1]); %></td>
			</tr>
		</table>
	</div>
		<%
			if(recommendation.equals("Travelling is risky"))
			{%>
				<h3 style="color:red;text-align:center;">*<%out.println(recommendation); %></h3>
			<% }
			else if(recommendation.equals("Travelling is safe"))
			{%>
				<h2 style="color:green;text-align:center;">*<%out.println(recommendation); %></h2>
			<% }
			else 
			{%>
				<h2 style="color:blue;text-align:center;">*<%out.println(recommendation); %></h2>
			<% } %>
	<form action = "UpdateStatus" method = "post">	
		<table style="margin-top:100px;">
			<caption><p>Please select an action</p></caption>
			<tr>
			<td><input type="radio" id="accept" name="accept" value = "a">
				<label for="accept">Accept Application</label><br></td>
			<td><input type="radio" id="reject" name="accept" value = "r">
				<label for="reject">Reject Application</label><br></td>
			<td><input type="radio" id="pending" name="accept" value = "p">
				<label for="pending">Put on hold</label><br></td>
				
			</tr>
			
		</table>	
		<button style="margin-left:635px;margin-top:100px;" class="btn"><i class="fa fa-check" aria-hidden="true"></i></button>		
	</form>				
				
				
				
				
			
		
		
</body>
</html>