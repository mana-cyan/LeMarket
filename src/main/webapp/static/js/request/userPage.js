function checkUserInfo(id) {
   $.ajax({
       type: 'get',
       url: 'checkUserInfo',
       data: { 'id': id },
       success: function (data) {
           if (data.status === 'ERROR')
               $('.nav-tabs a[href="#settings"]').tab('show')
       }
   })
}

$(document).ready(checkUserInfo);