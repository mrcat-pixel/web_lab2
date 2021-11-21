package com.weblab.web_lab2_java.models;

import com.google.gson.Gson;

import javax.servlet.http.HttpServletRequest;

public class Point {
    private final int x;
    private final double y;
    private final int r;
    private boolean insideArea;
    private long timestamp;
    private long executionTime;

    public Point(HttpServletRequest req) {
        int x = Integer.parseInt(req.getParameter("x"));
        double y = Double.parseDouble(req.getParameter("y"));
        int r = Integer.parseInt(req.getParameter("r"));

        this.x = x;
        this.y = y;
        this.r = r;
    }

    public void calc() {
        long now = System.nanoTime();

        if (x > 0 && y < 0) insideArea = false;
        else if (x == 0 && y == 0) insideArea = true;
        else {
            if (y >= 0 && y <= r / 2.0 && x <= 0 && x >= -r) insideArea = true;
            else if (x >= 0 && y >= 0 && y <= Math.sqrt(r * r - x * x)) insideArea = true;
            else insideArea = y <= 0 && y >= -x - r / 2.0;
        }

        timestamp = System.currentTimeMillis();
        executionTime = System.nanoTime() - now;
    }

    public int getX() {return x;}
    public double getY() {return y;}
    public int getR() {return r;}
    public boolean isInsideArea() {return insideArea;}
    public long getTimestamp() {return timestamp;}
    public long getExecutionTime() {return executionTime;}

    public String toJson() {
        return new Gson().toJson(this);
    }
}
