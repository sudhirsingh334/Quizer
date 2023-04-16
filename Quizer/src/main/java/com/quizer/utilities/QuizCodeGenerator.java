package com.quizer.utilities;

import java.util.Random;

public class QuizCodeGenerator {
	
	public static QuizCodeGenerator shared = new QuizCodeGenerator();
	
	private QuizCodeGenerator() {}
	
	public String generateQuizCode(int len) {
		String numbers = "0123456789";
		Random rndm_method = new Random();

		String quizCode = "";

		for (int i = 0; i < len; i++) {
			quizCode += numbers.charAt(rndm_method.nextInt(numbers.length()));
		}

		return quizCode;
	}
}
