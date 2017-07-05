function setUserInfo() {
    scrollTo("#settings", 500)
}

function checkUserInfo(id, callback) {
   $.ajax({
       type: 'get',
       url: 'checkUserInfo',
       data: { 'id': id },
       success: function (data) {
           if (data.status === 'SUCCESS')
               callback();
       }
   })
}

$(document).ready(setUserInfo);