<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap">
        <link rel="stylesheet" href="style.css">
</head>
<body>
<%@include file ="./header.jsp" %>

<h1 style="margin-left : 680px;">
<%
if(request.getAttribute("logoutMessage")!= null)
{
String logoutMessage = "" + request.getAttribute("logoutMessage");
out.print(logoutMessage);
}
%>
</h1>

<form action="./LoginServlet" method="post" class="autentication">
	<h1 style="margin-left : 150px;margin-top : -25px;">Login</h1>
  		<input type="email"  name="email">
  		<input type="password"  name="password">
  		<button type="submit" value="SIGN-IN" style="margin-left : 150px">Accedi</button>
</form> 
<form action="./registration.html" method="post" class="autentication">
	<button type="submit" value="REGISTRATI" style="margin-left : 140px">Registrati</button>
</form> 
		
</body>
</html>