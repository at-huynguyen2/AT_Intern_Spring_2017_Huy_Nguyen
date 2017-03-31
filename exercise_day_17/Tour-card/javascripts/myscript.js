var cart = []

var htmlCart = document.getElementById("js-number-item");
function addItem($index){  
  var isExit = 0;
  for(var i=0, length = cart.length; i<length; i++){
  	if(cart[i].index == $index)
  		isExit = 1;
  }
  if(isExit == 0){
  	var nameTours = document.getElementsByClassName('name-tour');
	  var prices = document.getElementsByClassName('price');  
	  var object = new Tour($index, nameTours[$index].innerText, prices[$index].innerText, 1);	  
	  cart.push(object);
  }else{
  	for(var i=0, length = cart.length; i<length; i++){
  	if(cart[i].index == $index)
  		cart[i].count +=1;
  	}
  }
  sessionStorage.setItem('cart', JSON.stringify(cart));
  var obj = JSON.parse(sessionStorage.cart);	
  document.getElementById("js-number-item").innerHTML = obj.length;
	

}

function Tour(index, name, price, count){
  this.index = index;
  this.name = name;
  this.price = price;
  this.count = count;
}

function showCart(){
  htmlCart.innerHTML = '';
  htmlCart.innerHTML = cart.length;
}





function showMember() {
	var members = [];
	content = document.getElementById('content');
	console.log('huy nguyen');
  var html='';
  var arrSession = [];
  var obj = JSON.parse(sessionStorage.cart);
  for(var x in obj){
	  arrSession.push(obj[x]);
	}
	console.log(arrSession[0]['name']);
  size = arrSession.length - 1;
  content.innerHTML = '';
  for (var i = 0; i <= size; i++) {
    var p = document.createElement('p');        
    p.innerHTML = members[i];
    content.appendChild(p);
  }
};