var nav_tabs = $('#nav-list').find('a');

function lockNav() {
    for (var i = 0 ; i < 5; i++) {
        if (i !== 2) {
            $(nav_tabs[i]).attr('href', '#');
            $(nav_tabs[i]).attr('onclick', 'userInfoHint()');
        }
    }
}

function unlockNav() {
    for (var i = 0 ; i < 5; i++) {
        if (i !== 2)
            $(nav_tabs[i]).removeAttr('onclick')
    }
    $(nav_tabs[0]).attr('href', '#home');
    $(nav_tabs[1]).attr('href', '#profile');
    $(nav_tabs[3]).attr('href', '#messages');
    $(nav_tabs[4]).attr('href', '#shoucang');
}

function checkUserInfo() {
   $.ajax({
       type: 'get',
       url: 'checkUserInfo',
       headers: { 'token': Cookie.getToken() },
       success: function (data) {
           if (data.status === 'ERROR') {
               $('.nav-tabs a[href="#settings"]').tab('show');
               lockNav();
           }
       },
       error: function () {
           console.log('Cannot check UserInfo')
       }
   })
}

function setUserInfo() {
    var birthday = new Date();
    birthday.setFullYear($('#year').val());
    birthday.setMonth($('#month').val());
    birthday.setDate($('#day').val());

    var user = {
        'username': $('#name').val(),
        'gender': $('#gender').val(),
        'birthday': birthday.getTime(),
        'address': $('#address').val(),
        'identitynumber': $('#identityNumber').val(),
        'phonenumber': $('#phoneNumber').val(),
        'email': $('#email').val()
    };
    if (user.name === '') {
        alert('姓名不能为空');
        return null;
    }
    if (user.address === '') {
        alert('地址不能为空');
        return null;
    }
    if (user.identitynumber === '') {
        alert('身份证号不能为空');
        return null;
    }
    if (user.phonenumber === '') {
        alert('手机号不能为空');
        return null;
    }
    if (user.email === '') {
        alert('邮箱不能为空');
        return null;
    }
    console.log(user);
    $.ajax({
        type: 'post',
        url: 'setUserInfo',
        data: JSON.stringify(user),
        contentType: "application/json",
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            if (data.status === 'SUCCESS') {
                unlockNav();
                $('.nav-tabs a[href="#home"]').tab('show');
            }
        },
        error: function () {
            console.log('Cannot set user info');
        }
    })
}

function userInfoHint() {
    alert('请先完成个人信息！')
}

$(document).ready(checkUserInfo);