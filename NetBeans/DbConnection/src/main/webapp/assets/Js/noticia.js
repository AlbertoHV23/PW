const likebtn = document.querySelector('#like');
const dislikebtn = document.querySelector('#dislike');
const input1 = document.querySelector('#input1');
const input2 = document.querySelector('#input2');

likebtn.addEventListener('click',()=>{
    input1.value = parseInt(input1.value)+1;
    input1.style.color = "#12ff00";
});

dislikebtn.addEventListener('click',()=>{
    input2.value = parseInt(input2.value)+1;
    input2.style.color = "#ff0000";
});