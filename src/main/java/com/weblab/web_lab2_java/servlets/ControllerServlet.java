package com.weblab.web_lab2_java.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Calculation Servlet", value = "/calc")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> queryParams = req.getParameterMap();
        if (queryParams.containsKey("table"))
            req.getRequestDispatcher("/table.jsp").forward(req, resp);
        else if (queryParams.containsKey("x") && queryParams.containsKey("y") && queryParams.containsKey("r"))
            req.getRequestDispatcher("/area-check").forward(req, resp);
        else if (queryParams.containsKey("clear"))
            req.getRequestDispatcher("/clear-table").forward(req, resp);
        else req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
