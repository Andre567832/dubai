<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.contrader.dto.PiattoDTO"
    import="it.contrader.dto.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Read Piatti</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>
<%
UserDTO dto = (UserDTO) session.getAttribute("user");      
%>
<%if(dto.getUsertype().equalsIgnoreCase("admin")){%>
<div class="navbar">
  <a href="/homeadmin.jsp">Home</a>
  <a href="/piatto/menu">Menù del giorno</a>
  <a href="/ordine/storicoadmin">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>
<br>

<div class="main">
<%PiattoDTO p = (PiattoDTO) request.getSession().getAttribute("dto");%>


<table>
	<tr> 
		<th>nomePiatto</th>
		<th>prezzo</th>
		<th>stato</th>
		<th>IDPiatto</th>
		<th>IDRistorante</th>
	</tr>
	<tr>
		<td><%=p.getNomePiatto()%></td>
		<td> <%=p.getPrezzo()%></td>
		<td> <%=p.isStato()%></td>
		<td><%=p.getIdpiatto()%></td>
		<td> <%=p.getIdristorante()%></td>
	</tr>	
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

  <%} else {%>
  
<div class="navbar">
  <a href="/homeuser.jsp">Home</a>
  <a href="/ristorante/ristorantilist">Ristoranti</a>
  <a href="/carrello/readcart">Carrello</a>
  <a href="/ordine/ordiniuserlist">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>
<br>

<div class="main">
<%PiattoDTO p = (PiattoDTO) request.getAttribute("dto");%>


<table>
	<tr> 
		<th>nomePiatto</th>
		<th>prezzo</th>

	</tr>
	<tr>
		<td><%=p.getNomePiatto()%></td>
		<td> <%=p.getPrezzo()%></td>
	</tr>	
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
  <%} %>
<%@ include file="../css/footer.jsp" %>
</body>
</html>