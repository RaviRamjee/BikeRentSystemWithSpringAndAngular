<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page
	import="com.google.appengine.api.datastore.Query.FilterOperator"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Form</title>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}
table.center {
  margin-left: auto;
  margin-right: auto;
}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
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
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
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

	<center>
		<h2>
			<b>Update Booking Details</b>
		</h2>
		<br>
		<form id="contactForm">
			<%
				String bikeId = request.getParameter("bikeId");

				//getting datastore service
				DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

				String tariffId = "";
				//Query object for fetching the data from datastore
				Query q = new Query("Bike").addFilter("bikeId", FilterOperator.EQUAL, bikeId);
				PreparedQuery pq = ds.prepare(q);
				for (Entity e : pq.asIterable()) {
					tariffId = e.getProperty("tariffId").toString();
					/* bikeName = e.getProperty("bikeName").toString();
					bikeDescription = e.getProperty("bikeDescription").toString();
					bikeCategory = e.getProperty("bikeCategory").toString();
					bikeCompany = e.getProperty("bikeCompany").toString();
					bikeImage = e.getProperty("bikeImage").toString(); */
				}
			%>



			<div class="comment-form__input">

				<input type="hidden" value="<%=bikeId%>" class="formc"
					name="bookingBikeId" id="bookingBikeId">
			</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="col-xs-12 col-sm-6 col-md-7">
					<div class="comment-form__input">
						<h5>Pickup Date:</h5>
						<input type="date" class="formc" name="bookingPickupDate"
							id="bookingPickupDate" required>
					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-5">
					<div class="comment-form__input">
						<h5>Pickup Time:</h5>
						<select name="bookingPickupTime" id="bookingPickupTime"
							class="formc" required>
							<option value="9:00">9:00AM</option>
							<option value="10:00">10:00AM</option>
							<option value="11:00">11:00AM</option>
							<option value="12:00">12:00AM</option>
							<option value="13:00">1:00PM</option>
							<option value="14:00">2:00PM</option>
							<option value="15:00">3:00PM</option>
							<option value="16:00">4:00PM</option>
							<option value="17:00">5:00PM</option>
							<option value="18:00">6:00PM</option>
							<option value="19:00">7:00PM</option>
							<option value="20:00">8:00PM</option>
							<option value="21:00">9:00PM</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="col-xs-12 col-sm-6 col-md-7">
					<div class="comment-form__input">
						<h5>Drop Date:</h5>
						<input type="date" class="formc" name="bookingDropDate"
							id="bookingDropDate" required>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-5">
					<div class="comment-form__input">
						<h5>Drop time:</h5>
						<select name="bookingDropTime" id="bookingDropTime" class="formc"
							required>
							<option value="9:00">9:00AM</option>
							<option value="10:00">10:00AM</option>
							<option value="11:00">11:00AM</option>
							<option value="12:00">12:00AM</option>
							<option value="13:00">1:00PM</option>
							<option value="14:00">2:00PM</option>
							<option value="15:00">3:00PM</option>
							<option value="16:00">4:00PM</option>
							<option value="17:00">5:00PM</option>
							<option value="18:00">6:00PM</option>
							<option value="19:00">7:00PM</option>
							<option value="20:00">8:00PM</option>
							<option value="21:00">9:00PM</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="comment-form__input">
					<h5>Name:</h5>
					<input type="text" class="formc" name="bookingName"
						id="bookingName" required>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="comment-form__input">
					<h5>Driving License No:</h5>
					<input type="text" class="formc" name="bookingDLNo"
						id="bookingDLNo" required>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="comment-form__input">
					<h5>Select Tariff Plan</h5>
					<%
						String tariffDetailsId = "";
						int tariffDurationHours;
						double tariffAmount;
						int tariffRideLimitInKM;
						double afterLimitAmountPerHour;
						int afterLimitKM;
						Query q1 = new Query("TariffDetails").addFilter("tariffId", FilterOperator.EQUAL, tariffId);
						PreparedQuery pq1 = ds.prepare(q1);
						for (Entity e : pq1.asIterable()) {
							tariffDetailsId = e.getProperty("tariffDetailsId").toString();
							tariffId = e.getProperty("tariffId").toString();
							tariffDurationHours = Integer.parseInt(e.getProperty("tariffDurationHours").toString());
							tariffAmount = Double.parseDouble(e.getProperty("tariffAmount").toString());
							tariffRideLimitInKM = Integer.parseInt(e.getProperty("tariffRideLimitInKM").toString());
							afterLimitAmountPerHour = Double.parseDouble(e.getProperty("afterLimitAmountPerHour").toString());
							afterLimitKM = Integer.parseInt(e.getProperty("afterLimitKM").toString());
					%>
					<table>
						<tr>
							<th>tariffDurationHours</th>
							<th>tariffAmount</th>
							<th>tariffRideLimitInKM</th>
							<th>afterLimitAmountPerHour</th>
							<th>afterLimitKM</th>
						</tr>

						<input type="radio" required id="bookingTariffSelected"
							name="bookingTariffSelected" value="<%=tariffDetailsId%>">
						<label for="<%=tariffDetailsId%>">
							<tr>
								<td><%=tariffDurationHours%></td>
								<td><%=tariffAmount%></td>
								<td><%=tariffRideLimitInKM%></td>
								<td><%=afterLimitAmountPerHour%></td>
								<td><%=afterLimitKM%></td>
							</tr>
					</table>
					</label><br>
					<%
						}
					%>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="comment-form__input">
					<h5>Pickup Station:</h5>
					<select name="bookingBranch" id="bookingBranch" class="formc"
						required>
						<option value="btm Layout">btm Layout</option>
						<option value="Marathalli">Marathalli</option>
						<option value="WhiteField">WhiteField</option>
						<option value="Koremangala">Koremangala</option>
						<option value="SilkBoard">SilkBoard</option>
					</select>
				</div>
			</div>
			<br>
			<div class="col-md-9 col-md-offset-0">
				<button type="submit" value="submit"
					class="btn button button--red triangle triangle--12" id="submit">Book</button>
				<br> <br> <br>
			</div>
		</form>
	</center>
</body>
</html>