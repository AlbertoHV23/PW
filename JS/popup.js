const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const Abrir= document.getElementById('logear');
const Cerrar = document.getElementById('Tachita');
const pop = document.getElementById('popupas');
const Mostrarbuscador = document.getElementById('serch');
const demostar = document.getElementById('finde');

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

Mostrarbuscador.addEventListener('mouseover',function () {
	console.log("muestra :)");
	document.querySelector(".form-inline").style.display = "flex";
	document.querySelector(".fa-search").style.display = "none";


});

demostar.addEventListener('mouseout',function () {
	console.log("no muestra :)");
	document.querySelector(".fa-search").style.display = "flex";
	document.querySelector(".form-inline").style.display = "none";


});