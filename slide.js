const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const Abrir= document.getElementById('abre');
const Cerrar = document.getElementById('Tachita');
const pop = document.getElementById('popup');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

Abrir.addEventListener('click', () => {
	pop.classList.add('active');
});

Cerrar.addEventListener('click', () => {
	pop.classList.remove('active');
});