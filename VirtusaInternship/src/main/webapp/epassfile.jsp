<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="frontpage.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	</style>
</head>
<body>
	<div class="topnav">
		<img src ="Images/lion.jpg" style = "width:50px;heigth:50px; padding-left:5px;padding-top:5px; float:left;">
		<span class="website_heading">
			&nbsp;
			<b style="font-size:25px; color:blue;">E-Pass Portal</b>
		</span>	
		<a href="Underconstruction.jsp" >Contact</a>
		<a href="Underconstruction.jsp" target="_blank" >All State Helpline Number</a>&nbsp;
		<a href="Underconstruction.jsp" target="_blank">Transport Details</a>&nbsp;
		<a href="gettoken.jsp" >Status Check</a>&nbsp;
		<a href="admin_registration.jsp"  >Admin</a>&nbsp;
		<a href="index.jsp" class="active">Home</a>&nbsp;		  
	</div>
	<div class="login_box">
		<% 
		HttpSession session1=request.getSession();
		String username = (String)(session1.getAttribute("username"));  
				
			
		%>
		<h2 style="text-align:center;">Welcome <% out.print(username);%></h2>
		<div class="forget_page_data">
			<form action="SourceDestination" method="post" name = "forget_form" id = "form1">
			  <div class="imgcontainer">
			    <img src="Images/token.jfif" alt="Avatar" class="avatar">
			  </div>
			  <div class="container">
			    <label for="source"><b >Enter source </b></label>
			     <select id="source" name="source">
			     
				    <option value="Andhra Pradesh">Andhra Pradesh</option>
				    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
				    <option value="Assam">Assam</option>
				    <option value="Bihar">Bihar</option>
				    <option value="Chattisgarh">Chattisgarh</option>
				    <option value="Goa">Goa</option>
				    <option value="Gujarat">Gujarat</option>
				    <option value="Haryana">Haryana</option>
				    <option value="Himachal Pradesh">Himachal Pradesh</option>
				    <option value="Jammu and Kashmir">Jammu and Kashmir</option>
				    <option value="Jharkhand">Jharkhand</option>
				    <option value="Karnataka">Karnataka</option>
				    <option value="Kerala">Kerala</option>
				    <option value="Madhya Pradesh">Madhya Pradesh</option>
				    <option value="Maharashtra">Maharashtra</option>
				    <option value="Manipur">Manipur</option>
				    <option value="Meghalaya">Meghalaya</option>
				    <option value="Mizoram">Mizoram</option>
				    <option value="Nagaland">Nagaland</option>
				    <option value="Odisha">Odisha</option>
				    <option value="Punjab">Punjab</option>
				    <option value="Rajasthan">Rajasthan</option>
				    <option value="Sikkim">Sikkim</option>
				    <option value="Tamil Nadu">Tamil Nadu</option>
				    <option value="Telangana">Telangana</option>
				    <option value="Tripura">Tripura</option>
				    <option value="Uttar Pradesh">Uttar Pradesh</option>
				    <option value="Uttarakhand">Uttarakhand</option>
				    <option value="West Bengal">West Bengal</option>
				 </select>
				 <br>
				 <br>
			    <label for="dest"><b>Enter destination </b></label>
				  	<select id="dest" name="dest">
					    <option value="Andhra Pradesh">Andhra Pradesh</option>
				    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
				    <option value="Assam">Assam</option>
				    <option value="Bihar">Bihar</option>
				    <option value="Chattisgarh">Chattisgarh</option>
				    <option value="Goa">Goa</option>
				    <option value="Gujarat">Gujarat</option>
				    <option value="Haryana">Haryana</option>
				    <option value="Himachal Pradesh">Himachal Pradesh</option>
				    <option value="Jammu and Kashmir">Jammu and Kashmir</option>
				    <option value="Jharkhand">Jharkhand</option>
				    <option value="Karnataka">Karnataka</option>
				    <option value="Kerala">Kerala</option>
				    <option value="Madhya Pradesh">Madhya Pradesh</option>
				    <option value="Maharashtra">Maharashtra</option>
				    <option value="Manipur">Manipur</option>
				    <option value="Meghalaya">Meghalaya</option>
				    <option value="Mizoram">Mizoram</option>
				    <option value="Nagaland">Nagaland</option>
				    <option value="Odisha">Odisha</option>
				    <option value="Punjab">Punjab</option>
				    <option value="Rajasthan">Rajasthan</option>
				    <option value="Sikkim">Sikkim</option>
				    <option value="Tamil Nadu">Tamil Nadu</option>
				    <option value="Telangana">Telangana</option>
				    <option value="Tripura">Tripura</option>
				    <option value="Uttar Pradesh">Uttar Pradesh</option>
				    <option value="Uttarakhand">Uttarakhand</option>
				    <option value="West Bengal">West Bengal</option>
					  </select>
				<br>
				<br>
				
				<label for="purpose"><b>Enter purpose </b></label>
				  	<select id="purpose" name="purpose">
					    <option value="Health">Health</option>
					    <option value="Education">Education</option>
					    <option value="Job">Job</option>
					    <option value="Other">Other</option>
					 </select>
				<br>
				<br>
				
			    <button type="submit">Submit</button>
			  </div>
			</form>
		</div>
	</div>
	<h3 style="color:blue;text-align:center">* Note: If you have to travel in your own state,Select same source and destination as your state.</h3>
</body>
</html>