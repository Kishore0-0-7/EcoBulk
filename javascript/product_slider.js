document.addEventListener("DOMContentLoaded", () => {
  const slider = document.getElementById("slider");
  const slideLeft = document.getElementById("slide-left");
  const slideRight = document.getElementById("slide-right");

  // Calculate scroll amount based on viewport width
  const getScrollAmount = () => {
    return Math.min(slider.offsetWidth, 1000);
  };

  slideLeft.addEventListener("click", () => {
    slider.scrollBy({
      left: -getScrollAmount(),
      behavior: "smooth",
    });
  });

  slideRight.addEventListener("click", () => {
    slider.scrollBy({
      left: getScrollAmount(),
      behavior: "smooth",
    });
  });

  // Show/hide arrows based on scroll position
  const updateArrowVisibility = () => {
    const isAtStart = slider.scrollLeft === 0;
    const isAtEnd =
      slider.scrollLeft + slider.offsetWidth >= slider.scrollWidth;

    slideLeft.style.opacity = isAtStart ? "0.5" : "1";
    slideRight.style.opacity = isAtEnd ? "0.5" : "1";

    slideLeft.style.cursor = isAtStart ? "not-allowed" : "pointer";
    slideRight.style.cursor = isAtEnd ? "not-allowed" : "pointer";
  };

  slider.addEventListener("scroll", updateArrowVisibility);
  window.addEventListener("resize", updateArrowVisibility);

  // Initial arrow visibility check
  updateArrowVisibility();
});

let thumbnails = document.getElementsByClassName("thumbnail");
let slider = document.getElementById("slider");

//AUTO PLAY THE SLIDER
function autoPlay() {
  if (slider.scrollLeft > maxScrollLeft - 1) {
    slider.scrollLeft -= maxScrollLeft;
  } else {
    slider.scrollLeft += 1;
  }
}
let play = setInterval(autoPlay, 50);

// PAUSE THE SLIDE ON HOVER
for (var i = 0; i < thumbnails.length; i++) {
  thumbnails[i].addEventListener("mouseover", function () {
    clearInterval(play);
  });

  thumbnails[i].addEventListener("mouseout", function () {
    return (play = setInterval(autoPlay, 50));
  });
}
