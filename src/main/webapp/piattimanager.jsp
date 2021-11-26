<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List"
	import="it.contrader.dto.PiattoDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Piatti Manager</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>
 
<div class="navbar">
  <a href="/homeadmin.jsp">Home</a>
  <a href="/piatto/menu">Menù del giorno</a>
  <a href="/ordine/storicoadmin">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div> 
<!-- 
	<div class="navbar">
		<a class="active" href="/homeadmin.jsp">Home</a> <a href=/user/getall>Users</a>
		<a href="/user/logout" id="logout">Logout</a>
	</div>
-->

<div class="main">
	<%
		List<PiattoDTO> list = (List<PiattoDTO>) request.getAttribute("list");
	%>

<br>

	<table>
		<tr>
			<th>nomePiatto</th>
			<th>prezzo</th>
			<th>stato</th>
			<th>tipo</th>
			
			<th colspan="3">Opzioni<th>
		</tr>
		<%
			for (PiattoDTO p : list) {
		%>
		<tr>
			<td><%=p.getNomePiatto()%></td>
			<td><%=p.getPrezzo()%></td>
			<td><%=p.isStato()%></td>
			<td><%=p.getTipo()%></td>
			
			<td><a href="/piatto/preupdate?idpiatto=<%=p.getIdpiatto()%>">Edit</a>
			</td>
			<td><a href="/piatto/delete?idpiatto=<%=p.getIdpiatto()%>">Delete</a>
			</td>
			<td><a href="/piatto/stato?idpiatto=<%=p.getIdpiatto()%>">Cambia stato</a></td>

		</tr>
		<%
			}
		%>
	</table>


<form id="floatright" action="/piatto/insert" method="post">
  <div class="row">
    <div class="col-25">
      <label for="nomePiatto">nomePiatto</label>
    </div>
    <div class="col-75">
      <input type="text" id="nomePiatto" name="nomePiatto" placeholder="inserisci nomePiatto">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
     <label for="prezzo">prezzo</label>
    </div>
    <div class="col-75">
      <input type="text" id="prezzo" name="prezzo" placeholder="inserisci prezzo"> 
    </div>
  </div> 
    <div class="row">
  </div>
  
  
 <form action="/piatto/insert">		
		
<label for="tipo">Scegli il tipo:</label>

<select name="tipo" id="tipo">
  <option value="Primo">Primo</option>
  <option value="Secondo">Secondo</option>
  <option value="Aperitivo">Aperitivo</option>
  <option value="Bevanda">Bevanda</option>
</select>
<br><br>
 	<button type="submit" >Insert</button>
</form>
 
<br>
<%@ include file="../css/footer.jsp" %>
</body>
</html>