
  <%@ page contentType="text/html;charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/css/authentication_page.css">
      <title>Welcome</title>
    </head>

    <body style="margin: 0px;">

      <div class="page">
        <% String rParam=(String)request.getAttribute("error"); if(rParam !=null){ %>
          <label class="error-label">
            <%= rParam %>
          </label>
          <%}%>
            <form method="post" action="${pageContext.request.contextPath}/login" class="login-card">
              <h1 id="title">Log In</h1>
              <div class="input">
                <label>Username</label>
                <input type="text" name="username" required />
              </div>
              <div class="input">
                <label>Password</label>
                <input type="password" name="password" required />
              </div>
              <button type="submit">Log In</button>
              <p>You don't have an account? <a href="${pageContext.request.contextPath}/signup">Sign Up</a></p>
            </form>
      </div>

    </body>

    </html>