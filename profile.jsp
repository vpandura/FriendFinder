
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
                <li><a href="index.html">Logout</a></li>  
	        <li><a href="contact.html">Contact Us</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
    
    <%
    String userid = request.getParameter("userid");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website", "root", "1234");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from users where userid='" + userid + "'");;
    
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //response.sendRedirect("welcome.jsp");
       //out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
       
       %>
       <div class="container" align="center">
           <h1><%=rs.getString("fname")%> <%=rs.getString("lname")%></h1>
           <p>Here is what FF knows about you</p>
            <blockquote>
		<br>
                <p>User ID: <%=session.getAttribute("userid")%></p>
                
                <p>First Name: <%=rs.getString("fname")%></p>
                
                <p>Last Name: <%=rs.getString("lname")%></p>
                
                <p>Email: <%=rs.getString("email")%></p>
                
                <p>University: <%=rs.getString("univ")%></p>
                
                <p>Batch: <%=rs.getString("batch")%></p>
                
                <p>Major: <%=rs.getString("major")%></p>
            </blockquote>
            
            <form action="index.html">
      		<button type="submit" class="btn btn-primary">Home Page</button>
            </form>
            
            <br>
            
            <form action="search.html">
      		<button type="submit" class="btn btn-success">Find Friends</button>
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
		
                </div>
    <%
    }
%>
