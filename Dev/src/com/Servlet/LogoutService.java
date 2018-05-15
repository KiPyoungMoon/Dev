package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutService implements command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LogoutService Start");
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginId");
		
		System.out.println("logout success");
		
		response.sendRedirect("Login.html");
	}

}
