<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body
	{
  		background-color:#FFFACD;
	}
	table
	{
		 width:50%;
		 border-collapse: collapse;
		 margin-left:350px;
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
	[type="checkbox"]
	{
	    vertical-align:middle;
	}
	</style>
</head>
<body>
<%
	String name = "";
	String district = "";
	String phone = "";
	String aadhar = "";
	String source = "";
	String sourceaddr = "";
	String dest = "";
	String destaddr = "";
	String reason = "";
	String date = "";
	String vehtype = "";
	String vehnumber = "";
	String count = "";
	String srcdistrict = "";
	String destdistrict = "";
	
	HttpSession sessions = request.getSession();
	String username = (String)(sessions.getAttribute("username"));
	int token = (Integer)(sessions.getAttribute("token"));
	try
	{
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
            
            srcdistrict = rs.getString("SourceDistrict");
            destdistrict = rs.getString("DestDistrict");
            phone = rs.getString("Phone");
            aadhar = rs.getString("Aadhar"); 
            sourceaddr = rs.getString("Sourceadd");
            destaddr = rs.getString("Destadd");
            reason = rs.getString("reason");
            date = rs.getString("DateofJourney");
            vehtype = rs.getString("Vehicle_type");
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
	}
        
	catch(Exception e)
	{
		e.printStackTrace();
	}	
%>
	<h2 style="text-align:center;color:brown;">Review Form</h2>
	<div class = "listforms">
		<table>
			
			<tr>
				<th>Fields</th>
				<th> Values </th>
			</tr>
			
			<tr style="text-align:center;">
				<td>Full Name</td>
				<td><% out.println(name);%></td>
			</tr>
			<tr style="text-align:center;">
				<td> Source District</td>
				<td><% out.println(srcdistrict); %></td>
			</tr>
			<tr style="text-align:center;">
				<td> Destination District</td>
				<td><% out.println(destdistrict); %></td>
			</tr>
			<tr style="text-align:center;">
				<td>Phone </td>
				<td><% out.println(phone); %></td>
			</tr>
			<tr style="text-align:center;">
				<td>Aadhar Number</td>
				<td><% out.println(aadhar); %></td>
			</tr>
			<tr style="text-align:center;">
				<td>Source</td>
				<td><% out.println(source); %></td>
			</tr>
			<tr style="text-align:center;">
				<td>Source Address</td>
				<td><% out.println(sourceaddr); %></td>
			</tr>
			<tr style="text-align:center;">
				<td>Destination</td>
				<td><% out.println(dest); %></td>
			</tr>
			<tr style="text-align:center;">
				<td>Destination Address</td>
				<td><% out.println(destaddr); %></td>
			</tr>
			<tr style="text-align:center;">
				<td> Reason </td>
				<td><% out.println(reason); %></td>
			</tr>
			<tr style="text-align:center;">
				<td> Date of Journey</td>
				<td><% out.println(date); %></td>
			</tr>
			<tr style="text-align:center;">
				<td> Vehicle Type </td>
				<td><% out.println(vehtype); %></td>
			</tr>
			<tr style="text-align:center;">
				<td> Vehicle Number </td>
				<td><% out.println(vehnumber); %></td>
			</tr>
			<tr style="text-align:center;">
				<td> Number of passengers </td>
				<td><% out.println(count); %></td> 
			</tr>
			<tr style="text-align:center;">
				<td> Documents </td>
				<td> <a href="document.jsp" target="_blank">Click here</a> </td>
			</tr>	
		</table>
		<br><br><br>
		<div class="confirmm">
			<form action="Status" method="post">
				
				     <label for="checkid"  style="word-wrap:break-word">
				        <input id="checkid"  type="checkbox" value="test" required/>I, <% out.println(name);%>, hereby declare that all the information submitted by me in the application form is correct, true and valid. I will present the supporting documents as and when required.
				     </label>
			
				 <div style="margin-left:650px;margin-top:60px;">
				 	<button type="submit" value="Submit">Submit</button>
				 </div>
				  
			</form>	
		</div>	
	</div>
</body>
</html>