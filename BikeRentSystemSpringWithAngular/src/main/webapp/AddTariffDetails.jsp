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
<title>Add Tariff Details</title>
<style>
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
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script>
	jQuery(document).ready(function($) {

		$("#submit").click(function(){
			var tariffDetailsData = {};
			tariffDetailsData["tariffId"] = $("#tariffId").val();
			tariffDetailsData["tariffDurationHours"] = $("#tariffDurationHours").val();
			tariffDetailsData["tariffAmount"] = $("#tariffAmount").val();
			tariffDetailsData["tariffRideLimitInKM"] = $("#tariffRideLimitInKM").val();
			tariffDetailsData["afterLimitAmountPerHour"] = $("#afterLimitAmountPerHour").val();
			tariffDetailsData["afterLimitKM"] = $("#afterLimitKM").val();
			
		    alert('do you want to add tariffDetails ?')
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "addTariffDetails",
				data : JSON.stringify(tariffDetailsData),
				dataType : 'json',				
				success: function() {       
			          alert('added succesfully')
			         
					},
					error: function(data) {
						alert('failed')
						
					}
			});
		});

	});
</script>	
</head>
<body>
	<div class="switcher-wrapper">
		<div class="demo_changer">
			<div class="demo-icon customBgColor">
				<i class="fa fa-cog fa-spin fa-2x"></i>
			</div>
			<div class="form_holder">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="predefined_styles"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<ul>
		<%response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		if(session.getAttribute("adminEmail")==null)
	{
	    response.sendRedirect("Login.jsp");
	}
	%>

		<%
	String email=(String)session.getAttribute("adminEmail");
	%>
		<li><a href="AdminHomepage.jsp">Home</a></li>
		<li><a href="adminLogout">Logout</a></li>
		<li><a href="#"><%= email %></a></li>
	</ul>

	<jsp:include page='Sidebar.jsp'></jsp:include>

	<section class="contacts">
	<div class="container">
		<div class="row">
			<div class="contacts-find">
				<div class="col-md-5 col-md-offset-3">
					<div class="contacts-form"
						style="background-color: rgba(80, 54, 84, 0.6); height: 100%">
						<h1 style="font-size: 200%; color: White" class="blog-title">Add
							Tariff Details</h1>
						<div id="success"></div>

						<%
							//getting datastore service
							DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

						    String tariffId="";
						    String tariffName="";
							//Query object for fetching the data from datastore
							Query q = new Query("Tariff");
							PreparedQuery pq = ds.prepare(q);
									%>

						<form  id="contactForm">

							<div class="form-group col-lg-6">
								<label for="exampleInputEmail1">Tariff Name</label>
								 <select name="tariffId" id="tariffId" class="form-control" 
									placeholder="Enter tariff name">
									<% 
							for (Entity e : pq.asIterable()) {
								tariffId=  e.getProperty("tariffId").toString();
								tariffName = e.getProperty("tariffName").toString();
							%>
									<option value="<%= tariffId%>"><%= tariffName %></option>
									<%} %>
								</select>
							</div>

							<div class="form-group col-lg-6">
								<label for="exampleInputEmail1">tariff Duration Hours</label> <input
									type="text" name="tariffDurationHours" id="tariffDurationHours" class="form-control"
									 placeholder="Enter tariffDurationHours">
							</div>
							<div class="form-group col-lg-6">
								<label for="exampleInputPassword1">tariff Amount</label> <input
									type="text" name="tariffAmount" id="tariffAmount" class="form-control"
									 placeholder="Enter tariffAmount">
							</div>
							<div class="form-group col-lg-6">
								<label for="exampleInputEmail1">tariff RideLimit In KM</label> <input
									type="text" name="tariffRideLimitInKM" id="tariffRideLimitInKM" class="form-control"
									 placeholder="Enter tariffRideLimitInKM">
							</div>
							<div class="form-group col-lg-6">
								<label for="exampleInputPassword1">after Limit Amount
									Per Hour</label> <input type="text" name="afterLimitAmountPerHour" id="afterLimitAmountPerHour"
									class="form-control"
									placeholder="Enter afterLimitAmountPerHour">
							</div>
							<div class="form-group col-lg-6">
								<label for="exampleInputPassword1">after Limit KM</label> <input
									type="text" name="afterLimitKM" class="form-control"
									id="afterLimitKM" placeholder="Enter afterLimitKM">
							</div>


							<br>
							<center>
								<button type="submit"
									class="btn button button--red triangle triangle--12" id="submit"
									value="SignUp">Add</button>
							</center>
							<br>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>