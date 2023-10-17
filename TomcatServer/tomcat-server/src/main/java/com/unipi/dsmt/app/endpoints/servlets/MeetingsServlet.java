package com.unipi.dsmt.app.endpoints.servlets;

import java.sql.Connection;
import java.util.List;

import com.unipi.dsmt.app.daos.AppointmentDAO;
import com.unipi.dsmt.app.dtos.AppointmentDTO;
import com.unipi.dsmt.app.utils.AccessController;
import com.unipi.dsmt.app.utils.ErrorHandler;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "MeetingsServlet", value = "/meetings")
public class MeetingsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            AppointmentDAO appointmentDAO = new AppointmentDAO((Connection) getServletContext().getAttribute("databaseConnection"));
            String currentUsername = AccessController.getUsername(request);
            List<AppointmentDTO> appointments = appointmentDAO.getAppointmentsFromUsername(currentUsername);
            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("/WEB-INF/jsp/meetings.jsp").forward(request, response);
        } catch (Exception e) {
            ErrorHandler.safeDispatchToErrorPage(request, response, e);
        }
    }
}
