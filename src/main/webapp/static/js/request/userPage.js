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
               loadUnreceivedOrders(1);
               loadUncommentedOrders(1);
               loadAddress()
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
            var unpaid = $('#dfk');
            for (var i in data) {
                $(unpaid[i]).append
                (
                    '<div class="row" style="border-top:1px solid #ccc;padding:10px;">'+
                        '<div class="col-md-2" >'+
                            '<a href="commodityDetails"><img src="/static/images/product/arrival/1.jpg" style="width:40%;height:50%;margin-top:20px;"></a>'+
                        '</div>'+
                        '<div class="col-md-3" style="margin-top:20px;padding:20px;">'+
                            '<span>' + data[i].name + '</span>'+
                        '</div>'+
                        '<div class="col-md-3" style="margin-top:20px;padding:20px;">'+
                            '<span>' + data[i].commodityType + '</span>'+
                        '</div>'+
                        '<div class="col-md-1" style="margin-top:25px;padding:20px;">'+
                            '<h4>￥' + data[i].price + '</h4>'+
                        '</div>'+
                        '<div class="col-md-3" style="margin-top:20px;padding:20px;">'+
                            '<div class="btn-group" role="group" aria-label="...">'+
                                '<button type="button" class="btn btn-default" onclick="">去付款</button>'+
                                '<button type="button" class="btn btn-default" onclick="">删除订单</button>'+
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

function loadUnreceivedOrders(page) {
    $.ajax({
        type: 'get',
        url: 'unreceived',
        data: { 'page': page },
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            var unreceived = $('#dsh');
            for (var i in data) {
                $(unreceived[i]).append(
                    '<div class="row" style="border-top:1px solid #ccc;padding:10px;">' +
                    '<div class="col-md-1" style="">' +
                    '<a href="commodityDetails"><img src="" style="width:100%;height:100%;margin-top:20px;"></a>' +
                    '</div>' +
                    '<div class="col-md-2" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].name + '</span>' +
                    '</div>' +
                    '<div class="col-md-1" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].commodityType + '</span>' +
                    '</div>' +
                    '<div class="col-md-2" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].phoneNumber +'</span>' +
                    '</div>' +
                    '<div class="col-md-2" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].address + '</span>' +
                    '</div>' +
                    '<div class="col-md-1" style="margin-top:25px;padding:20px;">' +
                    '<h4>￥' + data[i].price +  '</h4>' +
                    '</div>' +
                    '<div class="col-md-3" style="margin-top:20px;padding:20px;">' +
                    '<div class="btn-group" role="group" aria-label="...">' +
                    '<button type="button" class="btn btn-default">确认收货</button>' +
                    '<button type="button" class="btn btn-default">删除订单</button>' +
                    '</div>' +
                    '</div>' +
                    '</div>'
                )
            }
        },
        error: function () {
            console.log('Cannot load unreceived orders')
        }
    })
}

function loadUncommentedOrders(page) {
    $.ajax({
        type: 'get',
        url: 'uncomment',
        data: { 'page': page },
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            console.log(data)
            var unreceived = $('#dpj');
            for (var i in data) {
                $(unreceived[i]).append(
                    '<div class="row" style="border-top:1px solid #ccc;padding:10px;">' +
                    '<div class="col-md-1" style="">' +
                    '<a href="commodityDetails"><img src="" style="width:100%;height:100%;margin-top:20px;"></a>' +
                    '</div>' +
                    '<div class="col-md-2" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].name + '</span>' +
                    '</div>' +
                    '<div class="col-md-1" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].commodityType + '</span>' +
                    '</div>' +
                    '<div class="col-md-2" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].phoneNumber +'</span>' +
                    '</div>' +
                    '<div class="col-md-2" style="margin-top:20px;padding:20px;">' +
                    '<span>' + data[i].address + '</span>' +
                    '</div>' +
                    '<div class="col-md-1" style="margin-top:25px;padding:20px;">' +
                    '<h4>￥' + data[i].price +  '</h4>' +
                    '</div>' +
                    '<div class="col-md-3" style="margin-top:20px;padding:20px;">' +
                    '<div class="btn-group" role="group" aria-label="...">' +
                    '<button type="button" class="btn btn-default">确认收货</button>' +
                    '<button type="button" class="btn btn-default">删除订单</button>' +
                    '</div>' +
                    '</div>' +
                    '</div>'
                )
            }
        },
        error: function () {
            console.log('Cannot load uncommented order');
        }
    })
}

function loadAddress() {
    $.ajax({
        type: 'get',
        url: 'getAllAddress',
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            var addressList = $('#addressList');
            addressList.html('');
            for (var i in data) {
                var id = parseInt(i) + 1;
                addressList.append(
                    '<tr style="width:100%;">' +
                    '<td class="addressId" aid="' + data[i].id + '">' + id + '</td>' +
                    '<td class="receiverName">' + data[i].name + '</td>' +
                    '<td class="addressDetails">' + data[i].address + '</td>' +
                    '<td class="receiverPhoneNumber">' + data[i].phonenumber + '</td>' +
                    '<td><button type="button" class="btn btn-default" onclick="deleteAddress(' + id +')">删除</button></td>' +
                    '</tr>'
                )
            }
        },
        error: function () {
            console.log('Cannot load Address')
        }
    })
}

function addAddress() {
    var address = {
        'name': $('#new-name').val(),
        'address': $('#new-address').val(),
        'phone': $('#new-phone').val()
    };
    $.ajax({
        type: 'post',
        url: 'addAddress',
        data: address,
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            if (data.status === 'SUCCESS') {
                $('#new-name').val('');
                $('#new-address').val('');
                $('#new-phone').val('')
                loadAddress()
            }
        },
        error: function () {
            console.log('Cannot add new address')
        }
    })
}

function editAddress(id) {
    var addressList = $($('#addressList').find('tr')[id-1]);
    var address = {
        'id': addressList.find('.addressId').attr('aid'),
        'name': addressList.find('.receiverName').html(),
        'address': addressList.find('.addressDetails').html(),
        'phonenumber': addressList.find('.receiverPhoneNumber').html()
    };
    $.ajax({
        type: 'post',
        url: 'editAddress',
        data: JSON.stringify(address),
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            if(data.status === 'SUCCESS')
                alert('保存成功')
        },
        error: function () {
            console.log('Cannot save Address')
        }
    })
}

function deleteAddress(id) {
    var addressList = $($('#addressList').find('tr')[id-1]);
    var aid = addressList.find('.addressId').attr('aid');
    $.ajax({
        type: 'post',
        url: 'deleteAddress',
        data: { 'id': aid },
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            if(data.status === 'SUCCESS')
                addressList.remove();
        },
        error: function () {
            console.log('Cannot delete Address')
        }
    })
}
