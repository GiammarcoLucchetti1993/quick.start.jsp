<%@page import="service.UserService"%>
<%@page import="proxima.informatica.academy.dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@include file="./autentication.jsp"%>

<%
String utenteEliminato="";
if(request.getAttribute("deleteUser") == "OK"){
	utenteEliminato = "Sei riuscito ad eliminare l utente selezionato";
}if(request.getAttribute("deleteUser") == "KO"){
	utenteEliminato = "Non sei riuscito ad eliminare l utente selezionato";
}
%>

<%
String utenteModificato="";
if(request.getAttribute("updateUser") == "OK"){
	utenteModificato = "Modifica andata a buon fine";
}if(request.getAttribute("updateUser") == "KO"){
	utenteModificato = "Modificata non riuscita";
}
%>

<%
String loginMessage = "";
if(request.getAttribute("loginMessage") != null){
	loginMessage = "" + request.getAttribute("loginMessage");
}else{
	loginMessage = "";
}
%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap">
<link rel="stylesheet" href="style.css">

<script type="text/javascript">
	function abilitaBottone() {
		console.log("questa è una stampa di console");
		document.getElementById("deleteButton").disabled=false;
		document.getElementById("modificaButton").disabled=false;
	}
	function modificaUser(){
		console.log("modifica");
		document.getElementById("formSelezioneUser").action = "./updateUser.jsp";
		document.getElementById("formSelezioneUser").submit();
	}
	function deleteUser(){
		console.log("delete");
		document.getElementById("formSelezioneUser").action = "./DeleteUserServlet";
		document.getElementById("formSelezioneUser").submit();
	}
</script>
</head>
<body>
	<%@include file="./header.jsp"%>
	
	
	<h3 style="margin-left:710px;color:white;"><%= utenteEliminato%></h3>
	<h3 style="margin-left:710px;color:white;"><%= utenteModificato%></h3>
	<h3 style="margin-left:750px;color:white;"><%= loginMessage%></h3>
	<%-- 	<%@include file="./header.jsp" %> --%>
	<%-- 	<h1>BENVENUTO TI SEI LOGGATO COME : <%= utenteLoggato%> </h1> --%>

	<form id="formSelezioneUser">
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
			ArrayList<UserDto> users = UserService.getInstance().selectAllUsers();
			for (UserDto tableUsers : users) {
			%>
			<tr>
				<td><input type="radio" name="selectedUserId"
					value="<%out.print(tableUsers.getId());%>"onclick="javascript:abilitaBottone();"></td>
				<td>
					<%
					out.print(tableUsers.getId());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getEmail());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getPassword());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getFirstName());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getLastName());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getDateOfBirth());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getRegDate());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getRole());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getImgPath());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getNote());
					%>
				</td>
				<td>
					<%
					out.print(tableUsers.getEnabled());
					%>
				</td>
			</tr>	
			<%
			}
			%>
		</table>
		<br />
		<button type="submit" id="modificaButton" value="CANCELLA" class="buttonDelete2" disabled onclick="javascript:deleteUser();">ELIMINA</button>
		<br/>
		<button type="submit" id="deleteButton" value="MODIFICA" class="buttonDelete2" disabled onclick="javascript:modificaUser();">MODIFICA</button>
	</form>


</body>
</html>