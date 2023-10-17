<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/view.css?v=1.0">
  <title>View page</title>
</head>

<body style="margin: 0px;">
  <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
  <div class="page">
    <div>
      <%String username = (String) request.getAttribute("username");%>
      <h1>
        <%=username%>
      </h1>
    </div>
    <div>
      timeslot X appointments
    </div>
    <div>
      <form method="post" action="${pageContext.request.contextPath}/chat?username=<%=username%>">
        <button type="submit"> Start chat</button>
      </form>
    </div>
  </div>
</body>

</html>