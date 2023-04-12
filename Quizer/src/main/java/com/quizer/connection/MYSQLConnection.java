package com.quizer.connection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.quizer.pojo.Quiz;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class MYSQLConnection extends HttpServlet {
	Connection conn = null;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter pw=res.getWriter();
		String quizerName = req.getParameter("name");
         // pw.print("Welcome,  " +quizerName );
        
		try {
			res.setContentType("text/html");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			String serverURL = "jdbc:mysql://localhost:3306/user";
			String dbUser = "sudhirk";
			String dbPassword = "sudhirk";
			Connection conn = DriverManager.getConnection(serverURL,dbUser,dbPassword);
			PreparedStatement st = conn.prepareStatement("INSERT INTO username VALUES(?)");
			
			
			
			st.setString(1, quizerName);
			st.executeUpdate();
		} catch (SQLException e) {
			System.out.print("SQL Exception is::" + e.getMessage());
		}
		
		  try {
			    if (quizerName != null) {  	
			    RequestDispatcher rd =req.getRequestDispatcher("Quizer.jsp");
			    Quiz quiz = new Quiz();
				quiz.setName(quizerName);
		        
				HttpSession session=req.getSession(true); 
				session.setAttribute("Quiz", quiz);

			    rd.include(req,res);
			 } 
			  else {
		            RequestDispatcher rd = req.getRequestDispatcher("login.html");
		           rd.include(req,res);
		        }
		  } 
		  catch (Exception e) {
		   System.out.println(e.getMessage()); 
		  }
	}	
	}
