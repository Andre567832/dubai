<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.contrader.dto.PiattoDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Edit Piatti</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>
<div class="navbar">
  <a href="/homeadmin.jsp">Home</a>
  <a href="/piatto/menu">Menù del giorno</a>
  <a href="/ordine/storicoadmin">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>
<br>
<div class="main">

<%PiattoDTO p = (PiattoDTO) request.getAttribute("dto");%>


<form id="floatleft" action="/piatto/update?idpiatto=<%=p.getIdpiatto()%>" method="post">
  <div class="row">
    <div class="col-25">
      <label for="nomePiatto">Nome piatto</label>
    </div>
    <div class="col-75">
      <input type="text" id="nomePiatto" name="nomePiatto" value=<%=p.getNomePiatto()%>>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
     <label for="prezzo">Prezzo</label>
    </div>
    <div class="col-75">
      <input
			type="text" id="prezzo" name="prezzo" value=<%=p.getPrezzo()%>> 
    </div>
  </div>
 			
<label for="tipo">Scegli il tipo:</label>

<select name="tipo" id="tipo">
  <option value="Primo">Primo</option>
  <option value="Secondo">Secondo</option>
  <option value="Aperitivo">Aperitivo</option>
  <option value="Bevanda">Bevanda</option>
</select>
<input type="hidden" id="idristorante" name="idristorante"
 value=<%=p.getIdristorante()%>><br><br>
 	<button type="submit">Edit</button>
</form>
  </div>
  
  


	
<br>
<%@ include file="../css/footer.jsp" %>	
</body>
</html>