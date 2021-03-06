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
<title>Add Tariff</title>
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
			var tariffData = {};
			tariffData["tariffName"] = $("#tariffName").val();
			tariffData["tariffDescription"] = $("#tariffDescription").val();
			tariffData["tariffStatus"] = $("#tariffStatus").val();
			
		    alert('do you want to add tariff ?')
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "addTariff",
				data : JSON.stringify(tariffData),
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
 <span id="msg"></span>
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
							Tariff</h1>
						<div id="success"></div>

						<form id="contactForm">

							<div class="form-group col-lg-6">
								<label for="exampleInputEmail1">Tariff Name</label>
									<input type="text" name="tariffName" class="form-control" id="tariffName"
									placeholder="Enter tariff name">
							</div>
							<div class="form-group col-lg-6">
								<label for="exampleInputEmail1">tariff Description</label>
								 <input	type="text" name="tariffDescription" class="form-control"
									id="tariffDescription" placeholder="Enter tariffDescription">
							</div>
							<div class="form-group col-lg-6">
								<label for="exampleInputPassword1">tariff status</label> <input
									type="text" name="tariffStatus" class="form-control"
									id="tariffStatus" placeholder="Enter tariffstatus"
									value="Active">
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