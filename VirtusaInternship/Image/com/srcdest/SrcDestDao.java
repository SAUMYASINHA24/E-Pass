package com.srcdest;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.Statement;


public class SrcDestDao {
		public void setSrcDest(String username,String source,String destination,String email)
		{	
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println(username);
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false","root","1234");
				//System.out.println("i am here 2");
				Statement st = con.createStatement();
				//System.out.println("i am here 3");
				int j=st.executeUpdate("insert into srcdest(username,source,destination,email) values('"+username+"','"+source+"','"+destination+"','"+email+"')");
				
			}
			catch(Exception e)
			{
				
				e.printStackTrace();
				System.out.println("mistake!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				
			}
			
		}
}
