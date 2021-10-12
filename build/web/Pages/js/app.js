//var loadFile = function(event) {
//    var reader = new FileReader();
//    reader.onload = function(){
//      var output = document.getElementById('output');
//      output.src = reader.result;
//    };
//    const formdata = new FormData();
//    formdata.append("image", event.target.files[0]);
//    fetch("https://api.imgur.com/3/image/", {
//        method: "post",
//        headers: {
//            Authorization: "Client-ID 576f1ec129486f3"
//        },
//        body: formdata
//    }).then(data => data.json()).then(data => {
//        output.src = data.data.link;
//        url.innerText = data.data.link;
//    });
//    reader.readAsDataURL(event.target.files[0]);
//};


console.clear();

const form = document.querySelector('form');
form.addEventListener('submit', event => {
  event.preventDefault();
  
  const fileInput = event.target.querySelector('input');
  const imageFile = fileInput.files[0];
  
  const formData = new FormData();
  formData.append('image', imageFile);
//  formData.append('album', 'EVGILvAjGfArJFI');
  
  fetch('https://api.imgur.com/3/image', {
    //mode: 'cors',
    method: 'POST',
    headers: {
      Authorization: 'Client-ID 576f1ec129486f3',
    },
    body: formData
  }).then(response => {
    console.log(response);
    if (response.ok) {
      alert('Image uploaded to album');       
    }
  }).catch(error => {
    console.error(error);
    //alert('Upload failed: ' + error);
  });
});