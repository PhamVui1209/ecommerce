$('.popup').addClass('hienpopup');

$('.closepopup').click(function (e) {
    $('.popup').removeClass('hienpopup');

});
//Set thời gian tắt popup
var tb = setInterval(function () {
    $('.popup').removeClass('hienpopup');
    clearInterval(tb);
}, 15000);

$('.btnDatHang').click(function (e) {
    $('.dangnhap').addClass('hiendangnhap');
})

function executeBefore() {
    alert("execute before");
}