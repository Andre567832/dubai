<form class="login" action="/user/login" method="post">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Sample Login page">

<title>Login</title>

<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/vittoriostyle.css" rel="stylesheet">
</head>
<body class="text-center" style="background-color: red;">

        <form class="login" action="/user/login" method="post">


        <label for="inputUser" class="sr-only">Username</label> 
            <input type="text" name="username" id="inputUser" class="form-control"
                placeholder="Username" required autofocus> 

            <label for="inputPassword" class="sr-only">Password</label>
                <input type="password" name="password" id="inputPassword"
                    class="form-control" placeholder="Password" required>
                <input type="hidden" name="richiesta" value="login">

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>

            <br>
            <br>
        </form>
        <div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
				<form>
					<label for="chk" aria-hidden="true">Sign up</label>
					<input type="text" name="txt" placeholder="User name" required="">
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="pswd" placeholder="Password" required="">
					<button>Sign up</button>
				</form>
			</div>

			<div class="login">
				<form>
					<label for="chk" aria-hidden="true">Login</label>
					<input type="email" name="email" placeholder="Email" required="">
					<input type="password" name="pswd" placeholder="Password" required="">
					<button>Login</button>
				</form>
			</div>
	</div>
</body>
</html>
