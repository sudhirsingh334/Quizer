package com.quizer.service;

import com.quizer.pojo.*;

public class PersistentHelper {

	public static PersistentHelper singleton = new PersistentHelper();
	
	private PersistentHelper() {
	}
	
	public boolean save(Quiz quize) {
		boolean status = true;
		//save quiz into DB
		return status;
	}
}
