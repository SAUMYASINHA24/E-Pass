package com.status;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class StatusDao {

	
	public void setData(int token,String filename,String status)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
			String url = "jdbc:mysql://localhost:3306/project?useSSL=false";
			String user = "root";
			String password = "1234";
			
			
				
			 String sql1 = "insert into status(token,form_name,status) values(?,?,?)";
		        try (
		        	Connection connection = DriverManager.getConnection(url, user, password);
		        
		            
		            // Step 2:Create a statement using connection object
		            PreparedStatement preparedStatement = connection
		            .prepareStatement(sql1)) {

		        	preparedStatement.setInt(1, token);
		            preparedStatement.setString(2,filename);
		            preparedStatement.setString(3, status);
		            

		          
		            int row = preparedStatement.executeUpdate();
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
	public void updateData(String status,int token)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
			String url = "jdbc:mysql://localhost:3306/project?useSSL=false";
			String user = "root";
			String password = "1234";
			
			
				
			 String sql1 = "update status set status = ? where token = ?";
		        try (
		        	Connection connection = DriverManager.getConnection(url, user, password);
		        
		            
		            // Step 2:Create a statement using connection object
		            PreparedStatement preparedStatement = connection
		            .prepareStatement(sql1)) {

		        	preparedStatement.setString(1, status);
		            preparedStatement.setInt(2,token);
		            
		            

		          
		            int row = preparedStatement.executeUpdate();
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
	public boolean checkToken(int token)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("email is"+email);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
			//System.out.println("i am here 2");
			PreparedStatement pt = null;
			//System.out.println("i am here 3");
			pt = con.prepareStatement("select * from status where token=?");
			pt.setInt(1, token);
            ResultSet rs = pt.executeQuery();
            
            if(rs.next())
            {
                return true;
            } 
            else 
            {
                return false;
            }
			
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return(false);
		}
	}
	public String[] getStatus(int token)
	{
		String finalvalue[] = new String[2];
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("email is"+email);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
			//System.out.println("i am here 2");
			PreparedStatement pt = null;
			//System.out.println("i am here 3");
			pt = con.prepareStatement("select * from status where token=?");
			pt.setInt(1, token);
            ResultSet rs = pt.executeQuery();
            String status = "";
            String formname = "";
            if(rs.next())
            {
               status = rs.getString("status");
               formname = rs.getString("form_name");
            } 
            
            finalvalue[0] = status;
            finalvalue[1] = formname;
            return(finalvalue);
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return(finalvalue);
		}
	}
}
