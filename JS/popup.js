const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const Abrir= document.getElementById('logear');
const Cerrar = document.getElementById('Tachita');
const pop = document.getElementById('popupas');
const like = document.getElementById('liked');

var activo = new Boolean(false);



signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
	console.log("si funciono :)");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
	console.log("si funciono :)");
});

Abrir.addEventListener('click',function () {
	document.querySelector(".popup").style.display = "flex";
	console.log("si funciono :)");

});

Cerrar.addEventListener('click',function () {
	document.querySelector(".popup").style.display = "none";
	console.log("si funciono :)");

});

like.addEventListener("click", function () {
  if (activo == false) {
    document.querySelector(".fa-heart").style.color = "red";
    activo = true;
  } else {
    document.querySelector(".fa-heart").style.color = "white";
    activo = false;
  }
});




