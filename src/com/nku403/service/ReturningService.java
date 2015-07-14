package com.nku403.service;

import java.util.List;

import com.nku403.entity.Returning;
import com.nku403.entity.User;

public interface ReturningService {
	public void ReturnBook(Returning returning);
	
	public List FindHistory(User user);
}
