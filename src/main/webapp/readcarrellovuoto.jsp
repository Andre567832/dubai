<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="it.contrader.dto.PiattoDTO"
    import="it.contrader.dto.UserDTO"
    import="it.contrader.util.Carrello"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/vittoriostyle.css" rel="stylesheet">
<title>Il tuo carrello</title>
</head>
<body>
<%@ include file="../css/header.jsp" %>
<div class="navbar">
  <a href="/homeuser.jsp">Home</a>
  <a href="/ristorante/ristorantilist">Ristoranti</a>
  <a href="/carrello/readcart">Carrello</a>
  <a href="/ordine/ordiniuserlist">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>
<br>

<div class="main">


<p>Purtroppo il tuo carrello è vuoto attualmente :(</p>
<p>Vai ad ordinare dei piatti e torna!</p>

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