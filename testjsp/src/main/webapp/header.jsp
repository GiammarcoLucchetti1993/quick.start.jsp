<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
  padding-left:550px;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #04AA6D;
  color: white;
}

</style>

<%
String utente="";
String utenteLoggato="";
if(session.getAttribute("userLoggedEmail")==null){
	utente = "NON SEI LOGGATO";
	utenteLoggato = "";
}else{
	utente = "LOGGATO COME :";
	utenteLoggato = "" + session.getAttribute("userLoggedEmail");
}
%>   


<div class="topnav">
  <a href="./users.jsp">Lista Utente</a>
  <a href="./insertUser.jsp">Inserisci Utente</a>
  <a href="./roles.jsp">Lista Ruoli</a>
  <a href="./insertRole.jsp">Inserisci Ruoli</a>
  <a href="./LogoutServlet">Log Out</a>
</div> 
  <h2 style="margin-left:780px;color:white;"><%= utente%> <%= utenteLoggato%></h2>

    