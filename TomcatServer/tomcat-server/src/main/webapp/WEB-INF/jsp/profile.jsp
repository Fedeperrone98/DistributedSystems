<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ page import="com.unipi.dsmt.app.dtos.UserProfileDTO" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/profile.css?v=1.4">
      <title>Profile</title>
    </head>

    <body style="margin: 0px;">
      <div>
        <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
      </div>
      <div class="page">
        <% UserProfileDTO user=(UserProfileDTO) request.getSession().getAttribute("user_info"); %>
          <div class="user-card">
            <label>Name:</label>
            <p>
              <%=user.getName()%>
            </p>
            <label>Surname:</label>
            <p>
              <%=user.getSurname()%>
            </p>
            <label>Username:</label>
            <p>
              <%=user.getUsername()%>
            </p>
            <label>Department:</label>
            <p>
              <%=user.getDepartment()%>
            </p>
            <label>Online:</label>
            <p>
              <%=user.isOnline_flag()%>
            </p>
          </div>

      </div>

    </body>

    </html>