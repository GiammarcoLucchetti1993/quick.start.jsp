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

	<form method="post" action="./users.jsp"
		class="autentication">
		<h1 style="margin-left: 100px; margin-top: -25px;">Inserimento Utente</h1>
		<input type=text id="email" placeholder="Email" name="email_input"
			required> <input type="text" id="password"
			placeholder="Password" name="password_input" maxlength="50" required>
		<input type="text" id="firstname" placeholder="Firstname"
			name="firstname_input" required> <input type="text"
			id="lastname" placeholder="Lastname" name="lastname_input"
			maxlength="50" required> <input type="date" id="birthdate"
			placeholder="Birthdate" name="birthdate_input" required>
		<!--             <input type="number" id="role" placeholder="Role" name="role_input" required> -->
		<button type="submit" name="register" style="margin-left: 135px">Inserisci</button>
	</form>

</body>
</html>