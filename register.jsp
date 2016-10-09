
<!DOCTYPE html>
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
		<%@page import="javax.servlet.*" %>
		<%@page import="javax.servlet.http.*" %>
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
	        <li><a href="contact.html">Contact Us</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
<%
    String userid = request.getParameter("userid");    
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String univ = request.getParameter("univ");
    String batch = request.getParameter("batch");
    String major = request.getParameter("major");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website", "root", "1234");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into users(userid, fname, lname, email, password, univ, batch, major) "
            + "values ('" + userid + "', '" + fname + "','" + lname + "','" + email + "','" + password + "','" + univ + "', '" + batch + "', '" + major + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        //response.sendRedirect("welcome.jsp");
       //out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
       
       %>
       <div align="center">
		<h3>User Account Created Successfully!!, Welcome to FF</h3>
		
		<br><br>
		
		<form action="index.html">
      		<button type="submit" class="btn btn-primary">Home Page</button>
  		</form>
		
                <br><br>
                
		<form action="login.html">
      		<button type="submit" class="btn btn-primary">Login</button>
  		</form>
		
	</div>
    <%   
    } else {
            //response.sendRedirect("index.jsp");
        %>
               <div align="center">
		<h3>There is a problem with the Server!!, Try again later</h3>
		
		<br><br>
		
		<form action="index.html">
      		<button type="submit" class="btn btn-primary">Home Page</button>
  		</form>
		
                <br><br>
                
		<form action="register.html">
      		<button type="submit" class="btn btn-primary">Try again</button>
  		</form>
		
	</div>
    <%
    }
%>