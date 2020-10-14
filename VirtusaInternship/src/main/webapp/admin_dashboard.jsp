<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %> 
<%@ page import = "java.sql.PreparedStatement" %> 
<%@ page import ="java.sql.ResultSet" %>
<%@ page import = "java.io.FileOutputStream"%> 
<%@ page import = "java.io.ObjectOutputStream" %>
<%@ page import = "java.io.InputStream" %>
<%@ page import = "java.io.File" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
	<style>
		table, th, td 
		{
		  border: 1px solid black;
		  text-align:center;
		}
		.btn {
		  background-color: DodgerBlue;
		  border: none;
		  color: white;
		  padding: 2px 16px; 
		  font-size: 14px;
		  cursor: pointer;
		  width:3%;
		  height:3%;
		  border-radius: 50%;
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
<body>
	<div class = "crossbutton">
		<form action="index.jsp">
			<button class="btn"><i class="fa fa-close"></i></button>
		</form>		
	</div>
			<div class = "listforms">
					<table style="width:100%">				
						<tr style="color:red;">					
							<th><h2>Form</h2>  </th>
							<th><h2>Source</h2>  </th>
							<th><h2>Destination</h2>  </th>
							<th><h2>Status</h2>  </th>
						</tr>				
		<% 
			int token = 0;
			String form_name = "";
			String status = "";
			String source = "";
	        String destination = "";
			int count = 0;
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
				PreparedStatement pt = null;
				pt = con.prepareStatement("select * from status",ResultSet.TYPE_SCROLL_SENSITIVE, 
                        ResultSet.CONCUR_UPDATABLE);			
		        ResultSet rs = pt.executeQuery();
		        rs.first();
		        rs.last(); 	       
		        count = rs.getRow();
		        rs.beforeFirst();        
		        while(count>0)
		        {
		        	while (rs.next())
			        {
			            token = rs.getInt("token");
			            form_name = rs.getString("form_name");
			            status = rs.getString("status");       		        
				        pt = con.prepareStatement("select SourceDistrict,DestDistrict from applicant_details_form where token = ?");
				        pt.setInt(1,token);
				        ResultSet rs1 = pt.executeQuery();		        
				        while(rs1.next())
				        {
				        	source = rs1.getString("SourceDistrict");
				        	destination = rs1.getString("DestDistrict");
				        }
			    %>        					
					<tr style="color:black;">					
						<td><h4><a href = "adminpreview.jsp?token=<%=token %>" target="_blank"><% out.println(form_name) ;%></a> </h4> </td>
						<td> <h4><% out.println(source) ;%> </h4> </td>
						<td><h4><% out.println(destination) ;%></h4>  </td>
						<td> <h4><% out.println(status) ;%></h4> </td>
			 		</tr>				  
										
    		 <% 			
			        }
			        
			        	count = count-1;   
				}
				}
			        
				catch(Exception e)
				{
					e.printStackTrace();
				}		       	       
    		  %> 	
      </table>
	</div>
</body>
</html>