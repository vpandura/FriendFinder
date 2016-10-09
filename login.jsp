<html>
<head>
<meta charset="ISO-8859-1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" 
integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" 
integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

		<%@ page language="java" %>
		<%@page import="java.util.*" %>
		<%@page import="java.io.*" %>
		<%@page import="java.text.*" %>
		<%@page import="java.io.IOException"%>
		<%@page import="java.sql.*"%>

<title>Friend Finder</title>

<body>

	<div class="jumbotron" align="center">
	  <h1>FRIEND FINDER</h1>
	  <p>Connect with your college friends</p>
	</div>

	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">FF</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="index.html">Home<span class="sr-only">(current)</span></a></li>
	        <li><a href="about.html">About Us</a></li>
	        <li class="active"><a href="accounts.html">Accounts</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
                <li><a href="index.html">Logout</a></li>
	        <li><a href="contact.html">Contact Us</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
<%
    String userid = request.getParameter("userid");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root", "1234");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where userid='" + userid + "' and password='" + password + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        //response.sendRedirect("index.html");
        %>
        <div align="center">
		<h3> Login Successful, Welcome <%=session.getAttribute("userid")%> </h3>
		
		<br><br>
		
		<form action="index.html">
      		<button type="submit" class="btn btn-primary">Home Page</button>
  		</form>
		
                <br><br>
                
		<form action="profile.jsp">
                <input type="hidden" name="userid" value="<%=session.getAttribute("userid")%>">
      		<button type="submit" class="btn btn-primary">View your profile</button>
  		</form>
                
                <br><br>
                
                <form action="search.html">
      		<button type="submit" class="btn btn-primary">Find friends</button>
  		</form>
		
	</div>
    <%
    } else {
        //out.println("Invalid password <a href='index.html'>try again</a>");%>
        <div align="center">
		<h3> Invalid Credentials, try again </h3>
		
		<br><br>
		
		<form action="login.html">
      		<button type="submit" class="btn btn-primary">Try Again</button>
  		</form>
		
                <br><br>
                
		<form action="index.html">
      		<button type="submit" class="btn btn-primary">Back to home</button>
  		</form>
                
	</div>
                <%
    }
%>
