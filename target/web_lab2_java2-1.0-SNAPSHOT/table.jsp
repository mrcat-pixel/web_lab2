<%@ page import="com.weblab.web_lab2_java.servlets.AreaCheckServlet" %>
<%@ page import="com.weblab.web_lab2_java.models.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Таблиться</title>
</head>
<body>
<table class="result-table">
    <thead>
    <tr>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Входит?</th>
        <th>Время</th>
        <th>Выполнение</th>
    </tr>
    <tr>
        <th colspan="6"><hr></th>
    </tr>
    </thead>
    <tbody id="table-place">
        <% if (session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS) != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (Point p: (ArrayList<Point>) session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS)) { %>
                <tr>
                    <td><%=p.getX()%></td>
                    <td><%=p.getY()%></td>
                    <td><%=p.getR()%></td>
                    <td><%=p.isInsideArea() ? "да" : "нет"%></td>
                    <% Calendar c = Calendar.getInstance();
                        c.setTimeInMillis(p.getTimestamp());%>
                    <td><%=sdf.format(c.getTime())%></td>
                    <td><%=p.getExecutionTime()%>нс</td>
                </tr>
        <% }} %>
    </tbody>
</table>
</body>
</html>
