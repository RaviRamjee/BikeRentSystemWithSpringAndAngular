<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sidebar</title>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 10;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 18px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.dropbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
<div class="sidenav">
  <a href="ShowUsers.jsp">Show Users</a>
<hr>
  <a href="ShowBookings.jsp">Show Bookings</a>
<hr>
  <div class="dropdown">
  <a href="#">Bikes</a>
  <div class="dropdown-content">
    <a href="AddBike.jsp">Add Bikes</a>
    <a href="ShowBikes.jsp">Show Bikes</a>
  </div>
</div>
<hr>
  <div class="dropdown">
  <a href="#">Tariff</a>
  <div class="dropdown-content">
    <a href="AddTariff.jsp">Add Tariff</a>
    <a href="ShowTariff.jsp">Show Tariff</a>
  </div>
</div>
<hr>
  <div class="dropdown">
  <a href="#">Tariff Details</a>
  <div class="dropdown-content">
  <a href="AddTariffDetails.jsp">Add Tariff Details</a>
    <a href="ShowTariffDetails.jsp">Show Tariff Details</a>
  </div>
</div> 
</div>

</body>
</html>