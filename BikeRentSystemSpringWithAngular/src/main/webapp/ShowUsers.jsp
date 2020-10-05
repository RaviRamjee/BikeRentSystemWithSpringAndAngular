<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.spring.user.UserDao"%>
<%@ page import="com.spring.user.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Users</title>
<style>
div.scrollmenu {
  background-color: #333;
  overflow: auto;
  white-space: nowrap;
}

div.scrollmenu a {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px;
  text-decoration: none;
}

div.scrollmenu a:hover {
  background-color: #777;
}
table.center {
  margin-left: auto;
  margin-right: auto;
}
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
	float: right;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
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
	if(session.getAttribute("adminEmail")==null)
	{
	    response.sendRedirect("Login.jsp");
	}
	%>

	<%
	String email=(String)session.getAttribute("adminEmail");
	%>
	<ul>
		<li><a href="AdminHomepage.jsp">Home</a></li>
		<li><a href="adminLogout">Logout</a></li>
		<li><a href="#"><%= email %></a></li>
	</ul>
	<br>
	<jsp:include page='Sidebar.jsp'></jsp:include>
	
	
<center><h1>All Resistered Users</h1></center>
<div class="class="scrollmenu"">
	<table style="float:right">
		<tr>
			<th>userId</th>
			<th>userName</th>
			<th>userEmail</th>
			<th>userPassword</th>
			<th>userPhoneNo</th>
			<th>userAddress</th>
		</tr>
		<%
			//getting datastore service
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

		    String userId="";
			String userName = "";
			String userEmail = "";
			String userPassword = "";
			String userPhoneNo = "";
			String userAddress = "";
			//Query object for fetching the data from datastore
			Query q = new Query("User");
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				userId=  e.getProperty("userId").toString();
				userName = e.getProperty("userName").toString();
				userEmail = e.getProperty("userEmail").toString();
				userPassword = e.getProperty("userPassword").toString();
				userPhoneNo = e.getProperty("userPhone").toString();
				userAddress = e.getProperty("userAddress").toString();
		%> 
		<tr>
			<td><%= userId %></td>
			<td><%= userName %></td>
			<td><%= userEmail %></td>
			<td><%= userPassword %></td>
			<td><%= userPhoneNo %></td>
			<td><%= userAddress %></td>
		</tr>
		
	<%} %>
	</table>
	</div>
</body>
</html>