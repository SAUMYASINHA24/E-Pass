<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="frontpage.css" rel="stylesheet" type="text/css">
<script>
	function Validation()
	{
		
		var phn = document.forget_form.phone.value;
		var aadhar = document.forget_form.aadhar.value;
		var num = document.forget_form.num.value;
		
        if (isNaN(phn) || phn.length!=10)
         {    
			 document.getElementById("phone");      
			 alert("Please enter numeric 10 digit phone number");
			 document.forget_form.phone.focus() ; 		 
			 return false;     
		 }
        if(isNaN(aadhar) || aadhar.length!=12)
        {
        	 document.getElementById("aadhar");      
			 alert("Please enter numeric 12 digit aadhar number");
			 document.forget_form.aadhar.focus() ; 		 
			 return false;  
        }
        if(isNaN(num))
        {
			document.getElementById("num");      
			alert("Please enter a valid number");
			document.forget_form.num.focus() ; 		 
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
</head>
<body>

	<div class="form_fill">
		
		<div class="main_form_fill1">
			<form action="InterServlet" method="post" name = "forget_form" id = "form1">
			  <div class="imgcontainer">
			    <img src="Images/token.jfif" alt="Avatar" class="avatar">
			  </div>
			  <h2 style="text-align:center;">Travel Pass</h2>
			  <div class="container">
			  	<label for="sdistrict"><b >Source District </b></label><br><br>
			    	
			    	<select id="sdistrict" name="sdistrict">
				    	<option value="Intro">Select district:</option>
				     	<option value="Anantapur">Anantapur</option>
					    <option value="Chittoor">Chittoor</option>
					    <option value="Kurnool">Kurnool</option>
					    <option value="Visakhapatnam">Visakhapatnam</option>
					    <option value="Malappuram">Malappuram</option>
					    <option value="Thiruvananthapuram">Thiruvananthapuram</option>
					    <option value="Chennai">Chennai</option>
					    <option value="Coimbatore">Coimbatore</option>
					    <option value="Kanyakumari">Kanyakumari</option>
					    <option value="Tiruchirappalli">Tiruchirappalli</option>
					    <option value="Amravati">Amravati</option>
					    <option value="Aurangabad">Aurangabad</option>
					    <option value="Mumbai">Mumbai</option>
					    <option value="Nagpur">Nagpur</option>
					    <option value="Nashik">Nashik</option>
					    <option value="Pune">Pune</option>
					    <option value="Ratnagiri">Ratnagiri</option>
					    <option value="Thane">Thane</option>
					    <option value="Yavatmal">Yavatmal</option>   
					</select><br><br>
				<label for="ddistrict"><b >Destination District </b></label><br><br>
			    	
			    	<select id="ddistrict" name="ddistrict">
				    	<option value="Intro">Select district:</option>
				     	<option value="Anantapur">Anantapur</option>
					    <option value="Chittoor">Chittoor</option>
					    <option value="Kurnool">Kurnool</option>
					    <option value="Visakhapatnam">Visakhapatnam</option>
					    <option value="Malappuram">Malappuram</option>
					    <option value="Thiruvananthapuram">Thiruvananthapuram</option>
					    <option value="Chennai">Chennai</option>
					    <option value="Coimbatore">Coimbatore</option>
					    <option value="Kanyakumari">Kanyakumari</option>
					    <option value="Tiruchirappalli">Tiruchirappalli</option>
					    <option value="Amravati">Amravati</option>
					    <option value="Aurangabad">Aurangabad</option>
					    <option value="Mumbai">Mumbai</option>
					    <option value="Nagpur">Nagpur</option>
					    <option value="Nashik">Nashik</option>
					    <option value="Pune">Pune</option>
					    <option value="Ratnagiri">Ratnagiri</option>
					    <option value="Thane">Thane</option>
					    <option value="Yavatmal">Yavatmal</option>   
					</select><br><br>
			  	<label for="name"><b >Enter name </b></label><br>
			    <input type="text" placeholder="Enter name" name="name" required> <br>
			    <label for="phone"><b >Enter the registered phone number </b></label><br>
			    <input type="text" placeholder="Enter number" name="phone" required> <br>
			    <label for="aadhar"><b >Enter Aadhar number </b></label><br>
			    <input type="text" placeholder="Enter Aadhar card number" name="aadhar" required><br>
			    <label for="sourceadd"><b >Enter your starting point </b></label><br><br>
			    <input type="text" placeholder="Enter source address" name="sourceadd" required><br>
			    <label for="destadd"><b >Enter your destination point </b></label><br>
			    <input type="text" placeholder="Enter destination address" name="destadd" required><br>
			    <label for="dateofjour"><b >Enter the date of journey </b></label><br><br>
			    <input type="date" placeholder="Enter date of journey" name="dateofjour" min="2020-08-11" required><br>
			    <br>
			    <label for="reason"><b >Reason </b></label><br><br>
			    	
			    	<select id="reason" name="reason">
				    	<option value="Intro">Select reason:</option>
				     	<option value="Death">Death of first relative</option>
					    <option value="Medical Emergency">Extreme medical emergency</option>
					    <option value="Stranded student">Stranded Student</option>
					    <option value="Stranded individual">Stranded Individual</option>
					    <option value="Extreme emergency">Extreme emergency case</option>
					    
					</select><br><br>
				
			    <label for="vehtype"><b >Vehicle Type </b></label><br><br>
			    	<select id="vehtype" name="vehtype">
			    	<option value="Intro">Enter Vehicle type:</option>
			     	<option value="Aeroplane">Aeroplane</option>
				    <option value="Car">Car</option>
				    <option value="Train">Train</option>
				    <option value="Public bus">Public bus</option>
				    <option value="Private bus">Private bus</option>
				    <option value="5seater">Private 4 wheeler (5seater)</option>
					<option value="7seater">Private 4 wheeler (7seater)</option>
					<option value="private2">Private vehicle 2 wheeler</option>
					<option value="truck">Truck or Lorry</option>
					<option value="tracktor">Tracktor</option>
					<option value="taxi">Taxi/Cab/Rickshaw</option>
				    </select>
				 <br><br>
			    <label for="vehno"><b >Vehicle Number </b></label><br>
			    <input type="text" placeholder="MH 04 AA 1342/NA" name="vehno" required> <br>
			    <label for="num"><b >Number of Co-passengers </b></label><br>
			    <input type="text" placeholder="Enter count" name="num" required>  <br>
			  	
			    <button type="submit" onclick="return (Validation());">Next</button>
			  </div>
			</form>
		</div>
	</div>
	
	
	
	
	
	</div>


</body>
</html>