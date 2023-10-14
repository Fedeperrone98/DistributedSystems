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
  <div>
   <jsp:include page="/WEB-INF/jsp/nav_bar.jsp" />
  </div>
  <div class="page">
   <% String my_username = (String) request.getSession().getAttribute("my_username"); %>
   <h1>Hello <%=my_username%></h1>
   <div class="department-list">
    <div class="department">
      <a href="${pageContext.request.contextPath}/department?name=Information Technologies">
        <p>Information Technologies</p>
      </a>
    </div>
    <div class="department">
      <a href="${pageContext.request.contextPath}/department?name=Human Resources">
        <p>Human Resources</p>
      </a>
    </div>
    <div class="department">
      <a href="${pageContext.request.contextPath}/department?name=Administration">
     <p>Administration</p>
    </a>
    </div>
    <div class="department">
      <a href="${pageContext.request.contextPath}/department?name=Buying">
     <p>Buying</p>
    </a>
    </div>
    <div class="department">
      <a href="${pageContext.request.contextPath}/department?name=Selling">
     <p>Selling</p>
    </a>
    </div>
   </div>
  </div>
 </body>
</html>
