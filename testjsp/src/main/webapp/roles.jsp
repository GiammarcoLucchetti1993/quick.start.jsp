<%@page import="service.RoleService"%>
<%@page import="proxima.informatica.academy.dto.RoleDto"%>
<%@page import="service.UserService"%>
<%@page import="proxima.informatica.academy.dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@include file="./autentication.jsp"%>

<%
String roleEliminato="";
if(request.getAttribute("deleteRole") == "OK"){
	roleEliminato = "Sei riuscito ad eliminare il ruolo selezionato";
}if(request.getAttribute("deleteRole") == "KO"){
	roleEliminato = "Non sei riuscito ad eliminare il ruolo selezionato";
}
%>

<%
String roleModificato="";
if(request.getAttribute("updateRole") == "OK"){
	roleModificato = "Modifica andata a buon fine";
}if(request.getAttribute("updateRole") == "KO"){
	roleModificato = "Modificata non riuscita";
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
	//alert("io sono qui");
	function abilitaBottone() {
		console.log("questa è una stampa di console");
		document.getElementById("deleteButton").disabled=false;
		document.getElementById("modificaButton").disabled=false;
	}
	function modificaRole(){
		console.log("modifica");
		document.getElementById("formSelezioneRole").action = "./updateRole.jsp";
		document.getElementById("formSelezioneRole").submit();
	}
	function deleteRole(){
		console.log("delete");
		document.getElementById("formSelezioneRole").action = "./DeleteRoleServlet";
		document.getElementById("formSelezioneRole").submit();
	}
</script>
</head>
<body>
	<%@include file="./header.jsp"%>
	
	
	<h3 style="margin-left:710px;"><%= roleEliminato%></h3>
	<h3 style="margin-left:710px;"><%= roleModificato%></h3>
	<%-- 	<%@include file="./header.jsp" %> --%>
	<%-- 	<h1>BENVENUTO TI SEI LOGGATO COME : <%= utenteLoggato%> </h1> --%>

	<form id="formSelezioneRole">
		<table>
			<tr>
				<th></th>
				<th>ID</th>
				<th>LABLE</th>
				<th>DESCRIPTION</th>
				<th>LEVEL</th>
			</tr>
			<%
			ArrayList<RoleDto> roles = RoleService.getInstance().selectAllRoles();
			for (RoleDto tableRoles : roles) {
			%>
			<tr>
				<td><input type="radio" name="selectedRoleId"
					value="<%out.print(tableRoles.getId());%>"onclick="javascript:abilitaBottone();"></td>
				<td>
					<%
					out.print(tableRoles.getId());
					%>
				</td>
				<td>
					<%
					out.print(tableRoles.getLabel());
					%>
				</td>
				<td>
					<%
					out.print(tableRoles.getDescription());
					%>
				</td>
				<td>
					<%
					out.print(tableRoles.getLevel());
					%>
				</td>
			</tr>
			
			<%
			}
			%>
		</table>
		<br />
		<button type="submit" id="modificaButton" value="CANCELLA" class="buttonDelete2" disabled onclick="javascript:deleteRole();">ELIMINA</button>
		
		<button type="submit" id="deleteButton" value="MODIFICA" class="buttonDelete2" disabled onclick="javascript:modificaRole();">MODIFICA</button>
	</form>


</body>
</html>