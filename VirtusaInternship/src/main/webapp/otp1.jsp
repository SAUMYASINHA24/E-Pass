<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<script>
	function Validation()
	{
		
		var num = document.forget_form.otpvalue.value;
		
        if (isNaN(num) || num.length!=6)
         {    
			 document.getElementById("otpvalue");      
			 alert("Please enter correct OTP value");
			 document.forget_form.otpvalue.focus() ; 		 
			 return false;     
		 }
         else
         {    
          return true;
         } 
	} 
	</script>
	<style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	</style>
<title>Insert title here</title>
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
		<h2 style="text-align:center;">OTP Generation</h2>
		<div class="forget_page_data">
			<form action="otpprocess1.jsp" method="post" name = "forget_form" id = "form1">
			  <div class="imgcontainer">
			    <img src="Images/login_page.png" alt="Avatar" class="avatar">
			  </div>
			  <div class="container">
			    <label for="otpvalue"><b style="padding-left:130px;">Enter the OTP </b></label>
			    <input type="password" placeholder="Enter OTP" name="otpvalue" required autofocus>   
			    <button type="submit" onclick="return (Validation());">Submit</button>
			  </div>
			</form>
		</div>
	</div>
</body>
</html>