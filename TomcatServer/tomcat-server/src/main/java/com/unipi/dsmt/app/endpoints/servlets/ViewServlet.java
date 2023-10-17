package com.unipi.dsmt.app.endpoints.servlets;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewServlet", value = "/view")
public class ViewServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
      try {
        String username = (String) request.getParameter("username");
        request.setAttribute("username", username);
        request.getRequestDispatcher("/WEB-INF/jsp/view.jsp").forward(request, response);
      } catch (Exception e) {
          ErrorHandler.safeDispatchToErrorPage(request, response, e);
      }
  }
}
