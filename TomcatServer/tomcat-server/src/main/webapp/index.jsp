<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="index.css">
  <script src="index.js" defer></script>
  <title>Welcome</title>
</head>

<body style="margin: 0px;">
  <div class="page">
    <div class="login-card">
      <h1 id="title">Log In</h1>
      <div class="full-name" id="addinfos">
        <input type="text" placeholder="First Name" />
        <input type="text" placeholder="Second Name" />
      </div>
      <input type="text" placeholder="username" />
      <input type="password" placeholder="password" />
      <button id="actionbutton" onclick="handleLogin()">Log In</button>
      <p id="toggler">You don't have an account? <a href="" onclick="toggleSignUp(event)">Sign Up</a></p>
    </div>
  </div>
</body>

</html>