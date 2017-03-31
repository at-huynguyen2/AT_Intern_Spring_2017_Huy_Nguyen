
  var $totalMoney = 0;
  window.onload = function showMember() {
    content = document.getElementById('content');
    var html='';    
    var arrSession = [];
    var obj = JSON.parse(sessionStorage.cart);  
    for(var x in obj){
      arrSession.push(obj[x]);
    } 
    size = arrSession.length;
    for (var i = 0; i <size; i++) {
      index = arrSession[i]['index']
      name = arrSession[i]['name'];
      price = arrSession[i]['price'];     
      count = arrSession[i]['count'];
      var tr = document.createElement('tr');
      var tdIndex = document.createElement('td');
      tdIndex.innerHTML = index;
      var tdName = document.createElement('td');
      tdName.innerHTML = name;
      var tdPrice = document.createElement('td');
      tdPrice.innerHTML = price;
      var tdCount = document.createElement('td');
      var inputCount = document.createElement('input');
      inputCount.type = "number";
      inputCount.value = count;
      inputCount.setAttribute("class", "count");
      inputCount.min = 1;     
      // inputCount.addEventListener('change', function(index){
      //  moneyChange = calculatorMoney(price, this.value);
      //  listMoney = document.getElementById('js-td-money-'+index);  
      //  console.log(listMoney);
      //  listMoney.innerHTML = moneyChange;
      // });
      tdCount.appendChild(inputCount);
      var tdMoney = document.createElement('td');   
      money = calculatorMoney(price, count);
      tdMoney.innerHTML = money;
      tdMoney.setAttribute('id', 'js-td-money-'+index);
      tr.appendChild(tdIndex);
      tr.appendChild(tdName);
      tr.appendChild(tdPrice);
      tr.appendChild(tdCount);
      tr.appendChild(tdMoney);
      content.appendChild(tr);
    }
    tdEnd = document.getElementById('js-total-money');
    tdEnd.innerHTML = addCommas($totalMoney);
  };

  function calculatorMoney(price, count){
    money = replaceDotMoney(price)*count; 
    $totalMoney += +money;  
    return addCommas(money);
  };
  function replaceDotMoney(price){
    return price.replace(/[.]/g,'');
  };
  function addCommas(nStr) {
      nStr += '';
      var x = nStr.split('.');
      var x1 = x[0];
      var x2 = x.length > 1 ? '.' + x[1] : '';
      var rgx = /(\d+)(\d{3})/;
      while (rgx.test(x1)) {
          x1 = x1.replace(rgx, '$1' + '.' + '$2');
      }
      return x1 + x2;
  };
  function removeSessionStorage(){
    sessionStorage.clear();
    location.href = "index.html";
  }