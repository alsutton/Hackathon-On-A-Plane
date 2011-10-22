package com.hackathononaplane.server;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.hackathononaplane.server.datamodel.Hack;

public class SubmitHackServlet extends HttpServlet {

	/**
	 * Generated Serial ID
	 */
	private static final long serialVersionUID = -7624144644176433543L;

	/**
	 * Submit a hack to the database
	 */

	@Override
	public void doPost(final HttpServletRequest req, final HttpServletResponse resp)
		throws IOException {

		String submitParam = req.getParameter("submit");
		if(submitParam == null || submitParam.equals("Reset")) {
			resp.sendRedirect("/list");
			return;
		}


		Hack hack = new Hack();

	 	UserService userService = UserServiceFactory.getUserService();
	 	User user = userService.getCurrentUser();
	 	if(user == null) {
	 		resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
	 		return;
	 	}
		hack.setUser(user);
		hack.setName(req.getParameter("name"));
		hack.setChangesetURL(req.getParameter("changesetURL"));
		hack.setVoteScore(0);
		hack.setReports(0);
		hack.setPlaneTime(Integer.parseInt(req.getParameter("planeTime")));

	    PersistenceManagerFactory pmf = JDOUtils.getPersistenceManagerFactory(super.getServletContext());
	    PersistenceManager pm = pmf.getPersistenceManager();
    	pm.makePersistent(hack);

    	resp.sendRedirect("/list");
	}
}
