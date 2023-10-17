<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ page import="com.unipi.dsmt.app.dtos.UserProfileDTO" %>
    <%@ page import="com.unipi.dsmt.app.dtos.ChatStorageDTO" %>
      <%@ page import="java.util.List" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="css/profile.css?v=1.9">
          <title>Profile page</title>
          <% UserProfileDTO requestingUser=(UserProfileDTO) request.getAttribute("user_info"); %>
            <% List<ChatStorageDTO> chatList =(List<ChatStorageDTO>) request.getAttribute("chatList"); %>
        </head>

        <body style="margin: 0px;">
          <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
          <div class="page">
            <div class="fields-container">
              <div class="field">
                <h1>Username</h1>
                <label>
                  <%= requestingUser.getUsername() %>
                </label>
              </div>
              <div class="field">
                <h1>Name</h1>
                <label>
                  <%= requestingUser.getName() %>
                </label>
              </div>
              <div class="field">
                <h1>Surname</h1>
                <label>
                  <%= requestingUser.getSurname() %>
                </label>
              </div>
              <div class="field">
                <h1>Department</h1>
                <label>
                  <%= requestingUser.getDepartment() %>
                </label>
              </div>
            </div>
            <div class="chat-history-container">
              <h1>Recent Chats</h1>
              <div class="grid">
                <% for(ChatStorageDTO chat : chatList){ %>
                  <a
                    href="${pageContext.request.contextPath}/chat?chatID=<%=chat.getId_chat()%>&username=<%=chat.getUsername()%>">
                    <div class="chat-card">
                      <h1>
                        <%= chat.getUsername() %>
                      </h1>
                      <label>
                        <%= chat.getLastMessageTime() %>
                      </label>
                      <% String className="flag" + (chat.getOnlineState() ? " connected" : "" ) ; %>
                        <div class="<%= className %>"></div>
                    </div>
                  </a>
                  <%}%>
              </div>
            </div>
          </div>
        </body>

        </html>