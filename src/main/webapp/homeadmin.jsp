<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.List"
	import="it.contrader.dto.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Home Admin</title>
<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="/css/vittoriostyle.css" rel="stylesheet">
</head>
<body>
<%@include file="/css/header.jsp"%>


<div class="navbar">
  <a class="active" href="/homeadmin.jsp">Home</a>
  <a href="/piatto/menu">Menù del giorno</a>
  <a href="/ordine/storicoadmin">Storico ordini</a>
 
</div>

<div class="main">
<h1>Welcome ${user.getUsername()}</h1>



</div>


<%@ include file="/css/footer.jsp" %>

</body>
</html>