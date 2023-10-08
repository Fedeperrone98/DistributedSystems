package com.unipi.dsmt.app.servlets;

import java.io.IOException;

import com.unipi.dsmt.app.daos.MySQLDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Login", value = "/login")
public class LoginServlet extends HttpServlet {

  MySQLDao sqlDao = null;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
    sqlDao = (MySQLDao) getServletContext().getAttribute("databaseConnection");
    System.out.println(sqlDao.getDb().toString());
    request.setAttribute("name", "bho");
    dispatcher.forward(request, response);
  }
}
