<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ page import="com.unipi.dsmt.app.dtos.NotificationDTO" %>
    <%@ page import="java.util.List" %>
      <%@ page import="com.unipi.dsmt.app.utils.AccessController" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="css/notification.css?v=1.0">
          <title>Notification page</title>
          <% List<NotificationDTO> notificationList = (List<NotificationDTO>) request.getAttribute("notificationList");
              %>
        </head>

        <body style="margin: 0px;">
          <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp">
            <jsp:param name="loggedUser" value="<%=AccessController.getUsername(request)%>" />
          </jsp:include>
          <div class="page">
            <div class="notifications-board">
              <% if (notificationList !=null){ %>
                <% for(NotificationDTO notification : notificationList){ %>
                  <div class="notification-box">
                    <a href="${pageContext.request.contextPath}/chat?chatID=<%=notification.getChatID()%>">
                      <label> You have new messages from: <%= notification.getSender() %></label>
                    </a>
                  </div>
                  <%}%>
                    <%}%>
            </div>
          </div>
        </body>

        </html>