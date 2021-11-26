<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<html>
<head>
<link href="css/vittoriostyle.css" rel="stylesheet">

<title>Login SAMPLE</title>
</head>
<body>
		<form class="login" action="/user/insert" method="post">
			<label for="inputUser" class="sr-only">Username</label> 
				<input type="text" name="username" id="inputUser" class="form-control"
					placeholder="Username" required autofocus> 
			
			<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" name="password" id="inputPassword"
					class="form-control" placeholder="Password" required>
				<input type="hidden" name="richiesta" value="login">
		
					<button class="btn btn-lg btn-primary btn-block" type="submit">Registrati</button>
		</form>
		

	
</body>
</html>