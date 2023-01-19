<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="service.UserService"%>
<%@page import="proxima.informatica.academy.dto.UserDto"%>
<!DOCTYPE html>
<%@include file="./autentication.jsp"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap">
        <link rel="stylesheet" href="./style.css">
</head>
<body>
	<%@include file="./header.jsp"%>

	<%int id = Integer.parseInt(request.getParameter("selectedUserId"));%>
	<%UserDto users = UserService.getInstance().selectUserById(id);%>
	
	<form method="post" action=./UpdateUserServlet>
	<table>
	<tr>
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
	<tr>
				<td>
				  <input type=text id="id" placeholder="Id" name="id_input" value="<%=users.getId()%>" readonly="readonly">
				</td>
				<td>
					<input type=text id="email" placeholder="Email" name="email_input" value="<%=users.getEmail()%>">
				</td>
				<td>
					<input type=text id="password" placeholder="Password" name="password_input" value="<%=users.getPassword()%>">
				</td>
				<td>
					<input type=text id="firstname" placeholder="Firstname" name="firstname_input" value="<%=users.getFirstName()%>">
				</td>
				<td>
					<input type=text id="lastname" placeholder="Lastname" name="lastname_input" value="<%=users.getLastName()%>">
				</td>
				<td>
					<input type=date id="birthdate" placeholder="Birthdate" name="birthdate_input" value="<%=users.getDateOfBirth()%>">
				</td>
				<td>
					<input type=datetime-local id="regdate" placeholder="Regdate" name="regdate_input" value="<%=users.getRegDate()%>">
				</td>
				<td>
					<input type=number id="role" placeholder="Role" name="role_input" value="<%=users.getRole()%>">
				</td>
				<td>
					<input type=text id="imgpath" placeholder="Imgpath" name="imgpath_input" value="<%=users.getImgPath()%>">
				</td>
				<td>
					<input type=text id="note" placeholder="Note" name="note_input" value="<%=users.getNote()%>">
				</td>
				<td>
					<input type=number id="enabled" placeholder="Enabled" name="enabled_input" value="<%=users.getEnabled()%>">
				</td>
			</tr>
	</table>
	<br/>
	<button type="submit" name="modifica" style="margin-left : 800px">Modifica</button>
	</form>
	<form action="./users.jsp" method="post">
	<button type="submit" name="Torna_Indietro" style="margin-left : 785px">Torna Indietro</button>
	</form> 

</body>
</html>