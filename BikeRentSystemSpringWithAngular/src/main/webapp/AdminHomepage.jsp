<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Homepage</title>
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

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
</body>
</html>