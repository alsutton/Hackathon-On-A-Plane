<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored ="false" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<!DOCTYPE html>
<html lang="en">
  <head>
	<link rel="shortcut icon" type="image/ico" href="http://www.hackathononaplane.com/favicon.ico">
	<meta charset="utf-8">
    <title>Hackathon on a Plane</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link href="../bootstrap.css" rel="stylesheet">
    <link href="../hoap.css" rel="stylesheet">

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="/favicon.ico">
  </head>

  <body>

    <div class="topbar">
      <div class="fill">
        <div class="container">
          <a class="brand" href="#">Hackathon on a Plane!!!</a>

          <ul class="nav">
            <li><a href="/">Home</a></li>
            <li><a href="/list">See Hacks</a></li>
            <li class="active"><a href="#">Register Hack</a></li>
          </ul>
          
          
<%
 	UserService userService = UserServiceFactory.getUserService();
%>
		  <div id="loginarea" class="pull-right">
${pageContext.request.userPrincipal.name} | <a href='<%=userService.createLogoutURL("/")%>'>log out</a>
		  </div>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="content">
        <div class="page-header">
          <h1>Submit Your Hack</h1>
        </div>
        <div class="row">
          <div class="span10">
			<p>So you want to be famous?... then submit your hack!!!! All these details will be made
			publicly available for others to vote on.</p>
			
			<div style="padding-top: 10px">&nbsp;</div>

			<%
				User thisUser = userService.getCurrentUser();
			%>
			<form action="/hacks/submitHack" method="POST" charset="utf-8">
			<div class="span9">
				<div class="span3"><label>Your Name:</label></div>
				<div class="span5"><input class="uneditable-input" type="text" value="<%=thisUser.getNickname() %>"></div>
			</div>
			<div style="padding-top:5px" class="span9">
				<div class="span3"><label>Your Hack:</label></div>
				<div class="span5"><input type="text" name="name"></div>
			</div>
			<div style="padding-top:5px" class="span9">
				<div class="span3"><label>Changeset URL:</label></div>
				<div class="span5"><input type="text" name="url"></div>
			</div>
			<div style="padding-top:5px" class="span9">
				<div class="span3"><label>Time in the air:</label></div>
				<div class="span5"><input type="text" name="planeTime"> mins</div>
			</div>
			<div style="padding-top:20px" class="span9">
				<div class="span3">&nbsp;</div>
				<div class="span5 pull-right"><input type="submit" name="submit" value="Submit" class="btn primary">&nbsp;<input type="reset" name="submit" value="Clear" class="btn secondry"></div>
			</div>
			</form>			
          </div>
          <div class="span4">
            <h3>About</h3>
            <p>A "Hackathon on a Plane" was an idea floated by
            <a href="http://twitter.com/#!/rallat" target="_blank">Israel Ferrer</a> to 
            <a href="http://twitter.com/#!/alsutton" target="_blank">Al Sutton</a>,
            <a href="http://twitter.com/#!/chrisbanes" target="_blank">Chris Banes</a>,
            and <a href="http://twitter.com/#!/charroch" target="_blank">Carl-Gustaf Harroch</a>
            on <a href="http://twitter.com/#!/rallat/status/126293031770009600" target="_blank">twitter</a> for
            the flight from Europe to Google IO 2012.</p>
            
            <p>If this idea is popular we'll use this site to track who has hacked what on which flights. This
            will give other hackers a target to pick for their particular flight.</p>
            
            <p>It's early days, so the rules are still under discussion, but feel
            free to tweet your ideas to <a href="http://twitter.com/#!/alsutton" target="_blank">Al Sutton</a> and mark them with the hashtag 
            <a href="http://twitter.com/#!/search/%23HoaP">#Hoap</a>.</o>
            
            <p>The Hackthon on a plane icon was donated by <a href="http://twitter.com/#!/kevinmcdonagh">Kevin McDonagh</a></p>
            
            <h3>Updates</h3>
            
            <p>19th Oct 2011<br/>
            Change starting time to be unpack on first flight to discourage early
            check-ins and hours in the departure lounge hacking (i.e. guard against the
            Gutteridge workaround).</p>
        	</div>
        </div>
      </div>

      <footer>
        <p>&copy;Copyright 2011, <a href="http://funkyandroid.com/">Funky Android Ltd.</a>, All Rights Reserved</p>
      </footer>

    </div> <!-- /container -->

  </body>
</html>
