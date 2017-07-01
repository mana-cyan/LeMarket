function checkPasswordRepeat() {
    var passwordInput=$('#password');
    var passwordRepeat=$('#repeatPassword');
    var message=$('#passwordRepeatError');
    if(passwordInput.val()===passwordRepeat.val())
    {
        message.html('');
        console.log('success');
    }
    else
    {
        message.html('密码确认失败!');
        console.log('fail');
    }

}

function checkUsernameExist() {
    checkUsername(userNameCheckCallback);
}

function checkEmailExist() {
    checkEmail(emailCheckCallback);
}

function userNameCheckCallback(response) {
    var userNameMessage=$('#userExistMessage');
    if(response.status==='SUCCESS')
    {
        document.cookie='salt='+response.salt;
        userNameMessage.html('');
    }
    else
    {
        userNameMessage.html('用户名已存在')
    }
}

function emailCheckCallback(response) {
    var emailMessage=$('#emailExistMessage');
    if(response.status==='SUCCESS')
    {
        emailMessage.html('');
    }
    else
    {
        emailMessage.html('邮箱已存在');
    }

}

function register() {
    var usernameDiv = $('#username');
    var passwordDiv = $('#password');
    var emailDiv=$('#email');
    var validateDiv = $('#validateCode')
    $.ajax(
        {
            type: 'post',
            url: '/register',
            data: {
                'username': usernameDiv.val(),
                'password': encrypt(passwordDiv.val(),getCookie('salt')),
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
    )
}

function onRegisterFinish(response) {
    var messageDiv=$('#registerFailMessage');
    if(response.token==='')
    {
        messageDiv.html('注册失败!');
    }
    else{
        document.cookie = "token=" + token;
        $.ajax({
                type: 'get',
                url: 'index'
            }
        );
    }
}

$('#username').on('blur',checkUsernameExist);
$('#repeatPassword').on('blur',checkPasswordRepeat);
$('#email').on('blur',checkEmailExist);
$('#submit').on('click',register);

