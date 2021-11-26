<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.contrader.dto.RistoranteDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Edit Ristorante</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>
<div class="navbar">
  <a class="active" href="homeadmin.jsp">Home</a>
  <a href="/piatto/menu">Menù del giorno</a>
  <a href="/ordine/storicoadmin">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div> 
<br>
<div class="main">

<%RistoranteDTO r = (RistoranteDTO) request.getAttribute("dto");%>


<form id="floatleft" action="/ristorante/update?idristorante=<%=r.getIdristorante()%>" method="post">
  <div class="row">
    <div class="col-25">
      <label for="user">Nome ristorante</label>
    </div>
    <div class="col-75">
      <input type="text" id="nome" name="nome" value=<%=r.getNome()%>>
      <input type="hidden" id="idristorante" name="idristorante" value=<%r.getIdristorante()%>>
    </div>
 
   	
  </div>
      <button type="submit" >Edit</button>
</form>

	
</div>
<br>
<%@ include file="../css/footer.jsp" %>	
</body>
</html>