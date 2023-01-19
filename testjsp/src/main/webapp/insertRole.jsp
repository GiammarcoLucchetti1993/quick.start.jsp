<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@include file="./autentication.jsp"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap">
<link rel="stylesheet" href="./style.css">
</head>
<body>
	<%@include file="./header.jsp"%>

	<form method="post" action="./InsertRoleServlet"
		class="autentication">
		<h1 style="margin-left: 80px; margin-top: -25px;">Inserimento Ruolo</h1>
		<input type=text id="label" placeholder="Label" name="label_input"
			required> <input type="text" id="description"
			placeholder="Description" name="description_input" maxlength="50" required>
		<input type="number" id="level" placeholder="Level"
			name="level_input" required> 
		<!--             <input type="number" id="role" placeholder="Role" name="role_input" required> -->
		<button type="submit" name="register" style="margin-left: 135px">Inserisci</button>
	</form>

</body>
</html>