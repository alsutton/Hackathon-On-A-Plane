package com.hackathononaplane.server;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubmissionInputRouter extends HttpServlet {

	/**
	 * The serial number for the servlet.
	 */
	private static final long serialVersionUID = -1581828357368001179L;

	/**
	 * Handle a GET from the user by routing it to the input page.
	 */
	@Override
	public void doGet(final HttpServletRequest req, final HttpServletResponse res)
		throws IOException, ServletException {
		req.getRequestDispatcher("/hacks/submit.jsp").forward(req, res);
	}
}
