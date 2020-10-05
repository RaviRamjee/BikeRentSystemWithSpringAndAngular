<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

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
           //getting current date
           DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
   		   LocalDateTime now = LocalDateTime.now();
   		   String minDate = dtf.format(now);
   		   
   		   //getting current time
   		  long date = System.currentTimeMillis();
	   SimpleDateFormat sdf=new SimpleDateFormat("kk:mm");
	   String minTime = sdf.format(date);
           %>
	<center>
		<h2>
			<b>Please fill Booking Details</b>
		</h2>
		<br>
		<form onsubmit="return validation()" action="Reg.jsp" method="post" id="contactForm">
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="col-xs-12 col-sm-6 col-md-7">
					<div class="comment-form__input">
						<h5>Pickup Date:</h5>
						<input type="date" class="formc" name="bookingPickupDate" min="<%= minDate %>"
							id="bookingPickupDate" required>
					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-5">
					<div class="comment-form__input">
						<h5>Pickup Time:</h5>
						<input type="time" name="bookingPickupTime" id="bookingPickupTime" min="<%= minTime %>"
							class="formc" required>
							<!-- <option value="09:00">9:00AM</option>
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
						</select> -->
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="col-xs-12 col-sm-6 col-md-7">
					<div class="comment-form__input">
						<h5>Drop Date:</h5>
						<input type="date" class="formc" name="bookingDropDate" min="<%= minDate %>"
							id="bookingDropDate" required>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-5">
					<div class="comment-form__input">
						<h5>Drop time:</h5>
						<select name="bookingDropTime" id="bookingDropTime" class="formc"
							required>
							<option value="09:00">9:00AM</option>
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
						<span id="DropTime"></span>
					</div>
				</div>
			</div>

			<br>
					
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-6">
				<div class="comment-form__input">
					<h5>Pickup Station:</h5>
					<select name="bookingBranch" id="bookingBranch" class="formc"
						required>
						<option value="btm Layout">BTM Layout</option>
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
					class="btn btn-primary" id="submit">Book</button>
				<br> <br> <br>
			</div>
		</form>
	</center>
	<script type="text/javascript">
	function validation()
	{
		var pickupDate=document.getElementById('bookingPickupDate').value;
		var pickupTime=document.getElementById('bookingPickupTime').value;
		var dropDate=document.getElementById('bookingDropDate').value;
		var dropTime=document.getElementById('bookingDropTime').value;
		
		var d = new Date(); // for now
		d.getHours(); // => 9
		d.getMinutes(); // =>  30
		d.getSeconds(); // =
		
		if(dropTime < pickupTime){
			document.getElementById('DropTime').innerHTML=" * drop time must be greater than pickup time";
			return false;
	}
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>