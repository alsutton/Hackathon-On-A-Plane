package com.hackathononaplane.server;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hackathononaplane.server.datamodel.Hack;

public class ListHacksServlet extends HttpServlet {

	/**
	 * Generated Serial ID.
	 */
	private static final long serialVersionUID = 5097059798880536310L;

	/**
	 * Get the list of hacks to be displayed
	 */

	@Override
	public void doGet(final HttpServletRequest req, final HttpServletResponse res)
		throws IOException, ServletException{
	    PersistenceManagerFactory pmf = JDOUtils.getPersistenceManagerFactory(super.getServletContext());
	    PersistenceManager pm = pmf.getPersistenceManager();

	    Query query = pm.newQuery(Hack.class);
	    req.setAttribute("hacks", query.execute());
	    req.getRequestDispatcher("/list.jsp").forward(req, res);
	}
}
