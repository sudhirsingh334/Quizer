package com.quizer.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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

public class AddQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw=res.getWriter();

		HttpSession  session = req.getSession(false);
		
		if (session == null) {
			pw.print("Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
			return;
		}
		
		String questionTitle = req.getParameter("question");
		String answerTitle = null;
		String isCorrectOption = "false";
		int optionNumber = 1;
		
		ArrayList<Answer> answerList = new ArrayList<Answer>();
		
		do {
			answerTitle = req.getParameter("answer"+optionNumber);

			if (answerTitle != null) {
				isCorrectOption =  req.getParameter("answer-radio"+optionNumber);

				Answer answer = new Answer(answerTitle);

				if (isCorrectOption != null && isCorrectOption.equalsIgnoreCase("on")) {
					answer.setCorrect(true);;
				}

				answerList.add(answer);
				++optionNumber;
			}

		} while (answerTitle != null);
		


		Quiz quiz = (Quiz) session.getAttribute("Quiz");
		Question question = new Question();
		
		question.setTitle(questionTitle);
		question.setAnswerList(answerList);
		
		quiz.addQuestion(question);
		
		session.setAttribute("Quiz", quiz);
		
		String button = req.getParameter("action-button");
		
		if (button.equalsIgnoreCase("Next")) {

		    RequestDispatcher rd =req.getRequestDispatcher("addquestion.jsp");
		    rd.include(req,res);
		} else {
			//Save Quiz into Database
			boolean isSucceded = PersistentHelper.singleton.save(quiz);
			
			//Once saved print success message
			if (isSucceded) {
				 pw.write("Quiz "+quiz.getName()+ " has been created successfuly.");
				  RequestDispatcher rd =req.getRequestDispatcher("QuizerName.html");
				  
				  rd.forward(req,res);
			}
			else {
				pw.write("Failed to create quiz, please retry.");
			}
		}	
	}
}
