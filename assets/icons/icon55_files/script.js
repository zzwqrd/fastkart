/*-----------------------------------------------------------------------------------

    Template Name:Fastkart APP
    Template URI: themes.pixelstrap.com/Fastkart-app
    Description: This is PWA Html Template
    Author: Pixelstrap
    Author URL: https://themeforest.net/user/pixelstrap

----------------------------------------------------------------------------------- */
// 01.Service Worker Register js
// 02.Pre Loader js 
// 03.Ratio js
// 04.Header Sidebar js
// 05.Filter Select js
// 06.Address Active js
// 07.Plus Minus Item  Js 
// 08.Catagories Mordent Menu js
// 09.Filter Active js
// 10.Swipe To Show Delete cart page js
// 11.Product card Heart Fill js
// 12.Product card Plus js
// 13. Password Showhide js


(function ($) {

    /*========================
      01. Service Worker Register js
      ==========================*/
    $(window).on('load', function () {
        'use strict';
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker
                .register('sw.js');
        }
    });

    /*=====================
     02. Pre Loader js 
     ==========================*/
    $(window).on('load', function () {
        setTimeout(function () {
            $('.skeleton-loader').fadeOut('slow');
        }, 500);
        $('.skeleton-loader').remove('slow');
    });


    /*=====================
      03. Ratio js
     ==========================*/
    "use strict";
    // image to background
    $(".bg-top").parent().addClass('b-top'); // background postion top
    $(".bg-bottom").parent().addClass('b-bottom'); // background postion bottom
    $(".bg-center").parent().addClass('b-center'); // background postion center
    $(".bg-left").parent().addClass('b-left'); // background postion left
    $(".bg-right").parent().addClass('b-right'); // background postion right
    $(".bg_size_content").parent().addClass('b_size_content'); // background size content
    $(".bg-img").parent().addClass('bg-size');
    $(".bg-img.blur-up").parent().addClass('blur-up lazyload');
    $('.bg-img').each(function () {

        var el = $(this),
            src = el.attr('src'),
            parent = el.parent();


        parent.css({
            'background-image': 'url(' + src + ')',
            'background-size': 'cover',
            'background-position': 'center',
            'background-repeat': 'no-repeat',
            'display': 'block'
        });

        el.hide();
    });

    /*=====================
        04.  Header sidebar js
      ==========================*/
    $(".nav-bar").on('click', function () {
        $(".header-sidebar,.overlay-sidebar").addClass("show");
        $('body').addClass("bluer");
    });
    $(".user-panel, .overlay-sidebar ").on('click', function () {
        $(".header-sidebar,.overlay-sidebar").removeClass("show");
        $('body').removeClass("bluer");
    });

    /*=====================
      05. Filter select js
    ==========================*/
    $('.filter-row li').on('click', function (e) {
        $(this).addClass('active').siblings('.active').removeClass('active');
    });

    /*========================
       06. Address Active js
       =============================*/
    $('.address-box').on('click', function (e) {
        $(this).addClass('active').siblings('.active').removeClass('active');
    });

    /*=====================
     07. Plus Minus Item  Js 
    ==========================*/
    $('.add').on('click', function () {
        if ($(this).prev().val() < 10) {
            $(this).prev().val(+$(this).prev().val() + 1);
        }
    });
    $('.sub').on('click', function () {
        if ($(this).next().val() > 1) {
            if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
        }
    });

    /*========================
    08. Catagories Mordent Menu js
    =============================*/
    $(".catagories-menu").on('click', function () {
        $('#myScrollspy,.overlay').addClass("show");
        $(".toggle .overlay, .list-group-item").on('click', function () {
            $('#myScrollspy,.overlay').removeClass("show");
        });
    });

    /*========================
    09. Filter Active js
    =============================*/
    $(".size").on('click', function () {
        $(".size").removeClass('active');
        $(this).addClass('active');
    });



    /*==============================
       10. Swipe To Show Delete cart page js
    =====================================*/
    $(".swipe-to-show").on("swipeleft", function () {
        $(this).addClass('active').siblings().removeClass("active")
    })
    $(".swipe-to-show").on("swiperight", function () {
        $(this).removeClass("active")
    });

    /*==============================
      11. Product card Heart Fill js
     =====================================*/
    $(".product-card .iconly-Heart").on('click', function () {
        $(this).toggleClass("icli")
        $(this).toggleClass("icbo")
    });


    /*==============================
      12. Product card Plus js
     =====================================*/
    $(".plus-theme").on('click', function () {
        $(this).parent().addClass("active")
    });

    $(".sub").on('click', function () {
        if ($(this).siblings(".val").val() <= 1) {
            $(this).parentsUntil("active").removeClass("active")
        }
    });


    /*==============================
    13. Password Showhide js
   =====================================*/
    $(".showHidePassword").on("click", function () {
        $(this).toggleClass("iconly-Hide");
        $(this).toggleClass("iconly-Show");
        let inputEl = $(this).parent().find($('input'));
        if (inputEl.attr("type") == "password") {
            inputEl.attr("type", "text");
        }
        else {
            inputEl.attr("type", "password");
        }

    });

})(jQuery);

