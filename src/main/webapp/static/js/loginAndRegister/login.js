var Cookie = Cookie || {};
var Login=Login ||  {};

Cookie.get = function (name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return arr[2];
    else
        return null;
};

Cookie.set = function (name, value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + value + ";expires=" + exp.toGMTString();
};

Cookie.getSalt=function () {
    return Cookie.get('salt');
};

Cookie.setSalt=function (value) {
    Cookie.set('salt',value);
};

Login.checkKey= function() {
    var div = $('#username');
    if (div.val().contains('@'))
        checkEmail(onCheckFinish);
    else
        checkUsername(onCheckFinish);
};

Login.Do=function() {
    encryptWithSaltInCookie();
    var keyDiv = $('#username');
    if (keyDiv.val().contains('@'))
        loginWithEmail();
    else
        loginWithUsername();
};



function checkUsername(callback) {
    $.ajax(
        {
            type: 'get',
            url: '/checkUsername',
            data: $('#username').val(),
            success: function (response) {
                callback(response);
            },
            error: function () {
                console.log("error!");
            }
        }
    )
}

function checkEmail(callback) {
    $.ajax(
        {
            type: 'get',
            url: '/checkEmail',
            data: $('#username').val(),
            success: function (response) {
                callback(response);
            },
            error: function () {
                console.log('error!');
            }
        }
    )
}

function onCheckFinish(val) {
    if (val.status === 'SUCCESS') {
        setSalt(val);
    }
    else {

    }
}

function encryptWithSalt(password, salt) {
    return bcrypt.hashSync(password, salt);
}

function encryptWithSaltInCookie() {
    var pswDiv = $('#password');
    pswDiv.val(bcrypt.hashSync(pswDiv.val(), salt));
}

function loginWithUsername() {
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var validateDiv = $('#validateCode');
    $.ajax(
        {
            type: 'post',
            url: '/login',
            data: {
                'username': usernameDiv.val(),
                'password': passwordDiv.val(),
                'validateCode': validateDiv.val()
            },
            success: function (response) {
                token = response.token;
                onLoginFinish(token);
            },
            error: function () {
                console.log('error!');
            }
        }
    )

}

function loginWithEmail() {
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var validateDiv = $('#validateCode');
    $.ajax(
        {
            type: 'post',
            url: '/login',
            data: {
                'email': usernameDiv.val(),
                'password': passwordDiv.val(),
                'validateCode': validateDiv.val()
            },
            success: function (response) {
                token = response.token;
                onLoginFinish(token);
            },
            error: function () {
                console.log('error!');
            }
        }
    )
}

function onLoginFinish(token) {
    var messageDiv = $('#wrongMessage');
    if (token === "") {
        messageDiv.html("用户名或密码错误!");
    }
    else {
        document.cookie = "token=" + token;
        $.ajax({
                type: 'get',
                url: 'index'
            }
        );
    }
}

$('#username').on('blur', Login.checkKey);
$('#submit').on('click', Login.Do);