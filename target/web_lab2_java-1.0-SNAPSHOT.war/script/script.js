let R_value = 0;

function sendButton() {
    let checker = 0;
    if (!checkX()) {
        document.getElementById("x_inc").innerHTML = "Некорректный ввод!";
    }
    else {
        document.getElementById("x_inc").innerHTML = "";
        checker += 1;
    }
    if (!checkY()) {
        document.getElementById("y_inc").innerHTML = "Некорректный ввод!";
    }
    else {
        document.getElementById("y_inc").innerHTML = "";
        checker += 1;
    }
    if (!checkR()) {
        document.getElementById("r_inc").innerHTML = "Некорректный ввод!";
    }
    else {
        document.getElementById("r_inc").innerHTML = "";
        checker += 1;
    }
    if (checker !== 3) return;
    $.ajax(
        {
            url: "hello-servlet",
            data: {},
            type: "GET",
            success: function(data) {
                document.getElementById("table-place").innerText = data;
            },
            error: function (jqXHR, exception) {
                let msg = '';
                if (jqXHR.status === 0) {
                    msg = 'Not connected.\n Verify Network.';
                } else if (jqXHR.status === 404) {
                    msg = 'Requested page not found. [404]';
                } else if (jqXHR.status === 500) {
                    msg = 'Internal Server Error [500].';
                } else if (exception === 'parsererror') {
                    msg = 'Requested JSON parse failed.';
                } else if (exception === 'timeout') {
                    msg = 'Time out error.';
                } else if (exception === 'abort') {
                    msg = 'Ajax request aborted.';
                } else {
                    msg = 'Uncaught Error.\n' + jqXHR.responseText;
                }
                $('#post').html(msg);
            }
        }
    );
}

function getX() {
    for(let i=1; i<=9; i++) {
        if (document.getElementById('cbx_x' + i).checked) {
            return (i-6);
        }
    }
}

function getY() {
    return parseFloat(document.getElementById('tbx_y').value.slice(0, 10));
}

function getR() {
    return R_value;
}

function setR(r) {
    R_value = r;
    for(let i=1; i<=5; i++) {
        document.getElementById('btn-' + i).classList.remove("confirm-colors");
    }
    document.getElementById('btn-' + r).classList.add("confirm-colors");
}

function checkY() {
    let textGotten = document.getElementById('tbx_y').value;
    textGotten = textGotten.slice(0, 10);
    let floatGotten = parseFloat(textGotten);
    if (textGotten.includes(" ")) {
        return false;
    }
    if (isNaN(floatGotten)) {
        return false;
    }
    if (floatGotten > 5) {
        return false;
    }
    return floatGotten >= -5;
}

function checkR() {
    switch (R_value) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            return true;
        default:
            return false;
    }
}

function checkX() {
    return true;
}

function sendReset() {
    document.getElementById('tbx_y').value = '';
    document.getElementById("x_inc").innerHTML = "";
    document.getElementById("y_inc").innerHTML = "";
    document.getElementById("r_inc").innerHTML = "";
    document.getElementById("table-place").innerHTML = "";
    window.sessionStorage.setItem("stored", "");
}

window.onload = function loadSessionStorage() {
    document.getElementById("table-place").innerHTML = window.sessionStorage.getItem("stored");
}