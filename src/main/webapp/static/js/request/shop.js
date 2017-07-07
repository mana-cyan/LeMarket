var shopName = $('#shopName');
var shopDescription = $('#shopDescription');
var shopAddress = $('#shopAddress');
var ownerPhoneNumber = $('#ownerPhoneNumber');
var ownerEmail = $('#owenEmail');

function loadShop() {
    $.ajax({
        type: 'get',
        url: 'getShop',
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            shopName.val(data.name);
            shopDescription.val(data.description);
            shopAddress.val(data.address);
            ownerPhoneNumber.val(data.phoneNumber);
            ownerEmail.val(data.email)
        },
        error: function () {
            console.log('Cannot load shop info!')
        }
    })
}

$(document).ready(loadShop);
