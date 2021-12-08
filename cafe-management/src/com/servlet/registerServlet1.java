package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserRegistration;




/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class registerServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	 
	public registerServlet1()
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String name= request.getParameter("name");
		
		String email= request.getParameter("email");
		String password= request.getParameter("password");
		
		
		
    	UserRegistration rDao= new UserRegistration();
		boolean result = rDao.insert(name,email,password);
		//response.getWriter().print(result);
		//response.getWriter().print(result ? "Successfully registered!!" : "Failure.");
		response.sendRedirect("login.jsp");
		
	}

}