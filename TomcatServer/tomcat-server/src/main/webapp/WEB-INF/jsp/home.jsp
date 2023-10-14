<%@ page contentType="text/html;charset=UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/home.css?v=1.5" />
    <title>Home Page</title>
  </head>

  <body style="margin: 0px">
    <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
    <div class="page">
      <% String my_username=(String) request.getSession().getAttribute("my_username"); %>
        <h1>Hello <%=my_username%>
        </h1>
        <jsp:include page="/WEB-INF/jsp/components/sidebar.jsp" />
    </div>
  </body>

  </html>