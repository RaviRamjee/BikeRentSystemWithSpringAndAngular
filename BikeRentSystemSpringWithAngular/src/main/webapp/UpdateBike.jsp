<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page
	import="com.google.appengine.api.datastore.Query.FilterOperator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Bike</title>
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
			bikeData["bikeId"] = $("#bikeId").val();
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
			
		    alert('do you want to update Bike ?')
			$.ajax({
				type : "PUT",
				contentType : "application/json",
				url : "updateBike",
				data : JSON.stringify(bikeData),
				dataType : 'json',				
				success: function() {       
			          alert('updated succesfully')
			         
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
							<h1 style="font-size: 200%; color: White" class="blog-title">Update Bike</h1>
							<div id="success"></div>
							<form id="contactForm">
							<%
							
							String bikeId=request.getParameter("bikeId");
							//getting datastore service
							DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
                                 String tariffId1=""; 
                         		 String bikeName="";
                         		 String bikeDescription="";
                         		 String bikeCategory="";
                         		 String bikeCompany="";
                         		 String bikeModel="";
                         		 String bikeRCNo="";
                         		 String bikeRCName="";
                         		 String bikeRCRegDate="";
                         		 String bikeRCExpDate="";
                         		 String bikeRCCHNO="";
                         		 String bikeRCEnginNo="";
                         		 String bikeYearMfg="";
                         		 int bikeNoOfGear;
                         		 String bikeColor="";
                         		 int selfstart;
                         		 int bikeEnginCC;
                         		 int status;
                         		 String bikeImage="";
                         		 
                                  Query q1 = new Query("Bike").addFilter("bikeId", FilterOperator.EQUAL, bikeId);
      							PreparedQuery pq1 = ds.prepare(q1);
      							for (Entity e : pq1.asIterable()) {
      								tariffId1 = e.getProperty("tariffId").toString();
      								bikeName = e.getProperty("bikeName").toString();
      								bikeDescription = e.getProperty("bikeDescription").toString();
      								bikeCategory = e.getProperty("bikeCategory").toString();
      								bikeCompany = e.getProperty("bikeCompany").toString();
      								bikeModel = e.getProperty("bikeModel").toString();
      								bikeRCNo=  e.getProperty("bikeRCNo").toString();
      								bikeRCName = e.getProperty("bikeRCName").toString();
      								bikeRCRegDate = e.getProperty("bikeRCRegDate").toString();
      								bikeRCExpDate = e.getProperty("bikeRCExpDate").toString();
      								bikeRCCHNO = e.getProperty("bikeRCCHNO").toString();
      								bikeRCEnginNo = e.getProperty("bikeRCEnginNo").toString();
      								bikeYearMfg=  e.getProperty("bikeYearMfg").toString();
      								bikeNoOfGear = Integer.parseInt(e.getProperty("bikeNoOfGear").toString());
      								bikeColor = e.getProperty("bikeColor").toString();
      								selfstart = Integer.parseInt(e.getProperty("selfStart").toString());
      								bikeEnginCC =Integer.parseInt( e.getProperty("bikeEnginCC").toString());
      								status =Integer.parseInt(e.getProperty("status").toString());
      								bikeImage = e.getProperty("bikeImage").toString();
      								
                                  %>
                                  
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike id</label>
                                      <input type="hidden" name="bikeId" class="form-control" id="bikeId" placeholder="Enter Bike_name" value="<%= bikeId%>">
                                  </div>
                                  
                                  <% 
                            String tariffId="";
						    String tariffName="";
							//Query object for fetching the data from datastore
							Query q = new Query("Tariff");
							PreparedQuery pq = ds.prepare(q);
									%>
									
                                 <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Tariff Name</label>
                                      <select name="tariffId" class="form-control" id="tariffId" placeholder="Enter tariff name" value="<%=tariffId1 %>">
                                         <% 
							for (Entity e1 : pq.asIterable()) {
								tariffId=  e1.getProperty("tariffId").toString();
								tariffName = e1.getProperty("tariffName").toString();
							%>
                                          <option value="<%= tariffId%>"><%= tariffName %></option>
                                          <%} %>
                                      </select>    
                                  </div>
								 <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike name</label>
                                      <input type="text" name="bikeName" class="form-control" id="bikeName" placeholder="Enter Bike_name" value="<%= bikeName%>">
                                  </div>
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputPassword1">Bike description</label>
                                      <input type="text" name="bikeDescription" class="form-control" id="bikeDescription" placeholder="Enter Bike_description"  value="<%= bikeDescription%>">
                                  </div>
                                  
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Select Bike Category</label>
                                      <select name="bikeCategory" class="form-control" id="bikeCategory" placeholder="#"  value="<%= bikeCategory%>">
                                          <option value="Scooty">Scooty</option>
                                          <option value="Tourer">Tourer</option>
                                          <option value="Adventure">Adventure</option>
                                          <option value="CityBike">CityBike</option>
                                      </select>                              
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike company</label>
                                      <input type="text" name="bikeCompany" class="form-control" id="bikeCompany" placeholder="Enter Bike_company"  value="<%= bikeCompany%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike Model</label>
                                      <input type="text" name="bikeModel" class="form-control" id="bikeModel" placeholder="Enter Bike_Model"  value="<%= bikeModel%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC No</label>
                                      <input type="text" name="bikeRCNo" class="form-control" id="bikeRCNo" placeholder="Enter Bike_RC_No"  value="<%= bikeRCNo%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC Name</label>
                                      <input type="text" name="bikeRCName" class="form-control" id="bikeRCName" placeholder="Enter Bike_RC_Name"  value="<%= bikeRCName%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC RegDate</label>
                                      <input type="date" name="bikeRCRegDate" class="form-control" id="bikeRCRegDate" placeholder="Enter Bike_RC_RegDate"  value="<%= bikeRCRegDate%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC ExpDate</label>
                                      <input type="date" name="bikeRCExpDate" class="form-control" id="bikeRCExpDate" placeholder="Bike_RC_ExpDate"  value="<%= bikeRCExpDate%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC CHNO</label>
                                      <input type="text" name="bikeRCCHNO" class="form-control" id="bikeRCCHNO" placeholder="Enter Bike_RC_CHNO"  value="<%= bikeRCCHNO%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike RC EnginNo</label>
                                      <input type="text" name="bikeRCEnginNo" class="form-control" id="bikeRCEnginNo" placeholder="Enter Bike_RC_EnginNo"  value="<%= bikeRCEnginNo%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike_YearMfg</label>
                                      <input type="text" name="bikeYearMfg" class="form-control" id="bikeYearMfg" placeholder="Enter Bike_YearMfg"  value="<%= bikeYearMfg%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike NoOfGear</label>
                                      <input type="text" name="bikeNoOfGear" class="form-control" id="bikeNoOfGear" placeholder="Enter Bike_NoOfGear"  value="<%= bikeNoOfGear%>">
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike color</label>
                                      <input type="text" name="bikeColor" class="form-control" id="bikeColor" placeholder="Enter Bike_color"  value="<%= bikeColor%>">
                                  </div>
                                  <div class="form-group col-lg-6">
                                  <label for="exampleInputFile">Self Start</label>
                                      <select name="selfstart" id="selfstart" class="form-control"  value="<%= selfstart%>">
                                          <option value="1">Yes</option>
                                          <option value="0">No</option>
                                      </select>
                                  </div>
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike Engin CC</label>
                                      <input type="text" name="bikeEnginCC" class="form-control" id="bikeEnginCC" placeholder="Enter Bike_Engin_CC"  value="<%= bikeEnginCC%>">
                                  </div>
                                  <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Status</label>
                                      <select name="status" id="status" class="form-control"  value="<%= status%>">
                                          <option value="1">Active</option>
                                          <option value="0">Non Active</option>
                                      </select>
                                  </div>
                                   <div class="form-group col-lg-6">
                                      <label for="exampleInputEmail1">Bike Image link</label>
                                      <input type="text" name="bikeImage" class="form-control" id="bikeImage" placeholder="Bike Image Link"  value="<%= bikeImage%>">
                                  </div>
                                  <%} %>
								<br>
								<center>
									<button type="submit"
										class="btn button button--red triangle triangle--12" id="submit"
										value="SignUp">Update</button>
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