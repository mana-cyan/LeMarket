var ToolBar= {};
ToolBar.getStatus=function () {
    if(Cookie.getToken()===null||Cookie.getToken()==='')
    {
        doStatusError();
        return;
    }
    $.ajax({
        url: 'checkIsLogin',
        data: {'token':Cookie.getToken()},
        success: function (response) {
            onReceiveStatusResult(response);
        },
        error: function () {
          doStatusError();
        }
    })
};

function onReceiveStatusResult(status) {
    if(status==='SUCCESS') doStatusSuccess();
    else doStatusError();
}

function logOut() {
    Cookie.setToken('');
    window.location.href='index';
}

function doStatusSuccess() {
    hideNode($('#barLogin'));
    hideNode($('#barRegister'));
    showNode($('#barMyOrder'));
    showNode($('#barMyRoom'));
    showNode($('#barExit'));
}

function doStatusError() {
    showNode($('#barLogin'));
    showNode($('#barRegister'));
    hideNode($('#barMyRoom'));
    hideNode($('#barMyOrder'));
    hideNode($('#barExit'));
}

function hideNode(node) {
    node.hide();
}

function showNode(node) {
    node.show();
}

$('#barExit').on('click',logOut);
$(document).ready(ToolBar.getStatus);