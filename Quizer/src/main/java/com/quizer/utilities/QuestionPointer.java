package com.quizer.utilities;

import jakarta.servlet.http.HttpSession;

public class QuestionPointer {

	public static String increase(HttpSession session) {
		Integer value = (Integer) session.getAttribute("QuestionPointer");

		if (value != null) {
			System.out.println("\nincB	:" + value + "seesion id: " + session.getId());

			value += 1;
			session.setAttribute("QuestionPointer", value);
			System.out.println("incA	:" + value + "seesion id: " + session.getId());
		}
		return "true";
	}

	public static String decrease(HttpSession session) {
		Integer value = (Integer) session.getAttribute("QuestionPointer");

		if (value != null) {
			System.out.println("\ndecA	:" + value + "seesion id: " + session.getId());

			value -= 1;
			session.setAttribute("QuestionPointer", value);
			System.out.println("decB	:" + value + "seesion id: " + session.getId());

		}
		return "true";
	}
}
