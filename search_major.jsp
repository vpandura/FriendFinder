
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
    String major = request.getParameter("major");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/website", "root", "1234");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from users where major='" + major + "'");;
    
    %>
    <div align="center" class="container"><h2>SEARCH RESULTS</h2>
        <table class="table">
         <TR>
            <TD>Name</TD>
            <TD>University</TD>
            <TD>Batch</TD>
            <TD>Major</TD>
        </TR>   
        
    <%
    while (rs.next()) {
        //session.setAttribute("fname", fname);
        //response.sendRedirect("welcome.jsp");
        %>
        <TR class="success">
            <TD><%=rs.getString("fname")%> <%= rs.getString("lname")%></TD>
            <TD><%=rs.getString("univ")%></TD>
            <TD><%=rs.getString("batch")%></TD>
            <TD><%=rs.getString("major")%></TD>
            </TR>
        <%
    }
    
    %>
    </table>
        
            <form action="index.html">
      		<button type="submit" class="btn btn-primary">Home Page</button>
            </form>
            
            <br>
            
            <form action="search.html">
      		<button type="submit" class="btn btn-success">Find More Friends</button>
            </form>
    
    </div>
    
    
    <%
%>
