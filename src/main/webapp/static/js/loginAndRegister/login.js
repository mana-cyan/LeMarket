var Login=Login ||  {};

Login.checkKey= function() {
    var div = $('#username');
    if (div.val().indexOf('@')>0)
        checkEmail(div.val(),onCheckFinish);
    else
        checkUsername(div.val(),onCheckFinish);
};

function checkArgsIsLegal()
{
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var validateDiv = $('#validateText');

    console.log('legalJudge');
    if(usernameDiv.val()===''||usernameDiv.length>20) return false;
    if(passwordDiv.val()===''||passwordDiv.length>32) return false;
    if(validateDiv.val()==='') return false;
    console.log('success');
    return true;
}

Login.Do=function() {
    if(checkArgsIsLegal()===false) return onArgsIllegalInput();
    var passwordDiv=$('#password');
    console.log(Cookie.getSalt());
    var cryptText=encryptWithSalt(passwordDiv.val().trim(),Cookie.getSalt());
    passwordDiv.val(cryptText);
    var keyDiv = $('#username');
    if (keyDiv.val().indexOf('@')>0)
        loginWithEmail();
    else
        loginWithUsername();
};

function onArgsIllegalInput() {
    $('#loginStatus').html('不合法的密码或用户名');
}



function onCheckFinish(val) {
    if (val.status === 'SUCCESS') {
        Cookie.setSalt(val.salt);
    }
    else {

    }
}

function loginWithUsername() {
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var validateDiv = $('#validateText');
    $.ajax(
        {
            type: 'post',
            url: '/login',
            dataType: 'json',
            data: {
                'username': usernameDiv.val(),
                'password': passwordDiv.val(),
                'validateCode': validateDiv.val()
            },
            success: function (response) {
                console.log(response);
                onLoginFinish(response.token);
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
    var validateDiv = $('#validateText');
    $.ajax(
        {
            type: 'post',
            url: '/login',
            dataType: 'json',
            data: {
                'email': usernameDiv.val(),
                'password': passwordDiv.val(),
                'validateCode': validateDiv.val()
            },
            success: function (response) {
                onLoginFinish(response.token);
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
        refreshValidateCode();
        messageDiv.html("用户名或密码错误!");
    }
    else {
        console.log('LoginSuccess');
        messageDiv.html("");
        Cookie.setToken(token);
        window.location.href='redirectIndex?token='+Cookie.getToken();
    }
}

$('#username').on('blur', Login.checkKey);
$('#submit').on('click', Login.Do);