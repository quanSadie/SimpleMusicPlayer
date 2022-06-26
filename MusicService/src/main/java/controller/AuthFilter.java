package controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "AuthFilter", urlPatterns = { "*.jsp" })

public class AuthFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String n = null;

		if (session != null) {
			n = (String) session.getAttribute("name");
		}

		boolean isLoggedIn = (n != null);

		// Check if the user is accessing login page
		if (req.getRequestURI().equals(req.getContextPath() + "/login.jsp")) {
			if (isLoggedIn) {
				// Redirect to landing or home page
				HttpServletResponse res = (HttpServletResponse) response;
				res.sendRedirect(req.getContextPath() + "/user-page.jsp");
			} else {
				// Otherwise, nothing to do if he has not logged in
				// pass the request along the filter chain
				chain.doFilter(request, response);
			}
		} else {
			// For all other pages,
			if (isLoggedIn) {
				// Nothing to do
				chain.doFilter(request, response);
			} else {
				// Redirect to login page if he has not logged in
				HttpServletResponse res = (HttpServletResponse) response;
				res.sendRedirect(req.getContextPath() + "/login.jsp");
			}
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
