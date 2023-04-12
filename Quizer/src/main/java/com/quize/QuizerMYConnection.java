package com.quize;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class QuizerMYConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	String radioOprion = req.getParameter("ans");
		
		try {
			res.setContentType("text/html");

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
			
           String serverURL="jdbc:mysql://localhost:3306/quizer";
           String dbUser="sudhirk";
           String dbPassword="sudhirk";

           
			Connection conn = DriverManager.getConnection(serverURL,dbUser,dbPassword);

			PreparedStatement st = conn.prepareStatement("INSERT INTO quizerdata VALUES(?)");
			st.setString(1, radioOprion);
			st.executeUpdate();

		} 
		catch(SQLException e) {
			System.out.print("SQL Exception is::"+e.getMessage());
			
		}
		
		 try {
			 if (radioOprion != null) {
			  RequestDispatcher rd =req.getRequestDispatcher("QuizerName.html"); 
			  rd.forward(req, res); 
			  } 
		   else {
		  RequestDispatcher rd = req.getRequestDispatcher("Quizer.html");
		  rd.forward(req, res);
		  
		  } 
		 } catch (Exception e){ 
			  System.out.println(e.getMessage()); 
			  }	
	}
}
