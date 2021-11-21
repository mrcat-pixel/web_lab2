<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Лаба2</title>
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
        .graph-container{
            margin: auto;
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
                <img src="assets/EDITOR2.png" width="300" class="logo shadow" alt="logo">
            </td>
            <td class="invert-colors box-visual shadow">
                <h1 class="main-title">ЛАБКА-ЛЯГУЖАБКА 2</h1>
                <h3>Глушков Даниил, P3233, вариант 33555</h3>
                <p class="mew">(мяв котики хе)</p>
            </td>
        </tr>
        <tr><td colspan="2"><br></td></tr>
        </thead>
        <tbody>
        <tr>
            <td class="control-panel">
                <svg height="300" width="300" xmlns="http://www.w3.org/2000/svg">

                    <!-- Оси со стрелками   -->
                    <line stroke="white" x1="0" x2="300" y1="150" y2="150"></line>
                    <line stroke="white" x1="150" x2="150" y1="0" y2="300"></line>
                    <polygon fill="white" points="150,0 144,15 156,15" stroke="white"></polygon>
                    <polygon fill="white" points="300,150 285,156 285,144" stroke="white"></polygon>

                    <!-- Засечки    -->
                    <line stroke="white" x1="200" x2="200" y1="155" y2="145"></line>
                    <line stroke="white" x1="250" x2="250" y1="155" y2="145"></line>

                    <line stroke="white" x1="50" x2="50" y1="155" y2="145"></line>
                    <line stroke="white" x1="100" x2="100" y1="155" y2="145"></line>

                    <line stroke="white" x1="145" x2="155" y1="100" y2="100"></line>
                    <line stroke="white" x1="145" x2="155" y1="50" y2="50"></line>

                    <line stroke="white" x1="145" x2="155" y1="200" y2="200"></line>
                    <line stroke="white" x1="145" x2="155" y1="250" y2="250"></line>

                    <!-- Подписи к засечкам    -->
                    <text fill="white" x="195" y="140">R/2</text>
                    <text fill="white" x="248" y="140">R</text>

                    <text fill="white" x="40" y="140">-R</text>
                    <text fill="white" x="90" y="140">-R/2</text>

                    <text fill="white" x="160" y="105">R/2</text>
                    <text fill="white" x="160" y="55">R</text>

                    <text fill="white" x="160" y="205">-R/2</text>
                    <text fill="white" x="160" y="255">-R</text>

                    <text fill="white" x="160" y="10">Y</text>
                    <text fill="white" x="290" y="140">X</text>

                    <!-- first figure triangle -->
                    <polygon fill="blue"
                             fill-opacity="0.3"
                             points="100,150 150,150 150,200"
                             stroke="blue"></polygon>

                    <!-- second figure rectangle-->
                    <polygon fill="yellow"
                             fill-opacity="0.3"
                             points="50,150 50,100 150,100 150,150"
                             stroke="yellow"></polygon>

                    <!-- third figure circle-->
                    <path d="M 250 150 L 150 150 L 150 50 C 198 50 250 100 250 150 Z"
                          fill="green"
                          fill-opacity="0.3"
                          stroke="green"></path>


                    <circle cx="150" cy="50" id="target-dot" r="3" stroke="white" fill="white"></circle>
                </svg>
                <div class="X_select">
                    <p class="prompt-text">Выбираем X:</p>
                    <div class="select-wrap"><label>
                        <select class="text-input invert-colors selector">
                            <option>-3</option>
                            <option>-2</option>
                            <option>-1</option>
                            <option>0</option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </label></div>
                    <p class="incorrect-input-notif" id="x_inc"></p>
                </div>
                <div class="Y_select">
                    <p class="prompt-text">Выбираем Y (-5 ... 5):</p>
                    <label><input type="text" placeholder="Введите число..." id="tbx_y" class="text-input invert-colors"></label>
                    <p class="incorrect-input-notif" id="y_inc"></p>
                </div>
                <button type="button" class="confirm-colors" id="btn_cfm" onclick="sendButton()">Отправить точку</button>
                <br>
                <hr>
                <div class="R_select">
                    <p class="prompt-text">Выбираем R:</p>
                    <button type="button" class="invert-colors" id="btn-1" onclick="setR(1)">1</button>
                    <button type="button" class="invert-colors" id="btn-2" onclick="setR(2)">2</button>
                    <button type="button" class="invert-colors" id="btn-3" onclick="setR(3)">3</button>
                    <br>
                    <button type="button" class="invert-colors" id="btn-4" onclick="setR(4)">4</button>
                    <button type="button" class="invert-colors" id="btn-5" onclick="setR(5)">5</button>
                    <p class="incorrect-input-notif" id="r_inc"></p>
                </div>
                <button type="button" class="confirm-colors" id="btn_cfmr" onclick="sendButton()">Отправить R</button>
                <br>
                <hr>
                <br>
                <button type="button" class="reset-colors" id="btn_rst" onclick="sendReset()">Ресет</button>
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