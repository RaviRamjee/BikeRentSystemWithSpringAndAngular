<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script>
	jQuery(document).ready(function($) {

		$("#submit").click(function(){
			var bikeData = {};
			bikeData["tariffId"] = $("#tariffId").val();
			bikeData["bikeName"] = $("#bikeName").val();
			bikeData["bikeDescription"] = $("#bikeDescription").val();
			bikeData["bikeCategory"] = $("#bikeCategory").val();
			bikeData["bikeCompany"] = $("#bikeCompany").val();
			bikeData["bikeModel"] = $("#bikeModel").val();
			bikeData["bikeRCNo"] = $("#bikeRCNo").val();
			bikeData["bikeRCName"] = $("#bikeRCName").val();
			bikeData["bikeRCRegDate"] = $("#bikeRCRegDate").val();
			bikeData["bikeRCExpDate"] = $("#bikeRCExpDate").val();
			bikeData["bikeRCCHNO"] = $("#bikeRCCHNO").val();
			bikeData["bikeRCEnginNo"] = $("#bikeRCEnginNo").val();
			bikeData["bikeYearMfg"] = $("#bikeYearMfg").val();
			bikeData["bikeNoOfGear"] = $("#bikeNoOfGear").val();
			bikeData["bikeColor"] = $("#bikeColor").val();
			bikeData["selfstart"] = $("#selfstart").val();
			bikeData["bikeEnginCC"] = $("#bikeEnginCC").val();
			bikeData["status"] = $("#status").val();
			bikeData["bikeImage"] = $("#bikeImage").val();
			
		    alert('do you want to add Bike ?')
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "addBike",
				data : JSON.stringify(bikeData),
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
							<!-- <a href="./UserDetails.html">Show Users</a>&nbsp <a href="./UpdateUserById.html">Update user</a>&nbsp <a href="./DeleteUser.html">Delete User</a> -->
							<h1 style="font-size: 200%; color: White" class="blog-title">Add Bike</h1>
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
									

							<form id="contactForm">
								
                                 <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Tariff Name</label>
                                      <select name="tariffId" class="form-control" id="tariffId" placeholder="Enter tariff name">
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
                                      <label for="exampleInputEmail1">Bike name</label>
                                      <input type="text" name="bikeName" class="form-control" id="bikeName" placeholder="Enter Bike_name">
                                  </div>
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputPassword1">Bike description</label>
                                      <input type="text" name="bikeDescription" class="form-control" id="bikeDescription" placeholder="Enter Bike_description">
                                  </div>
                                  
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Select Bike Category</label>
                                      <select name="bikeCategory" class="form-control" id="bikeCategory" placeholder="#">
                                          <option value="Scooty">Scooty</option>
                                          <option value="Tourer">Tourer</option>
                                          <option value="Adventure">Adventure</option>
                                          <option value="CityBike">CityBike</option>
                                      </select>                              
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike company</label>
                                      <input type="text" name="bikeCompany" class="form-control" id="bikeCompany" placeholder="Enter Bike_company">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike Model</label>
                                      <input type="text" name="bikeModel" class="form-control" id="bikeModel" placeholder="Enter Bike_Model">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC No</label>
                                      <input type="text" name="bikeRCNo" class="form-control" id="bikeRCNo" placeholder="Enter Bike_RC_No">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC Name</label>
                                      <input type="text" name="bikeRCName" class="form-control" id="bikeRCName" placeholder="Enter Bike_RC_Name">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC RegDate</label>
                                      <input type="date" name="bikeRCRegDate" class="form-control" id="bikeRCRegDate" placeholder="Enter Bike_RC_RegDate">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC ExpDate</label>
                                      <input type="date" name="bikeRCExpDate" class="form-control" id="bikeRCExpDate" placeholder="Bike_RC_ExpDate">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC CHNO</label>
                                      <input type="text" name="bikeRCCHNO" class="form-control" id="bikeRCCHNO" placeholder="Enter Bike_RC_CHNO">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC EnginNo</label>
                                      <input type="text" name="bikeRCEnginNo" class="form-control" id="bikeRCEnginNo" placeholder="Enter Bike_RC_EnginNo">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike_YearMfg</label>
                                      <input type="text" name="bikeYearMfg" class="form-control" id="bikeYearMfg" placeholder="Enter Bike_YearMfg">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike NoOfGear</label>
                                      <input type="text" name="bikeNoOfGear" class="form-control" id="bikeNoOfGear" placeholder="Enter Bike_NoOfGear">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike color</label>
                                      <input type="text" name="bikeColor" class="form-control" id="bikeColor" placeholder="Enter Bike_color">
                                  </div>
                                  <div class="form-group col-lg-6">
                                  <label for="exampleInputFile">Self Start</label>
                                      <select name="selfstart" id="selfstart" class="form-control">
                                          <option value="1">Yes</option>
                                          <option value="0">No</option>
                                      </select>
                                  </div>
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike Engin CC</label>
                                      <input type="text" name="bikeEnginCC" class="form-control" id="bikeEnginCC" placeholder="Enter Bike_Engin_CC">
                                  </div>
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Status</label>
                                      <select name="status" id="status" class="form-control">
                                          <option value="1">Active</option>
                                          <option value="0">Non Active</option>
                                      </select>
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike Image link</label>
                                      <input type="text" name="bikeImage" class="form-control" id="bikeImage" placeholder="Bike Image Link">
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