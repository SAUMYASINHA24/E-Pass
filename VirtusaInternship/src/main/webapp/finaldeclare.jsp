<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	</style>
</head>
<body>
	<div id="result" style="margin-top:200px;">
        
        <%
        		HttpSession session1 = request.getSession();
        		int token = (Integer)(session1.getAttribute("token"));
        		String status = (String)(request.getAttribute("status"));
        %>
        	
        	
            <h3 style = "text-align:center;color:red;"><% out.println(status);%></h3>
            
            
            <h3 style = "text-align:center;color:red;"> You can view other forms by clicking the given below link.</h3>
            
            <h3 style="text-align:center;"><a href = "admin_dashboard.jsp" >Click here</a></h3>
        </div>
</body>
</html>