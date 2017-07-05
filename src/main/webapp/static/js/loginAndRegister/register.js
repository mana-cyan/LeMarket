var Register = Register || {};

Register.checkPasswordRepeat = function () {
    var passwordInput = $('#password');
    var passwordRepeat = $('#repeatPassword');
    var message = $('#passwordRepeatStatus');
    if (passwordInput.val() === passwordRepeat.val()) {
        showMessage(message,true,'通过');
        requestSalt();
        console.log('success');
    }
    else {
        showMessage(message,false,'密码确认失败');
        console.log('fail');
    }

};

Register.checkUsername = function () {
    if(!Register.checkUserNameLegal()) return showMessage($('#usernameStatus'),false,'用户名不合法');
    checkUsername($('#username').val(),userNameCheckCallback);
};

Register.checkUserNameLegal=function () {
    var username=$('#username').val();
    if(username.length>=6&&username.length<=20) return true;
    return false;
}

Register.checkEmail = function () {
    if(!Register.checkEmailLegal()) return showMessage($('#emailStatus'),false,'邮箱不合法');
    checkEmail($('#email').val(),emailCheckCallback);
};

Register.checkEmailLegal=function () {
    var email=$('#email').val();
    if(email.length>=8&&email.length<=30) return true;
    return false;
}

Register.Do = function () {
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var emailDiv = $('#email');
    console.log(Cookie.getSalt());
    console.log(encryptWithSalt(passwordDiv.val(),Cookie.getSalt()));
    $.ajax(
        {
            type: 'post',
            url: '/register',
            data: {
                'username': usernameDiv.val(),
                'password': encryptWithSalt(passwordDiv.val(),Cookie.getSalt()),
                'email': emailDiv.val()
            },
            success: function (response) {
                onRegisterFinish(response);
            },
            error: function () {
                console.log('error!');
            }
        }
    );
};

function userNameCheckCallback(response) {
    var userNameMessage = $('#usernameStatus');
    if (response.status === 'SUCCESS') {
        showMessage(userNameMessage,false,'用户名已存在');
    }
    else {
        showMessage(userNameMessage,true,'通过');

    }
}

function emailCheckCallback(response) {
    var emailMessage = $('#emailStatus');
    if (response.status === 'SUCCESS') {
        showMessage(emailMessage,false,'邮箱已存在');
    }
    else {
        showMessage(emailMessage,true,'通过');
    }

}



function onRegisterFinish(response) {
    var messageDiv = $('#registerFailMessage');
    if (response.token === '') {
        showMessage(messageDiv,false,'注册失败');
    }
    else {
        console.log(response.token);
        Cookie.setToken(response.token);
        window.location.href='userPage';
    }
}

$('#username').on('blur', Register.checkUsername);
$('#repeatPassword').on('blur', Register.checkPasswordRepeat);
$('#email').on('blur', Register.checkEmail);
$('#submit').on('click', Register.Do);

