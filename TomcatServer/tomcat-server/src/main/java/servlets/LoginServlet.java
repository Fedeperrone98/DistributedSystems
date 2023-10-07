package servlets;

import java.io.IOException;

import daos.MySQLDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Login", value = "/login")
public class LoginServlet extends HttpServlet {

  MySQLDao sqldb = new MySQLDao(System.getenv("DB_HOST"), Integer.parseInt(System.getenv("DB_PORT")),
      System.getenv("DB_NAME"));

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
    request.setAttribute("name", "bho");
    dispatcher.forward(request, response);
  }
}
