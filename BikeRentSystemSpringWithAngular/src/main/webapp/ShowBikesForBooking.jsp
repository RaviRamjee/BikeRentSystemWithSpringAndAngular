
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
<title>ShowBikesForBooking</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 20px
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

li
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#111
;


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
		if (session.getAttribute("userEmail") == null) {
			response.sendRedirect("Login.jsp");
		}
	%>
	<%
		String email = (String) session.getAttribute("userEmail");
	%>
	<ul>
		<li><a href="#"><%=email%></a></li>
		<li><a href="userLogout">Logout</a></li>
	</ul>

	<div class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin-top: 100px">

		<%
			//getting datastore service
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

			String bikeId = "";
			String tariffId="";
			String bikeName = "";
			String bikeDescription = "";
			String bikeCategory = "";
			String bikeCompany = "";
			String bikeImage = "";
			//Query object for fetching the data from datastore
			Query q = new Query("Bike");
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				bikeId = e.getProperty("bikeId").toString();
				tariffId = e.getProperty("tariffId").toString();
				bikeName = e.getProperty("bikeName").toString();
				bikeDescription = e.getProperty("bikeDescription").toString();
				bikeCategory = e.getProperty("bikeCategory").toString();
				bikeCompany = e.getProperty("bikeCompany").toString();
				bikeImage = e.getProperty("bikeImage").toString();
		%>
		<!-- First Photo Grid-->
		<div class="w3-row-padding w3-padding-16 w3-center" id="food">
			<div class="w3-quarter">
				<img src="<%=bikeImage%>" alt="<%=bikeName%>" style="width: 50%">
				<a href="Booking.jsp?bikeId=<%=bikeId%>"><h3><%=bikeName%></h3></a>
				<p><%=bikeDescription%></p>
			</div>
			<%
				}
			%>
		</div>
</body>
</html>