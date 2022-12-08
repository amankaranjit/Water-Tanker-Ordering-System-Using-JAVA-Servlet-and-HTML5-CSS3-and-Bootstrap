let name = true;

function fullNameValidate(){
    let fullName = document.getElementById('fullName').value;
    if(fullName === ""){
        displayMsg("Please enter your full name.", "fullNameMsg", "red");
        name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }
    }
    else if(!fullName.match(/^([a-z A-Z])+$/)){
        displayMsg("Numerics values not accepted", "fullNameMsg","red");
         name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }
    }
    else if(fullName.length < 3){
        displayMsg("Name must be more than two characters", "fullNameMsg", "red");
             name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        };
        }
    else{
        displayMsg("", "fullNameMsg", "green");
        name = true;
        document.getElementById('btn').disabled = false;
    }
}

function emailValidate(){
    let email = document.getElementById('email').value;
    if(email === ""){
        displayMsg("Email is required.", "emailMsg", "red");
         name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }
    }
    else if(!email.match( /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)){
        displayMsg("Invalid email", "emailMsg", "red");
          name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }

    }
    else{
        displayMsg("", "emailMsg", "green");
        name = true;
        document.getElementById('btn').disabled = false;
    }
}

function phoneValidate(){
    let phone = document.getElementById('phone').value;
    if(phone === ""){
        displayMsg("Contact number is required", "phoneMsg", "red");
          name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        };

    }
    else if(phone.length < 10 ){
        displayMsg("Contact number must be of 10 digits", "phoneMsg", "red");
        name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }
        }
    else if(!phone.match(/^((98)|(97))[0-9]{8}$/)){
        displayMsg("Phone number not valid", "phoneMsg", "red");
        name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }
    }
    else{
        displayMsg("", "phoneMsg", "green");
        name = true;
        document.getElementById("btn").disabled = false;
    }
}
function addressValidate(){
    let address = document.getElementById('address').value;
    if(address === ""){
        displayMsg("Address is required", "addressMsg", "red");
         name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }
    }
   
    else{
        displayMsg("", "addressMsg", "green");
        name = true;
        document.getElementById('btn').disabled = false;
    }
}
function passValidate(){
    let pass = document.getElementById('pass').value;
    if(pass === ""){
        displayMsg("Password is required", "passMsg", "red");
        name = false;
        if(!name ){
            document.getElementById("btn").disabled = true;
        }
    }
    
    else{
        displayMsg("", "passMsg", "green");
        name = true;
        document.getElementById('btn').disabled = false;
    }
}
function pass2Validate(){
    let pass = document.getElementById('pass').value;
    let pass2 = document.getElementById('pass2').value;
    if(pass !== pass2){
        displayMsg("Password not matched", "pass2Msg", "red");
        name = false;
        if(!name){
            document.getElementById("btn").disabled = true;
        }
    }
    
    else{
        displayMsg("", "pass2Msg", "green");
        name = true;
       document.getElementById('btn').disabled = false;
    }
}

function displayMsg(msg, id, colorVal){
    document.getElementById(id).innerHTML=msg;
    document.getElementById(id).style.color = colorVal;
    
}
