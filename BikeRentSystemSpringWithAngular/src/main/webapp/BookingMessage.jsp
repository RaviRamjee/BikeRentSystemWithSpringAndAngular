<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page import="com.spring.user.UserDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
.contacts-form {
	background: grey;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-o-border-radius: 10px;
	-ms-border-radius: 10px;
	padding: 70px 585px;
}
.form-control {
	padding: 10px 10px;
	margin: 3px;
}
</style>
</head>
<body>

<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
if(session.getAttribute("userEmail")==null)
	{
	    response.sendRedirect("Login.jsp");
	}
	%>
	
	<%
	String email=(String)session.getAttribute("userEmail");
	%>
<ul>
  <li><a href="#"><%= email %></a></li>
  <li><a href="userLogout">Logout</a></li>
  <li><a href="UserBookingDetails.jsp">Profile</a></li>
</ul>

<center><h1>Booked Succesfully</h1></center>
<hr>
<center><h3>Here is your all booking details--</h3>
<br>
<h2><a href="UserBookingDetails.jsp">Click Here</a></h2>
</center>







</body>
</html>