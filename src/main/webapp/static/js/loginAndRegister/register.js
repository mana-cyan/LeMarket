var Register = Register || {};

Register.checkPasswordRepeat = function () {
    var passwordInput = $('#password');
    var passwordRepeat = $('#repeatPassword');
    var message = $('#passwordRepeatError');
    if (passwordInput.val() === passwordRepeat.val()) {
        message.html('');
        requestSalt();
        console.log('success');
    }
    else {
        message.html('密码确认失败!');
        console.log('fail');
    }

};

Register.checkUsername = function () {
    checkUsername(userNameCheckCallback);
};

Register.checkEmail = function () {
    checkEmail(emailCheckCallback);
};

Register.Do = function () {
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var emailDiv = $('#email');
    var validateDiv = $('#validateCode');
    $.ajax(
        {
            type: 'post',
            url: '/register',
            data: {
                'username': usernameDiv.val(),
                'password': encryptWithSalt(passwordDiv.val(),Cookie.getSalt()),
                'email': emailDiv.val(),
                'validateCode': validateDiv.val()
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
    var userNameMessage = $('#userExistMessage');
    if (response.status === 'SUCCESS') {
        userNameMessage.html('');
    }
    else {
        userNameMessage.html('用户名已存在')
    }
}

function emailCheckCallback(response) {
    var emailMessage = $('#emailExistMessage');
    if (response.status === 'SUCCESS') {
        emailMessage.html('');
    }
    else {
        emailMessage.html('邮箱已存在');
    }

}

function requestSalt() {
    $.ajax({
        type: 'get',
        url: 'getSalt',
        success: function (response) {
            Cookie.setSalt(response.salt);
        }
    })
}

function onRegisterFinish(response) {
    var messageDiv = $('#registerFailMessage');
    if (response.token === '') {
        messageDiv.html('注册失败!');
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

$('#username').on('blur', Register.checkUsername);
$('#repeatPassword').on('blur', Register.checkPasswordRepeat);
$('#email').on('blur', Register.checkEmail);
$('#submit').on('click', Register.Do);

