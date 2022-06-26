package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fn = request.getParameter("fullName");
		String em = request.getParameter("email");
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		UserDAO dao = new UserDAO();
		dao.signUpUser(fn, em, un, pw);
		HttpSession session = request.getSession();
		session.setAttribute("tb", "Signing up succeeded!");
		response.sendRedirect("signup.jsp");
	}
}
