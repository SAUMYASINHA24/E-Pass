package com.Signin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;



public class LoginUserDao {
	public boolean getDetails(String username,String password)
	{	
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("i am here");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
			//System.out.println("i am here 2");
			PreparedStatement pt = null;
			//System.out.println("i am here 3");
			pt = con.prepareStatement("select username,password from user_login_table where username=? and password = ?");
			pt.setString(1, username);
			pt.setString(2, password);
            ResultSet rs = pt.executeQuery();
            String orPass = "";
            while (rs.next())
            {
                orPass = rs.getString("password");
            } 
            if (orPass.equals(password)) 
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
			System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return(false);
		}
		
	}
	public boolean getUser(String email)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("email is"+email);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
			//System.out.println("i am here 2");
			PreparedStatement pt = null;
			//System.out.println("i am here 3");
			pt = con.prepareStatement("select username,password from user_login_table where email=?");
			pt.setString(1, email);
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
			System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return(false);
		}
		
	}
	public String getPhone(String email)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("email is"+email);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
			//System.out.println("i am here 2");
			PreparedStatement pt = null;
			//System.out.println("i am here 3");
			pt = con.prepareStatement("select username from user_login_table where email = ?");
			pt.setString(1, email);
			
            ResultSet rs = pt.executeQuery();
            
            if(rs.next())
            {
            	String username = rs.getString("username");
            	return(username);
                
            } 
            else 
            {
            	String username = "Not Found";
            	return(username);
            }
			
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String username = "Not Found";
        	return(username);
		}
		
	}
	public String getEmail(String username)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("email is"+email);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
			//System.out.println("i am here 2");
			PreparedStatement pt = null;
			System.out.println(username);
			//System.out.println("i am here 3");
			pt = con.prepareStatement("select email from user_login_table where username = (?) ");
			pt.setString(1, username);
		
            ResultSet rs = pt.executeQuery();
            
            if(rs.next())
            {
            	String email = rs.getString("email");
            	return(email);
                
            } 
            else
            {
            	String email = "Not Found";
            	return(email);
            }
			
            
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String email = "Not Found";
        	return(email);
		}
		
	}
	public void resetPassword(String email,String password)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//System.out.println("email is"+email);
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
			//System.out.println("i am here 2");
			PreparedStatement pt = null;
			
			
			pt = con.prepareStatement("update user_login_table set password = ? where email  = ?");
			pt.setString(1, password);
			pt.setString(2,email);
			pt.executeUpdate();
            
            
			
			
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		}
		
	}
	

}
