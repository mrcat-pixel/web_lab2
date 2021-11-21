<%@ page import="java.util.Calendar" %>
<%@ page import="com.weblab.web_lab2_java.servlets.AreaCheckServlet" %>
<%@ page import="com.weblab.web_lab2_java.models.Point" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Лаба2</title>

    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/site.webmanifest">
    <link rel="mask-icon" href="${pageContext.request.contextPath}/assets/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jost:wght@700&family=Source+Sans+Pro:wght@600&display=swap');
        html {
            color: #AEC1BB;
            background: #3A213F;
            font-family: 'Source Sans Pro', sans-serif;
            font-weight: normal;
            font-size: 20px;
        }
        .footer {
            text-align: center;
        }
        .invert-colors {
            background: #AEC1BB;
            color: #3A213F;
        }
        .box-visual, .indent-box {
            padding: 43px;
            border-radius: 20px;
        }
        .indent-box {
            margin: 43px;
            background-color: #241228;
        }
        .box-visual, .main-structure-table {
            width: 100%;
        }
        .text-input {
            width: 80%;
        }
        .main-structure-table {
            display: block;
        }
        td {
            vertical-align: top;
        }
        .mew {
            font-style: italic;
        }
        .main-title {
            font-size: 3rem;
            font-family: 'Jost', sans-serif;
        }
        .prompt-text {
            font-size: 1.2rem;
        }
        .control-panel {
            padding: 20px;
        }
        .text-input, button {
            border-radius: 50rem;
            padding: 10px 20px;
            font-family: inherit;
            font-size: inherit;
            outline: none;
            border: none;
        }
        select {
            -webkit-appearance: none;
            appearance: none;
        }
        .text-input:hover, .text-input:focus, button:hover {
            background-color: white;
            box-shadow: 10px 10px 5px 5px rgba(34, 16, 38, 0.25);
        }
        .reset-colors:hover {
            background-color: #e8b3b3;
        }
        .text-input, .logo, .box-visual, button, hr {
            box-shadow: 5px 5px 5px 5px rgba(34, 16, 38, 0.25);
        }
        .shadow-graph{
            filter: drop-shadow(5px 5px 5px rgba(34, 16, 38, 0.25));
        }
        .result-table {
            box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.25);
        }
        .logo {
            border-radius: 50rem;
            margin: 25px;
        }
        .confirm-colors {
            color: #3A213F;
            background-color: mediumspringgreen;
        }
        .reset-colors {
            color: #3A213F;
            background-color: palevioletred;
        }
        .content {
            max-width: 1200px;
            margin: 80px auto;
        }
        button {
            margin: 5px;
        }
        .indent-box {
            box-shadow: inset 5px 5px 5px 5px rgba(0, 0, 0, 0.25);
        }
        .result-table {
            width: 100%;
            text-align: center;
            border-radius: 20px;
            background-color: #3A213F;
            padding: 10px;
        }
        .incorrect-input-notif {
            color: palevioletred;
        }
    </style>
</head>
<body>
<div class="content">
    <table class="main-structure-table">
        <thead>
        <tr>
            <td>
                <img src="assets/rat.png" width="300" class="logo shadow" alt="logo">
            </td>
            <td class="invert-colors box-visual shadow">
                <h1 class="main-title">ЛАБКА-ЛЯГУЖАБКА 2</h1>
                <h3>Глушков Даниил, P3233, вариант 33555</h3>
                <p class="mew">пуньки...</p>
            </td>
        </tr>
        <tr><td colspan="2"><br></td></tr>
        </thead>
        <tbody>
        <tr>
            <td class="control-panel">
                <div id="click_catcher">
                <svg height="300" width="300" xmlns="http://www.w3.org/2000/svg" id="graph" class="shadow-graph" style="pointer-events: none">
                    <polygon fill="palevioletred"
                             fill-opacity="0.3"
                             points="100,150 150,150 150,200"
                             id="figure1"
                    ></polygon>

                    <polygon fill="mediumspringgreen"
                             fill-opacity="0.3"
                             points="50,150 50,100 150,100 150,150"
                             id="figure2"
                    ></polygon>

                    <path d="M 250 150 L 150 150 L 150 50 C 198 50 250 100 250 150 Z"
                          fill="rgb(174, 193, 187)"
                          fill-opacity="0.3"
                          id="figure3"
                    ></path>

                    <line stroke="rgb(174, 193, 187)"
                          x1="10" x2="290"
                          y1="150" y2="150"
                          stroke-width="5"
                          stroke-linecap="round"
                    ></line>
                    <line stroke="rgb(174, 193, 187)"
                          x1="150" x2="150"
                          y1="10" y2="290"
                          stroke-width="5"
                          stroke-linecap="round"
                    ></line>
                    <polygon fill="rgb(174, 193, 187)" points="150,0 140,15 160,15"></polygon>
                    <polygon fill="rgb(174, 193, 187)" points="300,150 285,160 285,140"></polygon>
                    <% if (session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS) != null) {
                        for (Point p: (ArrayList<Point>) session.getAttribute(AreaCheckServlet.ATTRIBUTE_POINTS)) { %>
                        <circle cx="<%=p.getX() * 20 + 150%>" cy="<%=-p.getY() * 20 + 150%>" r="4" class="littleDot"
                                fill="<%=p.isInsideArea() ? "mediumspringgreen" : "palevioletred"%>"></circle>
                        <%}
                    }%>
                </svg>
                </div>
                <div class="X_select">
                    <p class="prompt-text">Выбираем X:</p>
                    <div class="select-wrap"><label>
                        <select class="text-input invert-colors selector" id="x_select">
                            <% for (int xVal = -3; xVal <= 5; xVal++) {%>
                                <option value="<%= xVal %>"><%= xVal %></option>
                            <% } %>
                        </select>
                    </label></div>
                    <p class="incorrect-input-notif" id="x_inc"></p>
                </div>
                <div class="Y_select">
                    <p class="prompt-text">Выбираем Y (-5 ... 5):</p>
                    <label><input type="text" placeholder="Введите число..." id="tbx_y" class="text-input invert-colors"></label>
                    <p class="incorrect-input-notif" id="y_inc"></p>
                </div>
                <div class="R_select">
                    <p class="prompt-text">Выбираем R:</p>
                    <% for (int rVal = 1; rVal <= 5; rVal++) { %>
                        <button type="button" class="invert-colors<% if (rVal == 5) { %> confirm-colors <% } %>"
                                id="btn-<%=rVal%>" onclick="setR(<%=rVal%>)"><%=rVal%></button>
                        <% if (rVal == 3) { %>
                        <br>
                        <% } %>
                    <% } %>
                    <p class="incorrect-input-notif" id="r_inc"></p>
                </div>
                <button type="button" class="confirm-colors" id="btn_cfmr" onclick="sendButton()">Отправить</button>
                <button type="button" class="reset-colors" id="btn_rst" onclick="sendReset()">Ресет</button>
                <p class="incorrect-input-notif" id="connect-error"></p>
            </td>
            <td class="indent-box">
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
                        <td><%=Double.toString(p.getY()).length() >= 5? Double.toString(p.getY()).substring(0, 5) : p.getY()%></td>
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
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <p class="footer">2021</p>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="script/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="script/script.js"></script>
</body>
</html>