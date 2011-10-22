package com.hackathononaplane.server.servletfilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class AuthCheckFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	/**
	 * Check to see if the user is logged in. If they aren't bounce
	 * them to the main home page.
	 */
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
	 	UserService userService = UserServiceFactory.getUserService();
	 	if(userService.getCurrentUser() == null) {
	 		((HttpServletResponse)arg1).sendRedirect("/");
	 	} else {
	 		arg2.doFilter(arg0, arg1);
	 	}
	}

}
