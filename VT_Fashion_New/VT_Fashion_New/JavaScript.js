$(document).ready(function () {

    $('.khoi .tren').click(function () {

        $(this).addClass('active').siblings().removeClass('active');

    });

    $('.home-slider').owlCarousel({
        items: 1, //hiển thị 1 item trên 1 slide
        nav: true, // mũi tên chuyển slide (đóng, mở)
        dots: false, // nút chuyển slide
        autoplay: true, // Tự động chuyển slide
        autoplayTimeout: 8000, //  Thời gian chuyển slide
        autoplayHoverPause: false, // Tự động dừng khi rê chuột vào slide
        loop: true
    });

    $('.gallery .btn').click(function () {
        let filter = $(this).attr('data-filter');
        if (filter == 'all') {
            $('.gallery .box').show(400);
        } else {
            $('.gallery .box').not('.' + filter).hide(200);
            $('.gallery .box').filter('.' + filter).show(400);
        }
        $(this).addClass('button-active').siblings().removeClass('button-active');

    });

    $('.box-container').owlCarousel({
        item: 3, //hiển thị 3 item trên 1 slide
        nav: true, // mũi tên chuyển slide (đóng, mở)
        dots: false, // nút chuyển slide
        autoplay: true, // Tự động chuyển slide
        autoplayTimeout: 8000, //  Thời gian chuyển slide
        autoplayHoverPause: true, // Tự động dừng khi rê chuột vào slide
        loop: true
    });

    $('.review_container').owlCarousel({
        item: 3, //hiển thị 1 item trên 1 slide
        nav: false, // mũi tên chuyển slide (đóng, mở)
        dots: false, // nút chuyển slide
        autoplay: true, // Tự động chuyển slide
        autoplayTimeout: 8000, //  Thời gian chuyển slide
        autoplayHoverPause: true, // Tự động dừng khi rê chuột vào slide
        loop: true
    });

    $('.nutdn').click(function (e) {
        $('.dangnhap').addClass('hiendangnhap');
    })

});
//bí danh




