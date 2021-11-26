<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List" import="it.contrader.dto.OrdineDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Ordini Admin</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>
<div class="navbar">
  <a href="/homeadmin.jsp">Home</a>
  <a href="/piatto/menu">Menù del giorno</a>
  <a class="active" href="/ordine/storicoadmin">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>
<br>

<div class="main">
	<%
		List<OrdineDTO> list = (List<OrdineDTO>) request.getAttribute ("ordini");
	%>

<br>

	<table>
		<tr>
			<th>piattoOrdinato</th>
			<th>prezzo</th>
			<th>data</th>
			<th>iduser</th>
			<th>idristorante</th>
			<th></th>
			<th></th>
		</tr>
		<%
			for (OrdineDTO o : list) {
		%>
		<tr>
			<td><%=o.getPiattoOrdinato()%></td>
			<td><%=o.getPrezzoFisso()%></td>
			<td><%=o.getData()%></td>
			<td><%=o.getIduser()%></td>
			<td><%=o.getIdristorante()%></td>
			<td></td>
			<td></td>

		</tr>
		<%
			}
		%>
	</table>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


</div>

<%@ include file="../css/footer.jsp" %>
</body>
</html>