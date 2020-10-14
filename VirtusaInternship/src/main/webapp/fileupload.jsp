<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		body
		{
	  		background-color:#FFFACD;
		}
		.checked
		{
			color:#A52A2A;
		}
	</style>
</head>
<body>
	<div class = "compress">
		<form action="FileUploadServlet" method="post" enctype="multipart/form-data"> 
			<div class  = "compress_box" style="margin-top:2px;">
				<label for="aadhar"><b style="color:red;">Enter your Aadhar number </b></label>
		        <input type="text" placeholder="0000 0000 0000 0000" name="aadhar"/>  <br>  
		        <label for="photo"><b style="color:red;">Attach relevant document (Your health certificate,Aadhar card)</b></label>  <br><br>  
				<input type="file"  name="photo" size="50"  />
				<br>
				<br>
				<br>
				<div class="compresslink" >
					<span class="fa fa-star checked"></span>
					<a href = "https://www.sodapdf.com/compress-pdf/" target = "_blank"  >Compress your file</a><br><br>
				</div>
				<div>
					<input type="submit" value="Upload" style="margin-left:250px;background-color:#FFFACD;">
				</div>		
			</div>
		</form>
	</div> 
	<h3 style="color:#A52A2A;text-align:center;">*Note: Only 1 pdf file is allowed. Maximum file size is 50KB </h3>
</body>
</html>