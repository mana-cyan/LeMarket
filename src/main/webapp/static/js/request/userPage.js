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

function loadUserInfo() {
    $.ajax({
        type: 'get',
        url: 'getUser',
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            var birthday = new Date(data.birthday);
            $('#name').val(data.name);
            $('#gender').val(data.gender);
            $('#year').val(birthday.getFullYear());
            $('#month').val(birthday.getMonth());
            $('#day').val(birthday.getDate());
            $('#address').val(data.address);
            $('#identityNumber').val(data.identitynumber);
            $('#phoneNumber').val(data.phonenumber)
        },
        error: function () {
            console.log('Cannot Load UserInfo')
        }
    })
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
           } else {
               loadUserInfo();
               loadUnpaidOrders(1);
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
        'name': $('#name').val(),
        'gender': $('#gender').val(),
        'birthday': birthday.getTime(),
        'address': $('#address').val(),
        'identitynumber': $('#identityNumber').val(),
        'phonenumber': $('#phoneNumber').val()
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

function loadUnpaidOrders(page) {
    $.ajax({
        type: 'get',
        url: 'unpaid',
        data: { 'page': page },
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            console.log(data);
            var unpaid = $('#dfk');
            for (var i in data) {
                $(unpaid[i]).append
                (
                    '<div class="row" style="border-top:1px solid #ccc;padding:10px;">'+
                        '<div class="col-md-3" >'+
                            '<a href="commodityDetails"><img src="/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>'+
                        '</div>'+
                        '<div class="col-md-5" style="margin-top:20px;padding:20px;">'+
                            '<span>' + data[i].name + '</span>'+
                        '</div>'+
                        '<div class="col-md-1" style="margin-top:25px;padding:20px;">'+
                            '<h4>￥' + data[i].price + '</h4>'+
                        '</div>'+
                        '<div class="col-md-3" style="margin-top:20px;padding:20px;">'+
                            '<div class="btn-group" role="group" aria-label="...">'+
                                '<button type="button" class="btn btn-default"><a href="pay.jsp">去付款</a></button>'+
                                '<button type="button" class="btn btn-default">删除订单</button>'+
                            '</div>'+
                        '</div>'+
                    '</div>'
                )
            }
        },
        error: function () {
            console.log('Cannot load unpaid orders')
        }
    })
}