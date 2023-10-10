<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/signup.css=1.2">
  <title>Sign Up</title>
</head>

<body style="margin: 0px;">

  <div class="page">

    <div class="signup-card">

      <h1 id="title">Sign up</h1>

      <form method="post" action="${pageContext.request.contextPath}/signup">

        <div class="full-name" id="addinfos">
          <input type="text" name="name" placeholder="First Name" />
          <input type="text" name="surname" placeholder="Second Name" />
        </div>
        
        <input type="text" name="username" placeholder="username" />

        <input type="password" name="password" placeholder="password" />
        <br>
        <label>Choose your department:
        <select class="departments" id="departments" name="department">
          <option value="IT">Information Technologies</option>
          <option value="HR">Human Resources</option>
          <option value="Administration">Administration</option>
          <option value="Buying">Buying</option>
          <option value="Selling">Selling</option>
        </select>
      </label>
        <button class="actionbutton" id="actionbutton" onclick="handleLogin()">Sign Up</button>
    </form>
      <p>You have an account? <a href="${pageContext.request.contextPath}/login">Sign in</a></p>
    </div>

  </div>

</body>

</html>