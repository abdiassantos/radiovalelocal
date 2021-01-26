function toogleMenu() {
  if ($(".sidebar").hasClass("flex")) {
    $(".sidebar").removeClass("flex");

    $(".sidebar").addClass("hidden");

    $(".overlaySidebar").addClass("hidden");
  } else {
    $(".sidebar").addClass("flex");
    $(".sidebar").removeClass("hidden");
    $(".overlaySidebar").removeClass("hidden");
  }
}

function toogleNav() {
  if ($(".navMenu").hasClass("lg:flex")) {
    $(".navMenu").removeClass("flex");
    $(".navMenu").removeClass("lg:flex");
    $(".navMenu").removeClass("xl:flex");
    $(".navMenu").addClass("hidden");

    $(".searchField").removeClass("hidden");
    $(".searchHidden").addClass("hidden");
  } else {
    $(".searchHidden").removeClass("hidden");
    $(".navMenu").addClass("flex");
    $(".navMenu").addClass("lg:flex");
    $(".navMenu").addClass("xl:flex");
    $(".navMenu").removeClass("hidden");
    $(".searchField").addClass("hidden");
  }
}

$(document).ready(function() {
  $(".overlaySidebar").on("click", function(e) {
    toogleMenu();
  });

  $(".menuButton").on("click", function(e) {
    e.preventDefault();
    toogleMenu();
  });

  $(".searchIcon").on("click", function(e) {
    e.preventDefault();
    toogleNav();
  });
});

window.addEventListener("load", function() {
  const target = document.querySelector(".glider");
  if (target) {
    let glider = new Glider(target, {
      slidesToShow: 1,
      dots: "#dots",
      draggable: true,
      rewind: true,
      arrows: {
        prev: "#glider-prev",
        next: "#glider-next"
      }
    });
  }

  // glider.setOption({

  // });
});

window.addEventListener("load", function() {
  const target = document.querySelector(".gliderBarNews");
  if (target) {
    let glider = new Glider(target, {
      slidesToShow: 1,
      dots: "#dots",
      draggable: true,
      rewind: true,
      arrows: {
        prev: "#glider-prev",
        next: "#glider-next"
      }
    });
  }
});

window.addEventListener("load", function() {
  const target = document.querySelector(".gliderArticles");
  if (target) {
    let glider = new Glider(target, {
      slidesToShow: 5,
      slidesToScroll: 5,
      dots: "#dots",
      draggable: true,
      rewind: true,
      arrows: {
        prev: "#glider-prev-articles",
        next: "#glider-next-articles"
      }
    });
  }
});

window.addEventListener("load", function() {
  const target = document.querySelector(".gliderBanner");
  if (target) {
    let glider = new Glider(target, {
      slidesToShow: 1,
      slidesToScroll: 1,
      dots: "#dotsBanner",
      draggable: true,
      rewind: true,
      arrows: {
        prev: "#glider-prev-banners",
        next: "#glider-next-banners"
      }
    });
  }
});

window.addEventListener("load", function() {
  const target = document.querySelector("#gliderBannerSides");
  if (target) {
    let glider = new Glider(target, {
      slidesToShow: 1,
      slidesToScroll: 1,
      dots: "#dotsBannerSide",
      draggable: true,
      rewind: true,
      // arrows: {
      //   prev: "#glider-prev-banners-side",
      //   next: "#glider-next-banners-side"
      // }
    });
  }
});
