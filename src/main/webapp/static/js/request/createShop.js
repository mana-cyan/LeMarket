function createShop() {
    var nameDiv = $('#name');
    console.log(nameDiv.val())
    var descriptionDiv = $('#description');
    var phoneNumberDiv = $('#phoneNumber');
    $.ajax(
        {
            type: 'post',
            url: 'addShop',
            data: {
                'name': nameDiv.val(),
                'description': descriptionDiv.val(),
                'phoneNumber': phoneNumberDiv.val()
            },
            headers: { 'token': Cookie.getToken() },
            success: function (data) {
                console.log(data)
            },
            error: function () {
                console.log('Cannot create shop!');
            }
        }
    );
}

function onRegisterFinish() {

}