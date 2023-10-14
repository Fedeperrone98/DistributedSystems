<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/home.css?v=1.3" />
  <script src="js/home.js?v=1.1"></script>
  <title>Home Page</title>
 </head>

 <body style="margin: 0px">
  <div class="page">
   <% String username = (String) request.getSession().getAttribute("username"); %>
   <h1>Hello <%=username%></h1>
   <div class="department-list">
    <div class="department">
     <p><a href="${pageContext.request.contextPath}/department">Information Technologies</a></p>
    </div>
    <div class="department">
     <p><a href="${pageContext.request.contextPath}/department">Human Resources</a></p>
    </div>
    <div class="department">
     <p><a href="${pageContext.request.contextPath}/department">Administration</a></p>
    </div>
    <div class="department">
     <p><a href="${pageContext.request.contextPath}/department">Buying</a></p>
    </div>
    <div class="department">
     <p><a href="${pageContext.request.contextPath}/department">Selling</a></p>
    </div>
   </div>
  </div>
 </body>
</html>
