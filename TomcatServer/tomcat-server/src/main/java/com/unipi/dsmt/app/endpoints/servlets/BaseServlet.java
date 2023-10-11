package com.unipi.dsmt.app.endpoints.servlets;

import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "base", value = "/")
public class BaseServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) {
    try {
      System.out.println("1");
      String token = AccessController.getToken(request);
      System.out.println("2");
      if (token == null) {
        System.out.println("3");
        System.out.println(request.getContextPath());
        response.sendRedirect(request.getContextPath() + "/login");
        return;
      }
      System.out.println("4");
      response.sendRedirect(request.getContextPath() + "/home");
    } catch (Exception e) {
      ErrorHandler.safeDispatchToErrorPage(request, response, e);
    }
  }
}
