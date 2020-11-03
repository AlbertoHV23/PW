const imgDiv= document.querySelector('.foto-perfil-div');
const img = document.querySelector('#photo');
const file = document.querySelector('#file');
const uploadBtn= document.querySelector('#uploadBtn');
// CAMBIAR ESTADO

const general= document.getElementById('general');
const seguridad = document.getElementById('segurida');



imgDiv.addEventListener('mouseenter',function(){
    uploadBtn.style.display ="block";
});

imgDiv.addEventListener('mouseleave',function(){
    uploadBtn.style.display ="none";
});

file.addEventListener('change',function(){
    const choosedFile = this.files[0];
    if(choosedFile){

        const reader = new FileReader();
        reader.addEventListener('load',function(){
            img.setAttribute('src',reader.result);
        });
        reader.readAsDataURL(choosedFile);
    }
});

seguridad.addEventListener('click',function () {
    document.querySelector(".datos").style.display = "none";
	document.querySelector(".contraseña-container").style.display = "flex";
    
	console.log("si funciono :)");

});

general.addEventListener('click',function () {
    document.querySelector(".datos").style.display = "flex";
	document.querySelector(".contraseña-container").style.display = "none";
    
	console.log("si funciono :)");

});

