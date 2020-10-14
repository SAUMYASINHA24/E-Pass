<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %> 
<%@ page import = "java.sql.PreparedStatement" %> 
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.io.FileOutputStream"%> 
<%@ page import = "java.io.ObjectOutputStream" %>
<%@ page import = "java.io.InputStream" %>
<%@ page import = "java.io.File" %>
<%@page language="java" trimDirectiveWhitespaces="true"%>
<%@ page import = "com.qrcode.QRCodeGeneration" %>


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
	table
	{
		 width:50%;
		 border-collapse: collapse;
		margin-left:300px;
		margin-top:40px;
		 text-align:left;
	}
	th, td {
	  border: 1px solid black;
	  text-align:left;
	  padding: 8px;
	 
	}
	tr:nth-child(even)
	{
  		background-color: #dddddd;
	}
	.btn {
	  background-color: DodgerBlue;
	  border: none;
	  color: white;
	  padding: 2px 16px;
	  margin-left:900px;	  
	  font-size: 14px;
	  cursor: pointer;
	  width:5%;
	  border-radius: 50%;
	}

	/* Darker background on mouse-over */
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
	
	<%
		
		QRCodeGeneration qr = new QRCodeGeneration();
		qr.generateQR();
		int token  = Integer.parseInt(request.getParameter("token"));
		HttpSession sessions = request.getSession();
		String name = "";
		String sourceaddr = "";
		String destaddr = "";
		String date = "";
		String vehnumber = "";
		String reason = "";
		String count = "";
		String phone = "";
		String source = "";
		String dest ="";
		String username = (String)(sessions.getAttribute("username"));
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
		PreparedStatement pt = null;
		pt = con.prepareStatement("select * from applicant_details_form where token=?");
		pt.setInt(1, token);
        ResultSet rs = pt.executeQuery();
        int i =0;
        while (rs.next())
        {
            name = rs.getString("Name");                     
            phone = rs.getString("Phone");            
            sourceaddr = rs.getString("Sourceadd");
            destaddr = rs.getString("Destadd");
            reason = rs.getString("reason");
            date = rs.getString("DateofJourney");        
            vehnumber = rs.getString("Vehicle_Number");
            count = rs.getString("Count");        
	        PreparedStatement pt1 = null;
			pt1 = con.prepareStatement("select * from srcdest where username=?");
			pt1.setString(1, username);
	        ResultSet rs1 = pt1.executeQuery();
	        while(rs1.next())
	        {
	        	source = rs1.getString("source");
	        	dest = rs1.getString("destination");
	        }
		
		}
	%>
	
	 <div class = "generated_epass">	 
	 	<table> 		
			<tr>
				<th>Name</th>
				<td><%out.println(name); %></td>
			</tr>
			<tr>
				<th>Date of Travel</th>
				<td><%out.println(date); %></td>
			</tr>
			<tr>
				<th>Vehicle Number</th>
				<td><%out.println(vehnumber); %></td>
			</tr>
			<tr>
				<th>Travel from</th>
				<td><%out.println(sourceaddr); %></td>
			</tr>
			<tr>
				<th>Travel to</th>
				<td><%out.println(destaddr); %></td>
			</tr>
			<tr>
				<th>Reason for travel</th>
				<td><%out.println(reason); %></td>
			</tr>
			<tr>
				<th>No.of co-passengers</th>
				<td><%out.println(count); %></td>
			</tr>	
			<tr>
				<th>Scan this QR code</th>
				<td><img src ="Images/JD.png" alt="error"> </td>
			</tr>
				
		</table>
	 
	 
	 
	 </div>
	
	<br>
	<div class="finalbutton" style="margin-left:600px;">
	
	<form action = "download.jsp">
		<button type="submit">Download</button>
	
	</form>
	</div>
</body>
</html>