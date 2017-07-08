var name = $('#name');
var address = $('#address');
var phoneNumber = $('#phoneNumber');

// function loadReceiveInfo() {
//     $.ajax({
//         type: 'get',
//         url: 'getAllAddress',
//         headers: { 'token': Cookie.getToken() },
//         success: function (data) {
//             if (data !== undefined && data.length !== 0) {
//                 var address = $(data[0]);
//                 $('#name').val(address.name);
//                 address.val(address.address);
//                 phoneNumber.val(address.phoneNumber)
//             }
//         },
//         error: function () {
//             console.log('Cannot load address')
//         }
//     })
// }

// $(document).ready(loadReceiveInfo);

