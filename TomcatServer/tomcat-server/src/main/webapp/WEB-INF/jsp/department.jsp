<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.unipi.dsmt.app.dtos.UserDepartmentDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/department.css?v=1.3">
  <title>Department</title>
</head>

<body style="margin: 0px;">
  <div>
    <jsp:include page="/WEB-INF/jsp/nav_bar.jsp" />
   </div>
  <div class="page">
    <% String department_name = (String) request.getParameter("name"); %>
    <h1><%=department_name%></h1>
    <% ArrayList<UserDepartmentDTO> users = (ArrayList<UserDepartmentDTO>) request.getSession().getAttribute("users"); %>
  </div>
  
</body>

</html>