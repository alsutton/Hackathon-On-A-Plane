<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored ="false" %>
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
    <link href="bootstrap.css" rel="stylesheet">
    <link href="hoap.css" rel="stylesheet">

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="/favicon.ico">
  </head>

  <body>

    <div class="topbar">
      <div class="fill">
        <div class="container">
          <a class="brand" href="#">Hackathon on a Plane!!!</a>

<%
 	UserService userService = UserServiceFactory.getUserService();
%>
          <ul class="nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="/list">See Hacks</a></li>
<%
	if( request.getUserPrincipal() != null ) {
%>
            <li><a href="/hacks/submit">Register Hack</a></li>
<%
	} else {
%>
            <li><a href='<%=userService.createLoginURL("/hacks/submit")%>'>Register Hack</a></li>
<%
	}
%>
          </ul>
          
          
		  <div id="loginarea" class="pull-right">
<%
	if( request.getUserPrincipal() == null ) {
%>
<a href='<%=userService.createLoginURL(request.getRequestURI())%>'>sign in</a>
<%
	} else {
%>
${pageContext.request.userPrincipal.name} | <a href='<%=userService.createLogoutURL("/")%>'>log out</a>
<%
	}
%>
		  </div>
        </div>
      </div>
    </div>

    <div class="container">

      <div class="content">
        <div class="page-header">
          <h1>Getting your geek on in the air</h1>
        </div>
        <div class="row">
          <div class="span10">
            <h2>The Why?</h2>

			<p>Flights can be long and boring, so a Hackathon on a plane is a good way for a hacker to pass
			some time. You can compete with others either on the same flight or on flights of a similar duration.</p>
			
			<p>We're hoping to keep a track of who does what on which flights so you'll even be able to test your
			skills against people who you don't know and who may have been on a completely different flight.</p>
			
            <h2>The Rules</h2>
          
            <p>1. <b>Follow instructions from airline and security staff at all times</b>. Failure to do so will result in an instant disqualification.</p>
            
            <p>2. The time starts when you're allowed to use electronics on the first flight.</p>
            
            <p>3. The time stops when you're asked to pack electronic equipment away by the airline staff on the final flight.</p>

          	<p>4. If you have a stop over your coding time stops when you're asked to stow electronic equipment on one leg and starts again when you're
          	    allowed to take out electronic equipment again on the next leg of the journey.</p>
 
 			<p>5. You can, between legs, carry out research, but you can't code.</p>

			<p>6. You should check your code into a public repository (e.g. <a href="http://www.github.com/" target="_blank">github</a>) as soon as possible</p>

			<p>Once you've done your hack send a tweet to <a href="http://twitter.com/#!/hackonaplane" target="_blank">@hackonaplane</a>
			with the URL of the change-set in the public repository which contains, in its description, the flight or flights you were on
			and the dates you were on them. Please also include the hashtag <b>#HoaP</b> in the tweet.</p>
            <p>These rules will only work for the honest, if you want to be dishonest and ignore the rules, don't expect to be
            taken too seriously</p>
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
