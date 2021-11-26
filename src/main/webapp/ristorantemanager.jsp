<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List"
	import="it.contrader.dto.RistoranteDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Ristorante Manager</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>

<div class="navbar">
  <a class="active" href="homeadmin.jsp">Home</a>
  <a href="/piatto/menu">Menù del giorno</a>
  <a href="/ordine/storicoadmin">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div> 
<div class="main">
	<%
		RistoranteDTO r = (RistoranteDTO) request.getAttribute("ristorante");
	%>

<br>

	<table>
		<tr>
			<th>Name</th>
			<th></th>
			<th></th>
		</tr>

		<tr>
			<td>
					<%=r.getNome()%>
			</td>
			<td><a href="/ristorante/preupdateristorante?idristorante=<%=r.getIdristorante()%>">Edit</a>
			</td>
			<td><a href="/ristorante/delete?idristorante=<%=r.getIdristorante()%>">Delete</a>
			</td>

		</tr>
	</table>




</div>
<br>
<%@ include file="../css/footer.jsp" %>
</body>
</html>