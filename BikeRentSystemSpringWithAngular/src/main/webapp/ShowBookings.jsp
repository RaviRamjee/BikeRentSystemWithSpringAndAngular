<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Bookings</title>
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
<center>
<h1>All Bookings</h1>
	<table style="float:right">
		<tr>
			<th>bookingId</th>
			<th>bookingUserId</th>
			<th>bookingBikeId</th>
			<th>bookingName</th>
			<th>bookingBranch</th>
			<th>bookingDLNo</th>
			<th>bookingPickupDate</th>
			<th>bookingPickupTime</th>
			<th>bookingDropDate</th>
			<th>bookingDropTime</th>
			<th>bookingStatus</th>
			<th>bookingTariffSelected</th>
			<th>bookingTime</th>
		</tr>
		<%
			//getting datastore service
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

		    String bookingId="";
			String bookingUserId = "";
			String bookingBikeId = "";
			String bookingName = "";
			String bookingBranch = "";
			String bookingDLNo = "";
			String bookingPickupDate="";
			String bookingPickupTime = "";
			String bookingDropDate = "";
			String bookingDropTime = "";
			String bookingStatus = "";
			String bookingTariffSelected = "";
			String bookingTime = "";
			//Query object for fetching the data from datastore
			Query q = new Query("Booking");
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				bookingId=  e.getProperty("bookingId").toString();
				bookingUserId = e.getProperty("bookingUserId").toString();
				bookingBikeId = e.getProperty("bookingBikeId").toString();
				bookingName = e.getProperty("bookingName").toString();
				bookingBranch = e.getProperty("bookingBranch").toString();
				bookingDLNo = e.getProperty("bookingDLNo").toString();
				bookingPickupDate=  e.getProperty("bookingPickupDate").toString();
				bookingPickupTime = e.getProperty("bookingPickupTime").toString();
				bookingDropDate = e.getProperty("bookingDropDate").toString();
				bookingDropTime = e.getProperty("bookingDropTime").toString();
				bookingStatus = e.getProperty("bookingStatus").toString();
				bookingTariffSelected = e.getProperty("bookingTariffSelected").toString();
				bookingTime = e.getProperty("bookingTime").toString();
		%>

		<tr>
			<td><%= bookingId %></td>
			<td><%= bookingUserId %></td>
			<td><%= bookingBikeId %></td>
			<td><%= bookingName %></td>
			<td><%= bookingBranch %></td>
			<td><%= bookingDLNo %></td>
			<td><%= bookingPickupDate %></td>
			<td><%= bookingPickupTime %></td>
			<td><%= bookingDropDate %></td>
			<td><%= bookingDropTime %></td>
			<td><%= bookingStatus %></td>
			<td><%= bookingTariffSelected %></td>
			<td><%= bookingTime %></td>
		</tr>
		<%} %>
	</table>
</center>
</body>
</html>