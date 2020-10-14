<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<link href="frontpage.css" rel="stylesheet" type="text/css">
	<style>
		marquee
		{
			color:white;
			background-color:#663399;	
		}
		
	</style>
</head>

<body>
	 <marquee direction = "right" >Wear a mask.Save lives. </marquee>
	<div class="topnav">
		<img src ="Images/lion.jpg" style = "width:50px;heigth:50px; padding-left:5px;padding-top:5px; float:left;">
		<span class="website_heading">
			&nbsp;
			<b style="font-size:25px; color:blue;">E-Pass Portal</b>
		</span>	
		<a href="Underconstruction.jsp"  >Contact</a>
		<a href="Underconstruction.jsp" target="_blank" >All State Helpline Number</a>&nbsp;
		<a href="Underconstruction.jsp" target="_blank">Transport Details</a>&nbsp;
		<a href="gettoken.jsp" >Status Check</a>&nbsp;
		<a href="admin_registration.jsp"  >Admin</a>&nbsp;
		<a href="index.jsp" >Home</a>&nbsp;		  
	</div> 
	<div class="main_area">
		<div class="box1_english">	
				<h2 style="text-align:center;color:#2F4F4F">Apply for Travel E-Pass</h2>	
				<ul style="color:black; font-size:16px;font-family:arial">		
					<li>All individuals / group can apply for Travel Pass through this platform</li><br>
					<li>Fill all the details correctly and click on submit</li><br>
					<li>Combine all the relevant documents in a single file while uploading</li><br>
					<li>After submitting the application, you will receive a token ID </li><br>
					<li>Save and use token ID to check the status of your application</li><br>
					<li>After the verification and approval by the concerned departments, you can download the e-pass using the token ID</li><br>		
					<li>The size of the photo should not exceed 200 KB and the size of the relevant document should not exceed 1 MB</li><br>
					<li>The application form should be filled in English only</li>	
					<form name ="apply_button" action="user_registration.jsp">
						<button class="button apply_english" >Apply Here</button>
					</form>				
				</ul>
		</div>
		<div class="box2_hindi" style="background-color:#FFFACD">
				<h2 style="text-align:center;color:#2F4F4F;"> यात्रा ई-पास के लिए आवेदन करें </h2>	
				<ul style="color:black; font-size:16px;font-family:arial">	
					<li>  सभी व्यक्ति / समूह इस प्लेटफॉर्म के माध्यम से यात्रा पास के लिए आवेदन कर सकते हैं । </li><br>
					<li>  सभी विवरण सही से भरें और सबमिट पर क्लिक करें। </li><br>
					<li>  अपलोड करते समय एक फाइल में सभी संबंधित दस्तावेजों को मिलाएं। </li><br>	
					<li>  आवेदन जमा करने के बाद, आपको एक टोकन आईडी प्राप्त होगा।</li><br>	
					<li>  इसे सहेजें, और अपने आवेदन की स्थिति की जांच करने के लिए इसका उपयोग करें। </li><br>
					<li>  संबंधित विभागों द्वारा सत्यापन और अनुमोदन के बाद, आप टोकन आईडी का उपयोग करके ई-पास डाउनलोड कर सकते हैं  </li><br>
					<li>  फोटो का आकार 200 केबी से अधिक नहीं होना चाहिए और संबंधित दस्तावेज का आकार 1 एमबी से अधिक नहीं होना चाहिए </li><br>	
					<li>आवेदन पत्र केवल अंग्रेजी में भरा जाना चाहिए  </li>
					<form name ="apply_button" action="user_registration.jsp">
						<button class="button apply_hindi" > आवेदन करें  </button>
					</form>	
				</ul>
		</div>
	</div>
</body>
</html>

	