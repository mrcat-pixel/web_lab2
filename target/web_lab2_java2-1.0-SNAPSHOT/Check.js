let X_value = 0;

function submitdata() {
    alert(":");

    document.getElementById("y").innerHTML = "";
    document.getElementById("r").innerHTML = "";

    const yCheck = checkY(), rCheck = checkR();

    if (!yCheck) document.getElementById("y").innerHTML = "Некорректный ввод!";
    if (!rCheck) document.getElementById("r").innerHTML = "Некорректный ввод!";

    if (!yCheck || !rCheck) return;

    alert(getX(),getY(),getR());

    fetch("control-servlet?" + new URLSearchParams({
        x: getX(),
        y: getY(),
        r: getR()
    })).then(res => {
        res.json().then(json => {
            const table = document.getElementById("hello-servlet");
            const row = table.insertRow(0);
            row.insertCell().innerText = json.x;
            row.insertCell().innerText = json.y;
            row.insertCell().innerText = json.r;
            row.insertCell().innerText = json.insideArea ? 'да' : 'нет';
            row.insertCell().innerText = json.executionTime + "нс"
        })
    })
}

function setX(x) {
    X_value = x;
    for(let i=-5; i<=3; i++) {
        document.getElementById('btn-' + i).classList.remove("confirm-colors");
    }
    document.getElementById('btn-' + x).classList.add("confirm-colors");
}

function setY(y) {
    document.getElementById('y').value = y;
}

function setR(r) {
    document.getElementById('r').value = r;
}

function getX() {
    return X_value;
}

function getY() {
    const strValue = document.getElementById('y').value.replace(',', '.');
    if (strValue.trim() === '') return NaN;
    return +strValue;
}

function getR() {
    for(let i=1; i<=3; i=i+0.5) {
        if (document.getElementById('contactChoice' + i).checked) {
            return i;
        }else{
            return i=99;
        }
    }
}

function checkY() {
    const y = getY();
    return !isNaN(y) && y > -3 && y < 5;
}

function checkR() {
    const r = getR();
    return r !== 99;
}

function Hi() {
    alert("Привет");
}