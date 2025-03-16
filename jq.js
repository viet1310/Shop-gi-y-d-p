$(".header__nav-menu-wrap").click(function () {
    $(".menu-nav").toggle();
});

$(".modal_overlay").click(function () {
    $(".main__modal").hide();
});

$(".sale-off__close").click(function () {
    $(".main__modal").hide();
});

$(".product__panel-item").click(function () {
    $(location).attr('href', 'product.html');
});

//Get the button
var mybutton = document.getElementById("myBtn-scroll");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

