<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	</style>
<meta charset="ISO-8859-1">
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<script>
	alert("Sorry! You are not registered.You are getting redirected to create a new form");
	function Validation()
	{
		var emailid = document.signup_form.email.value;
		var num = document.signup_form.phone.value;
		atpos = emailid.indexOf("@"); 
		dotpos = emailid.lastIndexOf("."); 

	    if (atpos< 1 || ( dotpos - atpos<=3 ) || (emailid.length-1)==dotpos)           
         { 
           alert("Please enter correct email ID");
		   document.signup_form.email.focus() ;   
		   return false;          
		             
         }
        else if (isNaN(num) || num.length!=10)
         {    
			 document.getElementById("phone");      
			 alert("Please enter numeric 10 digit phone number");
			document.signup_form.phone.focus() ; 		 
			     return false;
		 }
         else
         {    
          	return true;
         } 
	}; 
	</script>
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
		<h2 style="text-align:center;">Signup Form</h2>
		<div class="signup_page_data">
			<form  method="post" action = "process" name = "signup_form" id="form1">
			  <div class="imgcontainer">
			    <img src="Images/login_page.png" alt="Avatar" class="avatar">
			  </div>
			
			  <div class="container">
			  	<label for="name"><b>Name</b></label>
			    <input type="text" placeholder="Enter name" name="name" required>
			    <label for="email"><b>Email</b></label>
			    <input type="email" placeholder="Enter email-id" name="email" required>
			    <label for="phone"><b>Contact</b></label>
			    <input type="text" placeholder="Enter contact number" name="phone" required>
			    <label for="username"><b>Username</b></label>
			    <input type="text" placeholder="Create Username" name="username" required>
			
			    <label for="password"><b>Password</b></label>
			    <input type="password" placeholder="Create Strong Password" name="password" required>
			        
			    <button type="submit" onclick="return (Validation());">Login</button>
			  </div>
			</form>
		</div>	
	</div>
</body>
</html>