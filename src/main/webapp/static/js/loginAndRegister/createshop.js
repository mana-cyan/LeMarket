var createShop = createShop || {};


createShop.checkUsername = function () {
    if(!createShop.checkUserNameLegal()) return showMessage($('#usernameStatus'),false,'用户名不合法');
    checkUsername($('#name').val(),userNameCheckCallback);
};

createShop.checkUserNameLegal=function () {
    var name=$('#name').val();
    if(name.length>=6&&name.length<=20) return true;
    return false;
}


createShop.Do = function () {
    var nameDiv = $('#name');
    var descriptionDiv = $('#description');
    var phoneNumberDiv = $('#phoneNumber');
    //console.log(Cookie.getSalt());
    //console.log(encryptWithSalt(passwordDiv.val(),Cookie.getSalt()));
    $.ajax(
        {
            type: 'post',
            url: '/addShop',
            data: {
                'username': nameDiv.val(),
                'description': descriptionDiv.val(),
                'phoneNumber': phoneNumberDiv.val()
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

$('#name').on('blur', createShop.checkUsername);

$('#submit').on('click', createShop.Do);

/**
 * Created by Joey on 2017/7/7.
 */
