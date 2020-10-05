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
<title>Show Users</title>
<style>
div.scrollmenu {
  background-color: #333;
  overflow: auto;
  white-space: nowrap;
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
	
	
<center><h1>All Bikes</h1></center>
<div class="class="scrollmenu">
	<table style="float:right">
		<tr>
			<th>bikeId</th>
			<th>tariffId</th>
			<th>bikeName</th>
			<th>bikeDescription</th>
			<th>bikeCategory</th>
			<th>bikeCompany</th>
			<th>bikeModel</th>
			<th>bikeRCNo</th>
			<th>bikeRCName</th>
			<th>bikeRCRegDate</th>
			<th>bikeRCExpDate</th>
			<th>bikeRCCHNO</th>
			<th>bikeRCEnginNo</th>
			<th>bikeYearMfg</th>
			<th>bikeNoOfGear</th>
			<th>bikeColor</th>
			<th>selfstart</th>
			<th>bikeEnginCC</th>
			<th>status</th>
			<th>bikeImage</th>
		</tr>
		<%
			//getting datastore service
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();

		 String bikeId="";
	     String tariffId="";
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
			//Query object for fetching the data from datastore
			Query q = new Query("Bike");
			PreparedQuery pq = ds.prepare(q);
			for (Entity e : pq.asIterable()) {
				bikeId=  e.getProperty("bikeId").toString();
				tariffId = e.getProperty("tariffId").toString();
				bikeName = e.getProperty("bikeName").toString();
				bikeDescription = e.getProperty("bikeDescription").toString();
				bikeCategory = e.getProperty("bikeCategory").toString();
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

		<tr>
			<td><%= bikeId%></td>
			<td><%=tariffId%></td>
			<td><%=bikeName%></td>
			<td><%=bikeDescription%></td>
			<td><%=bikeCategory%></td>
			<td><%=bikeCompany%></td>
			<td><%=bikeModel%></td>
			<td><%=bikeRCNo%></td>
			<td><%=bikeRCName%></td>
			<td><%=bikeRCRegDate%></td>
			<td><%=bikeRCExpDate%></td>
			<td><%=bikeRCCHNO%></td>
			<td><%=bikeRCEnginNo%></td>
			<td><%=bikeYearMfg%></td>
			<td><%=bikeNoOfGear%></td>
			<td><%=bikeColor%></td>
			<td><%=selfstart%></td>
			<td><%=bikeEnginCC%></td>
			<td><%=status%></td>
			<td><%=bikeImage%></td>
			<td><a href="UpdateBike.jsp?bikeId=<%= bikeId %>">update</a></td>
			<td><a href="deleteBike?bikeId=<%= bikeId %>">delete</a></td>
		</tr>
		
		<%} %>
	</table>
	</div>
</body>
</html>