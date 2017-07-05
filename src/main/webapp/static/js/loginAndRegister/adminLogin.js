function adminLogin() {
    var password=$('#password').val();
    var username=$('#username').val();
    var validateText=$('#validateText').val();

    $.ajax(
        {
            type: 'post',
            url: '/admin/login',
            dataType: 'json',
            data: {
                'username': username,
                'password': password,
                'validateCode': validateText
            },
            success: function (response) {
                if(response==="ERROR")
                {
                    $('#password').val('');
                }
                else window.location.href='admin/index';
            },
            error: function () {
                console.log('error!');
            }
        }
    )

}