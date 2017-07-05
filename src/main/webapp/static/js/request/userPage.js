function checkUserInfo() {
   $.ajax({
       type: 'get',
       url: 'checkUserInfo',
       headers: { 'token': Cookie.getToken() },
       success: function (data) {
           if (data.status === 'ERROR') {
               $('.nav-tabs a[href="#settings"]').tab('show');
               var nav_tabs = $('#nav-list').find('a');
               for (var i = 0 ; i < 5; i++)
                   if ( i !== 2 ) {
                       $(nav_tabs[i]).attr('href', '#');
                       $(nav_tabs[i]).attr('onclick', 'userInfoHint()');
                   }
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
        'birthday': birthday,
        'address': $('#address').val(),
        'identityNumber': $('#identityNumber').val(),
        'phoneNumber': $('#phoneNumber').val(),
        'email': $('#email').val()
    };
    if (user.name === '')
        alert('姓名');
}

function userInfoHint() {
    alert('请先完成个人信息！')
}

$(document).ready(checkUserInfo);