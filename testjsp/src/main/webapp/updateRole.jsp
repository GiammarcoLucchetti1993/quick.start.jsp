<%@page import="service.RoleService"%>
<%@page import="proxima.informatica.academy.dto.RoleDto"%>
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

	<%int id = Integer.parseInt(request.getParameter("selectedRoleId"));%>
	<%RoleDto roles = RoleService.getInstance().selectRoleById(id);%>
	
	<form method="post" action=./UpdateRoleServlet>
	<table>
	<tr>
				<th>ID</th>
				<th>LABEL</th>
				<th>DESCRIPTION</th>
				<th>LEVEL</th>
	</tr>
	<tr>
				<td>
				  <input type=text id="id" placeholder="Id" name="id_input" value="<%=roles.getId()%>" readonly="readonly">
				</td>
				<td>
					<input type=text id="label" placeholder="Label" name="label_input" value="<%=roles.getLabel()%>">
				</td>
				<td>
					<input type=text id="description" placeholder="Descriptnon" name="description_input" value="<%=roles.getDescription()%>">
				</td>
				<td>
					<input type=number id="level" placeholder="Level" name="level_input" value="<%=roles.getLevel()%>">
				</td>
			</tr>
	</table>
	<br/>
	<button type="submit" name="modifica" style="margin-left : 800px">Modifica</button>
	</form>
	<form action="./roles.jsp" method="post">
	<button type="submit" name="Torna_Indietro" style="margin-left : 785px">Torna Indietro</button>
	</form> 

</body>
</html>