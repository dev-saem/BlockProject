let imgInput = window.document.getElementById("imgInput");
let img = window.document.body.querySelector(":scope > img");
let imgCount = 0;
imgInput.addEventListener("click", () => {
  if (imgCount === 1) {
    img.classList.add("visible");
    imgCount = 0;
  } else {
    img.classList.remove("visible");
    imgCount = 1;
  }
});
