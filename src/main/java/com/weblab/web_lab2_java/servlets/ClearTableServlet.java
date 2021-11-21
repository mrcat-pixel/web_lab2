package com.weblab.web_lab2_java.servlets;

import com.weblab.web_lab2_java.models.Point;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Objects;

@WebServlet(name = "Clear Table Servlet", value = "/clear-table")
public class ClearTableServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        req.getSession().setAttribute(AreaCheckServlet.ATTRIBUTE_POINTS, null);
    }
}
