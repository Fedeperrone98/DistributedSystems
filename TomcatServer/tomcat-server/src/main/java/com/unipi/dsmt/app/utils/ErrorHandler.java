package com.unipi.dsmt.app.utils;

import java.io.PrintWriter;
import java.io.StringWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ErrorHandler {
  public static void safeDispatchToErrorPage(HttpServletRequest request, HttpServletResponse response, Exception e) {
    try {
      StringWriter sw = new StringWriter();
      PrintWriter pw = new PrintWriter(sw);
      e.printStackTrace(pw);
      request.setAttribute("message", e.getMessage().toString());
      request.setAttribute("stack", sw.toString());
      System.out.println("[Server] -> An unexpected error has occurred:");
      e.printStackTrace();
      request.getRequestDispatcher("/WEB-INF/jsp/error_page.jsp").forward(request, response);
    } catch (Exception err) {
      err.printStackTrace();
      return;
    }
  }
}
