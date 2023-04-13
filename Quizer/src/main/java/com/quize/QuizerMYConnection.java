package com.quize;

import java.io.IOException;
import java.io.PrintWriter;

import javax.swing.JButton;

import com.quizer.pojo.Answer;
import com.quizer.pojo.Question;
import com.quizer.pojo.Quiz;
import com.quizer.service.PersistentHelper;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class QuizerMYConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw=res.getWriter();

		String button = req.getParameter("action-button");
		String questionTitle = req.getParameter("question");

		if (button.equalsIgnoreCase("Next")) {
			HttpSession  session = req.getSession(false);
			
			if (session == null) {
				pw.print("Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
				return;
			}

			Quiz quiz = (Quiz) session.getAttribute("Quiz");
			Question question = new Question();
			
			question.setTitle(questionTitle);
			//Add Answers
			Answer answer1 = new Answer("Option1");
			Answer answer2 = new Answer("Option1");
			
			question.add(answer1);
			question.add(answer2);
			quiz.addQuestion(question);
			
			session.setAttribute("Quiz", quiz);
			
		    RequestDispatcher rd =req.getRequestDispatcher("Quizer.jsp");
		    rd.include(req,res);
		} else {
			System.out.println("Done Button"+button);
			HttpSession  session = req.getSession(false);
			
			if (session == null) {
				pw.print("Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
				return;
			}
			
			Quiz quiz = (Quiz) session.getAttribute("Quiz");
			
			if (questionTitle != null) {
				Question question = new Question();
				question.setTitle(questionTitle);
				
				//Add Answers
				Answer answer1 = new Answer("Option1");
				Answer answer2 = new Answer("Option1");
				
				question.add(answer1);
				question.add(answer2);
				quiz.addQuestion(question);
			}
						
			//Save Quiz into Database
		
			boolean isSucceded = PersistentHelper.singleton.save(quiz);
			//Once saved print success message
			if (isSucceded) {
				/* pw.write("Quiz "+quiz.getName()+ " has been created successfuly."); */
				  RequestDispatcher rd =req.getRequestDispatcher("QuizerName.html");
				  rd.forward(req,res);
			}
			else {
				pw.write("Failed to create quiz, please retry.");
			}


		}
		
	}
}
