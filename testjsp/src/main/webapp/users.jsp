<%@page import="service.UserService"%>
<%@page import="singleton.DatabaseManagerSingleton"%>
<%@page import="pojo.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@include file ="./autentication.jsp" %>

<%-- <% --%>

<!--  String utenteLoggato = "" + session.getAttribute("userLoggedEmail"); -->

<%-- %> --%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap">
        <link rel="stylesheet" href="style.css">
</head>
<body>
<%@include file ="./header.jsp" %>
<%-- 	<%@include file="./header.jsp" %> --%>
<%-- 	<h1>BENVENUTO TI SEI LOGGATO COME : <%= utenteLoggato%> </h1> --%>
<form action="./DeleteUserServlet" >
<table>
	<tr>
		<th></th>
		<th>ID</th>
		<th>EMAIL</th>
		<th>PASSWORD</th>
		<th>FIRSTNAME</th>
		<th>LASTNAME</th>
		<th>BIRTHDATE</th>
		<th>REGDATE</th>
		<th>ROLE</th>
		<th>IMGPATH</th>
		<th>NOTE</th>
		<th>ENABLED</th>
	</tr>
<%
ArrayList<User> users = UserService.getInstance().selectAllUsers();
	for(User tableUsers : users){
%>
		<tr>
			<td><input type="radio" name="selectedUserId" value="<%out.print(tableUsers.getId());%>"></td>
			<td><%out.print(tableUsers.getId()); %></td>
			<td><%out.print(tableUsers.getEmail()); %></td>
			<td><%out.print(tableUsers.getPassword()); %></td>
			<td><%out.print(tableUsers.getFirstName()); %></td>
			<td><%out.print(tableUsers.getLastName()); %></td>
			<td><%out.print(tableUsers.getDateOfBirth()); %></td>
			<td><%out.print(tableUsers.getRegDate()); %></td>
			<td><%out.print(tableUsers.getRole()); %></td>
			<td><%out.print(tableUsers.getImgPath()); %></td>
			<td><%out.print(tableUsers.getNote()); %></td>
			<td><%out.print(tableUsers.getEnabled()); %></td>
<%-- 			<td><%=item.getPassword()%></td> --%>	
		</tr>
		<%
	}

%>
</table>
<br/>
<button type="submit" value="CANCELLA" class="buttonDelete">ELIMINA</button>
</form>

<!-- <form action="./login.jsp" method="post"> -->
<!-- 	<button type="submit" value="Torna_Indietro" class="buttonBack">TORNA INDIETRO</button> -->
<!-- </form> -->

<!-- <form action="./LogoutServlet" method="post"> -->
<!-- 	<button type="submit" value="Log_out" class="buttonLogout">LOG OUT</button> -->
<!-- </form> -->

</body>
</html>