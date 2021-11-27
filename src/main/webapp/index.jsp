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

                <input type="password" name="password" id="inputPassword"
                    class="form-control"  required>
                <input type="hidden"  value="login">

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Accedi</button>

            <br>
            <br>
        </form>
        
</body>
</html>
