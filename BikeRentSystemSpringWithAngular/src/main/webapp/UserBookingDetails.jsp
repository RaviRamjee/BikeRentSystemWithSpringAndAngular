<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page import="com.spring.user.UserDao"%>
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
	float: left;
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
	if(session.getAttribute("userEmail")==null)
	{
	    response.sendRedirect("Login.jsp");
	}
	%>

	<%
	String email=(String)session.getAttribute("userEmail");
	%>
	<ul>
		<li><a href="WelcomeHomepage.jsp">Home</a></li>
		<li><a href="userLogout">Logout</a></li>
		<li><a href="#"><%= email %></a></li>
	</ul>
	<br>
<center>
<h1>Your Bookings details</h1>

<hr>
	<table style="float:right">
		<tr>
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
		    UserDao dao=new UserDao();
		    String userId=dao.getUserIdByEmail(email);
			//getting datastore service
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

		    String bookingId="";
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
			Query q = new Query("Booking").addFilter("bookingUserId", FilterOperator.EQUAL, userId);
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				bookingId=  e.getProperty("bookingId").toString();
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

       <%if(bookingBikeId==null)
    	   {
    	     %>
    	     <h3>You have no bookings....</h3>
    	     <%
    	     break;
    	   }
    	   %>
		<tr>
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
			<td><a href="cancelBooking?bookingId=<%= bookingId %>"><button type="button" onclick="btnSelect_Click()">cancel</button></a></td>
		</tr>
		<%} %>
	</table>
	<h3><p id="demo"></p></h3>
	<script language="javascript">    
	function btnSelect_Click() {
	    var strconfirm = confirm("Are you sure want to delete?");
	    if (strconfirm == true) {
	    	document.getElementById("demo").innerHTML = "booking Cancelled..";
	    }
	}   
</script> 
</center>
</body>
</html>