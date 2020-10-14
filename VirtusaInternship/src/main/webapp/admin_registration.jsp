<!DOCTYPE html>
<html>
<head>
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<script>
	function cancelAction()
	{
		document.location.href("index.jsp");
	}
	</script>
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
			<b style="font-size:25px;">E-Pass Portal</b>
		</span>	
		<a href="Underconstruction.jsp" >Contact</a>
		<a href="Underconstruction.jsp" target="_blank" >All State Helpline Number</a>&nbsp;
		<a href="Underconstruction.jsp" target="_blank">Transport Details</a>&nbsp;
		<a href=gettoken.jsp >Status Check</a>&nbsp;
		<a href="admin_registration.jsp"  >Admin</a>&nbsp;
		<a href="index.jsp" class="active">Home</a>&nbsp;		  
	</div>
	<div class="login_box">
		<h2 style="text-align:center;">Login Form</h2>
		<div class="login_page_data">
			<form action="AdminLogin" method="post"> <!-- AdminLogin.java -->
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
			</form>	
			</form>
		</div>		
	</div>	
</body>
</html>