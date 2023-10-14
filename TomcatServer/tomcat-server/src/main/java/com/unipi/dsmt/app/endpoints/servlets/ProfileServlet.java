package com.unipi.dsmt.app.endpoints.servlets;

import com.unipi.dsmt.app.daos.UserDAO;
import com.unipi.dsmt.app.dtos.UserProfileDTO;
import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            String token = AccessController.getToken(request);
            if (token == null) {
                ErrorHandler.setPopupErrorMessage(request, "Invalid/Expired token. Login again.");
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            // set my username
            request.getSession().setAttribute("my_username", AccessController.getUsername(request));

            // get required userinfo from username
            String username = (String) request.getParameter("username");
            UserProfileDTO user_info = UserDAO.getUserFromUsername(username);
            request.getSession().setAttribute("user_info", user_info);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/profile.jsp");
            requestDispatcher.forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
