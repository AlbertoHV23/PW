const realFileBtn = document.getElementById("real-file");
const customBtn = document.getElementById("custom-button");
const customTxt = document.getElementById("custom-text");


const realFileBtn2 = document.getElementById("real-fileTwo");
const customBtn2 = document.getElementById("custom-buttonTwo");
const customTxt2 = document.getElementById("custom-textTwo");


const realFileBtn3 = document.getElementById("real-fileThree");
const customBtn3= document.getElementById("custom-buttonThree");
const customTxt3 = document.getElementById("custom-textThree");

customBtn.addEventListener("click", function() {
  realFileBtn.click();
});

customBtn2.addEventListener("click", function() {
    realFileBtn2.click();
  });

  customBtn3.addEventListener("click", function() {
    realFileBtn3.click();
  });

realFileBtn.addEventListener("change", function() {
  if (realFileBtn.value) {
    customTxt.innerHTML = realFileBtn.value.match(
      /[\/\\]([\w\d\s\.\-\(\)]+)$/
    )[1];
  } else {
    customTxt.innerHTML = "No file chosen, yet.";
  }
});


realFileBtn2.addEventListener("change", function() {
    if (realFileBtn2.value) {
      customTxt2.innerHTML = realFileBtn2.value.match(
        /[\/\\]([\w\d\s\.\-\(\)]+)$/
      )[1];
    } else {
      customTxt2.innerHTML = "No file chosen, yet.";
    }
  });

  realFileBtn3.addEventListener("change", function() {
    if (realFileBtn3.value) {
      customTxt3.innerHTML = realFileBtn3.value.match(
        /[\/\\]([\w\d\s\.\-\(\)]+)$/
      )[1];
    } else {
      customTxt3.innerHTML = "No file chosen, yet.";
    }
  });