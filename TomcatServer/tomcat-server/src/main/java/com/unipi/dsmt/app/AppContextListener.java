package com.unipi.dsmt.app;

import com.unipi.dsmt.app.daos.MySQLDao;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class AppContextListener implements ServletContextListener {
  public void contextInitialized(ServletContextEvent event) {
    MySQLDao sqldao = new MySQLDao(
        System.getenv("DB_HOST"),
        Integer.parseInt(System.getenv("DB_PORT")),
        System.getenv("DB_NAME"));

    // Get the servlet context and store the database connection
    ServletContext context = event.getServletContext();
    context.setAttribute("databaseConnection", sqldao);
  }

  public void contextDestroyed(ServletContextEvent event) {
    // Cleanup code if needed when the web application is destroyed
    ServletContext context = event.getServletContext();
    context.removeAttribute("databaseConnection");
  }
}