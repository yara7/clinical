// function getselectedvalue(){
//     var why = document.getElementById("change").innerHTML === "" ;
//     var selectedvalue = document.getElementById("RepairPM").value;
//     var parent = document.getElementById("change")

//     if(selectedvalue === "PM" ){
//         if (why){

//         var select = document.createElement("select");
//         var option = document.createElement("option");
//         var option2 = document.createElement("option");
//         var option3 = document.createElement("option");
//         var label = document.createElement("label");
//         label.id = "status"
//         select.id = "status"
//         select.name = "frequency"
//         label.textContent = "PM frequency"
//         select.className = "form-destination"
//         option.textContent = "yearly"
//         option2.textContent = "Monthly"
//         option3.textContent = "Weekly"
//         select.add(option)
//         select.add(option2)
//         select.add(option3)
//         parent.appendChild(label)
//         parent.appendChild(select)} else{
//             document.getElementById("change").innerHTML = "" ;
//             getselectedvalue()


//         }

//     }
//     else if(selectedvalue === "Repair" ){
//         if(why){
//         var input = document.createElement("input");
//         var label = document.createElement("label");
//         label.textContent = "repair cost"
//         input.type = "text";
//         input.className = "form-destination"
//         input.name = "cost"
//         parent.appendChild(label)
//         parent.appendChild(input)}else{
//             document.getElementById("change").innerHTML = "" ;
//             getselectedvalue()

//         }

//     }
//     else if(selectedvalue === "" ){
//         document.getElementById("change").innerHTML = "" ;

//     }
// }


// // // Get DOM Elements
// const modal = document.querySelector('.modal');
// // const modalBtn = document.querySelector('.submit');
// const closeBtn = document.querySelector('.close');

// // // Events
// // modalBtn.addEventListener('click', openModal);
// closeBtn.addEventListener('click', closeModal);
// window.addEventListener('click', outsideClick);

// // Open
// // function openModal() {
// //   modal.style.display = 'block';
// // }

// // Close
// function closeModal() {
//   modal.style.display = 'none';
// }

// // Close If Outside Click
// function outsideClick(e) {
//   if (e.target == modal) {
//     modal.style.display = 'none';
//   }
// }


// var form = document.querySelector("form");
if(window.history.replaceState){
    window.history.replaceState(null , null, window.location.href);
}
// form.onsubmit = openModal();
