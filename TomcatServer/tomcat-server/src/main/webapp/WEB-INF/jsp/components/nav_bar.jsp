<%@ page import="com.unipi.dsmt.app.utils.AccessController.java" %>
  <link rel="stylesheet" href="css/nav_bar.css?v=1.4">
  <script src="js/ngrok_setup.js?v=1.0" defer></script>
  <script src="js/navbar.js?v=1.0" defer></script>

  <% String currentUsername=(String) AccessController.getUsername(request); %>
    <script>
      const currentUsername = "${currentUsername}";
    </script>
    <nav class="navbar">
      <a href="${pageContext.request.contextPath}/home">Home</a>
      <a href="${pageContext.request.contextPath}/profile">Profile</a>
      <a href="${pageContext.request.contextPath}/meetings">Meetings</a>
      <a href="${pageContext.request.contextPath}/logout"><img src="icons/close.png" width="30px" height="30px"></a>
      <div class="notification">
        <a href="${pageContext.request.contextPath}/notifications"><img src="icons/bell.png" alt="" width="30px"
            height="30px"></a>
        <label>0</label>
      </div>
    </nav>