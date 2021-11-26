<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List"
	import="it.contrader.dto.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home User</title>
<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/css/vittoriostyle.css" rel="stylesheet">
</head>
<body>
<%@include file="/css/header.jsp"%>


<div class="navbar">
  <a class="active" href="/homeuser.jsp">Home</a>
  <a href="/ristorante/ristorantilist">Ristoranti</a>
  <a href="/carrello/readcart">Carrello</a>
  <a href="/ordine/ordiniuserlist">Storico ordini</a>
  <a href="/user/logout" id="logout">Logout</a>
</div>

<div class="main">
<h1>Welcome ${user.getUsername()}</h1>



</div>


<%@ include file="/css/footer.jsp" %>

</body>
</html>