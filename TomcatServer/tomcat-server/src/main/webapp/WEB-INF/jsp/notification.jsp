<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.unipi.dsmt.app.dtos.NotificationDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/notification.css?v=1.0">
    <title>Notification page</title>
    <% List<NotificationDTO> notificationList = (List<notificationDTO>) request.getAttribute("notificationList"); %>
  </head>

  <body style="margin: 0px;">
    <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
    <div class="page">
      
    </div>
  </body>

</html>