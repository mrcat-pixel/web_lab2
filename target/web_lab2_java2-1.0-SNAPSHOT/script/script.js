let R_value = 5;

document.getElementById('click_catcher').addEventListener('mousemove', evt => {
    console.log(evt);
    if (R_value === 0) {
        alert("Не задан R!");
        return;
    }

    let target = evt.target;

    let offset = getCoords(evt.target);
    const width = offset.right - offset.left;
    const height = offset.bottom - offset.top;

    evt.target = target;
    let x = Math.round((evt.pageX - offset.left - width / 2) / (width / 2) * (5 / 2 * 3));
    let y = -((evt.pageY - offset.top - height / 2) / (height / 2) * (5 / 2 * 3));

    if (x < -3) { x = -3; }
    else if (x > 5) { x = 5; }

    if (y < -5 ) { y = -5; }
    else if ( y > 5) { y = 5; }

    setX(x);
    setY(y);

    drawDot(x, y);
});

document.getElementById('click_catcher').addEventListener('click', sendButton);

document.getElementById('click_catcher').addEventListener('mouseleave', deleteDot);

function deleteDot() {
    let circle = document.getElementById('selected_pos');
    if (circle !== null) circle.parentElement.removeChild(circle);
}

function deleteLittleDots() {
    let collection = document.getElementsByClassName("littleDot");
    while (collection.length !== 0) {
        let i = collection[0];
        i.parentElement.removeChild(i);
    }
}

function drawDot(x, y) {
    deleteDot();
    const svg = document.getElementById('graph');

    let circle = document.createElementNS("http://www.w3.org/2000/svg", 'circle');
    circle.setAttributeNS(null, 'cx', (x * 20 + 150).toString());
    circle.setAttributeNS(null, 'cy', (-y * 20 + 150).toString());
    circle.setAttributeNS(null, 'r', '8');
    circle.setAttributeNS(null, 'stroke', 'rgb(174, 193, 187)');
    circle.setAttributeNS(null, 'stroke-width', '5');
    circle.setAttributeNS(null, 'fill-opacity', '0');
    circle.id = "selected_pos";
    svg.appendChild(circle);
}

function drawLittleDot(x, y, checked) {
    const svg = document.getElementById('graph');

    let circle = document.createElementNS("http://www.w3.org/2000/svg", 'circle');
    circle.setAttributeNS(null, 'cx', (x * 20 + 150).toString());
    circle.setAttributeNS(null, 'cy', (-y * 20 + 150).toString());
    circle.setAttributeNS(null, 'r', '4');
    circle.classList.add("littleDot");

    if (checked) {
        circle.setAttributeNS(null, 'fill', 'mediumspringgreen');
    }
    else {
        circle.setAttributeNS(null, 'fill', 'palevioletred');
    }
    svg.appendChild(circle);
}

function redrawFigure(scale) {
    let figure1 = document.getElementById("figure1");
    figure1.setAttributeNS(null, 'points',
        (150 - 10*scale) + ',150 150,150 150,' + (150 + 10*scale));

    let figure2 = document.getElementById("figure2");
    figure2.setAttributeNS(null, 'points',
        (150 - 20*scale) + ',150 ' + (150 - 20*scale) + ',' + (150 - 10*scale) + ' 150,' + (150 - 10*scale) + ' 150,150');

    let figure3 = document.getElementById("figure3");
    figure3.setAttributeNS(null, 'd',
        'M ' + (150 + 20*scale) + ' 150 L 150 150 L 150 ' + (150 - 20*scale) + ' C ' + (150 + 10*scale) +
        ' ' + (150 - 20*scale) + ' ' + (150+20*scale) + ' ' + (150 - 10*scale) + ' ' + (150 + 20*scale) + ' 150 Z');
}

function getCoords(elem) {
    let box = elem.getBoundingClientRect();

    return {
        top: box.top + window.pageYOffset,
        right: box.right + window.pageXOffset,
        bottom: box.bottom + window.pageYOffset,
        left: box.left + window.pageXOffset
    };
}

function getX() {
    return +document.getElementById('x_select').value;
}

function getY() {
    const strValue = document.getElementById('tbx_y').value.replace(',', '.');
    if (strValue.trim() === '') return NaN;
    return +strValue;
}

function getR() {
    return R_value;
}

function setX(x) {
    document.getElementById('x_select').value = x;
}

function setY(y) {
    document.getElementById('tbx_y').value = y;
}

function setR(r) {
    R_value = r;
    for(let i=1; i<=5; i++) {
        document.getElementById('btn-' + i).classList.remove("confirm-colors");
    }
    document.getElementById('btn-' + r).classList.add("confirm-colors");
    redrawFigure(r);
}

function checkY() {
    const y = getY();
    return !isNaN(y) && y >= -5 && y <= 5;
}

function checkR() {
    return R_value > 0 && R_value <= 5 && (Math.round(R_value) - R_value === 0);
}

function sendButton() {
    document.getElementById("y_inc").innerHTML = "";
    document.getElementById("r_inc").innerHTML = "";

    const yCheck = checkY(), rCheck = checkR();

    if (!yCheck) document.getElementById("y_inc").innerHTML = "Некорректный ввод!";
    if (!rCheck) document.getElementById("r_inc").innerHTML = "Некорректный ввод!";

    if (!yCheck || !rCheck) return;

    fetch("calc?" + new URLSearchParams({
        x: getX(),
        y: getY(),
        r: getR()
    }))
        .then(handleErrors)
        .then(res => {
            res.json().then(json => {
                const table = document.getElementById("table-place");
                const row = table.insertRow(0);
                const date = new Date(json.timestamp);
                row.insertCell().innerText = json.x;
                row.insertCell().innerText = json.y.toString().substr(0, 5);
                row.insertCell().innerText = json.r;

                row.insertCell().innerText = json.insideArea ? 'да' : 'нет';
                row.insertCell().innerText = date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2) + "-" +
                    ("0" + date.getDate()).slice(-2) + " " + ("0" + date.getHours()).slice(-2) + ":" +
                    ("0" + date.getMinutes()).slice(-2) + ":" + ("0" + date.getSeconds()).slice(-2);
                row.insertCell().innerText = json.executionTime + "нс";
                drawLittleDot(json.x, json.y, json.insideArea);
            })
        });
}

function sendReset() {
    deleteLittleDots();
    setR(5);
    setX(-3);
    fetch('calc?clear').then(handleErrors);
    document.getElementById('tbx_y').value = '';
    document.getElementById("y_inc").innerHTML = "";
    document.getElementById("r_inc").innerHTML = "";
    document.getElementById("table-place").innerHTML = "";
}

function handleErrors(response) {
    if (!response.ok) {
        document.getElementById("connect-error").innerHTML =
            "Ошибка " + response.status.toString() + ": " + response.statusText;
    }
    return response;
}