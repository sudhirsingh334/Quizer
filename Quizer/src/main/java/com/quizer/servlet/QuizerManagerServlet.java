package com.quizer.servlet;

import java.io.IOException;
import java.util.UUID;

import com.database.QuizAnswerDAO;
import com.database.QuizHostDAO;
import com.quiz.dto.AnswerDTO;
import com.quiz.dto.CandidateDTO;
import com.quiz.dto.QuizDTO;
import com.quizer.service.PersistentHelper;
import com.quizer.utilities.QuestionPointer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class QuizerManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String button = request.getParameter("QuizerManager-Button");
		HttpSession session = request.getSession(false);
		session.setAttribute("User-Tried-To-Join", false);
		String nextPage = "/";

		if (button == null) {
			System.out.println("QuizerManagerServlet:doPost,unknown button pressed");
			return;
		}
		
		if (button.equalsIgnoreCase("Join-Quiz")) {
			// Join Quiz
			// Extract Quiz Code
			session.setAttribute("User-Tried-To-Join", true);
			String quizCode = request.getParameter("QuizCode");
			
			String candidateName = request.getParameter("quizername");
			
			String candidateId = UUID.randomUUID().toString();
			
			// Prepare Candidate DTO.
			QuizHostDAO quizHost = PersistentHelper.singleton.getQuizHost(quizCode);
			
			QuizDTO quizDTO = PersistentHelper.singleton.getQuizDTO(quizHost.getQuizId());
			
			CandidateDTO candidate = new CandidateDTO(candidateId, candidateName, quizHost, quizDTO);
			
			session.setAttribute("CandidateDTO", candidate);
			nextPage = "joinQuiz.jsp";
		} else if (button.equalsIgnoreCase("Quiz-Question-Back")) {
			QuestionPointer.decrease(session);
			nextPage = "quizerQuestion.jsp";
		}  else if (button.equalsIgnoreCase("Quiz-Question-Next")) {
			Integer qsnPointer = (Integer) session.getAttribute("QuestionPointer");
			
			//fetch selected answer
			int optionNumber = 1;			
			String isCorrectOption = "off";
			
			do {
					isCorrectOption =  request.getParameter("answer-radio"+optionNumber);
					
					if (isCorrectOption != null && isCorrectOption.equalsIgnoreCase("on")) {
						CandidateDTO  candidate = (CandidateDTO) session.getAttribute("CandidateDTO");
						
						AnswerDTO answer = candidate.getQuiz().getCondidateQuestionDTOList().get(qsnPointer).getAnswerDTOList().get(optionNumber-1);
						candidate.getQuiz().getCondidateQuestionDTOList().get(qsnPointer).setSelectedAnswerDTO(answer);
						session.setAttribute("CandidateDTO", candidate);
						break;
					}

					++optionNumber;
			} while ((isCorrectOption != null && isCorrectOption.equalsIgnoreCase("off")) || optionNumber<=4);
			QuestionPointer.increase(session);
			nextPage = "quizerQuestion.jsp";
		}  else if (button.equalsIgnoreCase("Quiz-Done")) {
			//Save The Quiz
		} else {
			// Unknown Button Pressed.
			System.out.println("QuizerManagerServlet:doPost,unknown button pressed");
		}

		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.forward(request, response);
	}
}
