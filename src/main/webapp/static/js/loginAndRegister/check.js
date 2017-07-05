var bcrypt=dcodeIO.bcrypt;
function checkUsername(username,callback) {
    username={'username': username};
    $.ajax(
        {
            type: 'get',
            url: '/checkUsername',
            dataType: 'json',
            data: username,
            success: function (response) {
                callback(response);
            },
            error: function () {
                console.log("error!");
            }
        }
    )
}

function requestSalt() {
    $.ajax({
        type: 'get',
        url: '/getSalt',
        dataType: 'json',
        success: function (response) {
            Cookie.setSalt(response.salt);
        }
    });
}

function checkEmail(email,callback) {
    $.ajax(
        {
            type: 'get',
            url: '/checkEmail',
            dataType: 'json',
            data: {
                'email': email
            },
            success: function (response) {
                callback(response);
            },
            error: function () {
                console.log('error!');
            }
        }
    )
}

function showMessage(div,status,message) {
    var successColor='green';
    var failColor='red';

    if(status===true) {
        div.css('color',successColor);
    }
    else div.css('color',failColor);
    div.html(message);
}

function encryptWithSalt(password, salt) {
    return bcrypt.hashSync(password, salt);
}

