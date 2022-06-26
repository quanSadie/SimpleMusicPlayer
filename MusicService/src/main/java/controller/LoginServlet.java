package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dbcontext.DBUtil;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		UserDAO dao = new UserDAO();
		Boolean check = dao.login(username, password);
		String fn = "";
		String idd = "";
		String mail = "";
		String usern = "";
		String pass = "";
		DBUtil db = DBUtil.getInstance();
		String sql = "select * from users";
		Connection con = null;
		if (check) {
			try {
				con = db.getConnection();
				PreparedStatement statement = con.prepareStatement(sql);
				ResultSet rs = statement.executeQuery();
				while (rs.next()) {
					if (rs.getString("username").equals(username)) {
						fn = rs.getString("name");
						idd = rs.getString("userID");
						mail = rs.getString("email");
						usern = rs.getString("username");
					}
				}
			} catch (Exception e) {
				Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
			} finally {
				try {
					DBUtil.closeConnection(con);
				} catch (SQLException e) {
					Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
				}
			}

			HttpSession session = request.getSession();
			session.setAttribute("name", fn);
			session.setAttribute("email", mail);
			session.setAttribute("idd", (String) idd);
			session.setAttribute("username", usern);
			response.sendRedirect("user-page.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("error", "Login failed!");
			response.sendRedirect("login.jsp");
		}
//		String username = request.getParameter("userName");
//		String password = request.getParameter("password");
//		if (username.equals("quan123") && password.equals("123")) {
//			HttpSession session = request.getSession();
//			session.setAttribute("name", "Quan");
//			response.sendRedirect("home.jsp");
	}
}
