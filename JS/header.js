const Mostrarbuscador = document.getElementById("serch");
const demostar = document.getElementById("finde");
var activo = new Boolean(false);
const AbrirSliderMenu = document.getElementById("barras");

Mostrarbuscador.addEventListener("mouseover", function () {
  console.log("muestra :)");
  document.querySelector(".form-inline").style.display = "flex";
  document.querySelector(".fa-search").style.display = "none";
});

demostar.addEventListener("mouseout", function () {
  console.log("no muestra :)");
  document.querySelector(".fa-search").style.display = "flex";
  document.querySelector(".form-inline").style.display = "none";
});

AbrirSliderMenu.addEventListener("click", function () {
  console.log(activo);

  if (activo == false) {
    document.querySelector(".sliderbar").style.visibility = "visible";
    activo = true;
  } else {
    document.querySelector(".sliderbar").style.visibility = "hidden";
    activo = false;
  }
});

function activoOno() {}
