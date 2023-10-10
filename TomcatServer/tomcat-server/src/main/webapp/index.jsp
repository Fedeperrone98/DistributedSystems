<%@ page import="com.unipi.dsmt.app.utils.AccessController" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./index.css?v=1.2">
  <script src="./index.js?v=1.2" defer></script>
  <title>Welcome</title>
</head>

<body style="margin: 0px;">

  <div class="page">

    <div class="login-card">

      <h1 id="title">Log In</h1>
      <form method="post" action="${pageContext.request.contextPath}/login">
        <input type="text" name="username" placeholder="username" required/>
        <br>
        <input type="password" name="password" placeholder="password" required/>
        <br>
        <button class="actionbutton" id="actionbutton" onclick="handleLogin()">Log In</button>
      </form>

      <p>You don't have an account? <a href="${pageContext.request.contextPath}/signup">Sign Up</a></p>
    </div>

    <%
      // Check if the user failed the login
	    String rParam = request.getParameter("r");
      if (rParam != null && rParam.equals("error")) {
    %>
    <script>
        alert("Error: failed login");
        location.href = "${pageContext.request.contextPath}/";
    </script>

    <%
      }

      // Redirect user is already logged
      String token = AccessController.getToken(request);
      if (token != null) {
        response.sendRedirect(request.getContextPath() + "/home");
      }

    %>

  </div>

</body>

</html>