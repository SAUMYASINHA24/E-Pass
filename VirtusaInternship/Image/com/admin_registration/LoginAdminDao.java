package com.admin_registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginAdminDao {
	
	
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
			pt = con.prepareStatement("select username,password from admin_login_table where username=?");
			pt.setString(1, username);
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
			
			return(false);
		}
		
	}

}
