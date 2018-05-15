package com.Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Servlet.AssignService;
import com.Servlet.DeleteService;
import com.Servlet.LoginService;
import com.Servlet.LogoutService;
import com.Servlet.ModifyService;
import com.Servlet.RegistService;
import com.Servlet.alamTimeService;
import com.Servlet.command;
import com.Servlet.detailInfoService;
import com.Servlet.getValueService;
import com.Servlet.myOldListService;
import com.Servlet.regManService;
import com.Servlet.regSenService;

@WebServlet("*.do")
public class Control extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("URI >> " + uri);
		String path = request.getContextPath();
		System.out.println("path >> " + path);
		String command = uri.substring(path.length() + 1);
		System.out.println("command >> " + command);

		request.setCharacterEncoding("euc-kr");

		command com = null;

		if (command.equals("Login.do")) {
			com = new LoginService();
		}else if (command.equals("Regist.do")) {
			com = new RegistService();
		}else if (command.equals("Logout.do")) {
			com = new LogoutService();
		}else if (command.equals("Modify.do")) {
			com = new ModifyService();
		}else if (command.equals("Delete.do")) {
			com = new DeleteService();
		}else if (command.equals("Assign.do")) {
			com = new AssignService();
		}else if (command.equals("regManager.do")) {
			com = new regManService();
		}else if (command.equals("myOldList.do")) {
			com = new myOldListService();
		}else if (command.equals("getValue.do")) {
			com = new getValueService();
		}else if (command.equals("detailInfo.do")) {
			com = new detailInfoService();
		}else if (command.equals("alamTime.do")) {
			com = new alamTimeService();
		}else if (command.equals("setFillTime.do")) {
			com = new setFillTimeService();
		}else if (command.equals("regSen.do")) {
			com = new regSenService();
		}
		
		com.execute(request, response);
	}

}
