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
    checkUsername($('#username').val(),userNameCheckCallback);
};

Register.checkEmail = function () {

    checkEmail($('#email').val(),emailCheckCallback);
};

Register.Do = function () {
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var emailDiv = $('#email');
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
                onRegisterFinish(response.token);
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



function onRegisterFinish(token) {
    var messageDiv = $('#registerFailMessage');
    if (token === '') {
        showMessage(messageDiv,false,'注册失败');
    }
    else {

        messageDiv.html("注册成功");
        Cookie.setToken(token);
        window.location.href='redirectIndex?token='+Cookie.getToken();
        $.ajax({
                type: 'get',
                url: '/redirectIndex'
            }
        );
    }
}

$('#username').on('blur', Register.checkUsername);
$('#repeatPassword').on('blur', Register.checkPasswordRepeat);
$('#email').on('blur', Register.checkEmail);
$('#submit').on('click', Register.Do);

