function checkUserInfo() {
   $.ajax({
       type: 'get',
       url: 'checkUserInfo',
       headers: { 'token': Cookie.getToken() },
       success: function (data) {
           if (data.status === 'ERROR')
               $('.nav-tabs a[href="#settings"]').tab('show')
       },
       error: function () {
           console.log('Cannot check UserInfo')
       }
   })
}

$(document).ready(checkUserInfo);