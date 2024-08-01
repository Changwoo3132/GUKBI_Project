/* 메인 슬라이드 부분 */
$(document).ready(function () {
    // 상수 선언
    var slideChildWidth = $(window).width();
    const sliderChildCount = $('.slider').children().length;
    let pos = 0;

    // 슬라이드 크기 초기화 함수
    function initSliderSize() {
        slideChildWidth = $(window).width();
        const slideWidth = $(window).width() * sliderChildCount;
        $('.slider').width(slideWidth);
        $('.slider').css('left', -(pos * slideChildWidth));
        //console.log(pos);
    }

    // 다음 슬라이드로 이동하는 함수
    function moveNextSlide() {
        pos++;
        if (pos < sliderChildCount) {
            $('.slider').animate({ left: '-=' + slideChildWidth }, 500, function () {
                $('.slider').css('left', -slideChildWidth * pos);
            });
        } else {
            pos = 0;
            $('.slider').animate({ left: 0 }, 500);
        }
    }

    // 이전 슬라이드로 이동하는 함수
    function movePrevSlide() {
        pos--;
        if (pos >= 0) {
            $('.slider').animate({ left: '+=' + slideChildWidth }, 500, function () {
                $('.slider').css('left', -slideChildWidth * pos);
            });
        } else {
            pos = 0;
        }
    }

    // 자동 슬라이드 함수
    function startAutoSlide() {
        autoSlideInterval = setInterval(moveNextSlide, 5000);
    }

    // 자동 슬라이드 리셋 함수
    function resetAutoSlide() {
        clearInterval(autoSlideInterval);
        startAutoSlide();
    }

    // 슬라이드 크기 초기화
    initSliderSize();

    // 윈도우 크기가 변경될 때 슬라이드 크기 초기화
    $(window).on('resize', function () {
        initSliderSize();
    });

    // 다음 버튼 클릭 시 다음 슬라이드로 이동
    $('.next').click(moveNextSlide);

    // 이전 버튼 클릭 시 이전 슬라이드로 이동
    $('.prev').click(movePrevSlide);

    // 자동 슬라이드 시작
    startAutoSlide();
});

/* 검색 버튼이랑 카테고리 버튼 */
$(document).ready(() => {
    $('#btn').click(() => {
        if ($('#cart-bg').hasClass('toggle')) {
            $('#cart-bg').removeClass('toggle');
        }
        $('#search-bg').toggleClass('toggle');
    });

    $('#cartbtn').click(() => {
        if ($('#search-bg').hasClass('toggle')) {
            $('#search-bg').removeClass('toggle');
        }
        $('#cart-bg').toggleClass('toggle');
    });
});