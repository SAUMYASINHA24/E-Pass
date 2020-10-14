<!DOCTYPE html>
<html>
<head>
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
	.btn {
	  background-color: DodgerBlue;
	  border: none;
	  color: white;
	  padding: 2px 16px;
	  margin-left:850px;
	  
	  font-size: 14px;
	  cursor: pointer;
	  width:5%;
	  border-radius: 50%;
	}
	.login_page_data
	{
	
	border-width: 5px;
	border-color: #ac3939;
	
	}
	/* Darker background on mouse-over */
	.btn:hover {
	  background-color: RoyalBlue;	  
	}
	body
	{
  		background-color:#FFFACD;
	}
	</style>
	
</head>
<body >
	<div class="topnav">
		<img src ="Images/lion.jpg" style = "width:50px;heigth:50px; padding-left:5px;padding-top:5px; float:left;">
		<span class="website_heading">
			&nbsp;
			<b style="font-size:25px;">E-Pass Portal</b>
		</span>	
		<a href="Underconstruction.jsp" >Contact</a>
		<a href="Underconstruction.jsp" target="_blank" >All State Helpline Number</a>&nbsp;
		<a href="Underconstruction.jsp" target="_blank">Transport Details</a>&nbsp;
		<a href="gettoken.jsp" >Status Check</a>&nbsp;
		<a href="admin_registration.jsp"  >Admin</a>&nbsp;
		<a href="index.jsp" class="active">Home</a>&nbsp;		  
	</div>
	 
	<div class = "title" style="text-align:center;margin-top:10px;" >
		<h2>Login Form</h2>
	</div>
	<div class = "crossbutton">
		<form action="index.jsp">
			<button class="btn"><i class="fa fa-close"></i></button>
		</form>
		
	</div> 
	<div class="login_box" >
		
		<div class="login_page_data" >
			<form action="signin" method="post">  <!-- Login.java -->
			  <div class="imgcontainer">
			    <img src="Images/login_page.png" alt="Avatar" class="avatar">
			  </div>
			
			  <div class="container">
			    <label for="username"><b>Username</b></label>
			    <input type="text" placeholder="Enter Username" name="username" required>
			
			    <label for="password"><b>Password</b></label>
			    <input type="password" placeholder="Enter Password" name="password" required>
			        
			    <button type="submit">Login</button>
			    <label>
			      <input type="checkbox" checked="checked" name="remember"> Remember me
			    </label>
			  </div>
			
			  <div class="container" style="background-color:#f1f1f1">
			    <span class="signup"><a href = "signup_user.jsp">Don't have an account?</a></span>
			    <span class="psw"><a href="forget_password_user.jsp">Forgot password?</a></span>
			  </div>	
			</form>			
		</div>		
	</div>	
</body>
</html>