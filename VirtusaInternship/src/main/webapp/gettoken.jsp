<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	.status
	{
		margin-top:300px;
		text-align:center;
	
	}
	.btn {
	  background-color: DodgerBlue;
	  border: none;
	  color: white;
	  padding: 2px 16px;
	  
	  
	  font-size: 14px;
	  cursor: pointer;
	  width:5%;
	  border-radius: 50%;
	}
	.btn:hover {
	  background-color: RoyalBlue;	  
	}
	</style>
</head>
<body>
	<div class = "crossbutton">
		<form action="index.jsp">
			<button class="btn"><i class="fa fa-close"></i></button>
		</form>
		
	</div> 
	<div class ="status">
		<form action = "statuspreview.jsp" method = "post">	
			<label for="token" ><b style="color:black;">Enter your token number </b></label>
			<input type="text" placeholder="Enter token" name="token" required>
			<button type = "submit">Submit</button>
		</form>
	</div>	
</body>
</html>