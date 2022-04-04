let display = document.getElementById(`display`);

let operatorBox = null;


function clickbutton(number) {
  let numberValue = number.innerText;
  
  switch (numberValue) {
    case `C`:
      display.innerText = `0`;
      operatorBox = null;
      break;
    
    case `0`:
    case `1`:
    case `2`:
    case `3`:
    case `4`:
    case `5`:
    case `6`:
    case `7`:
    case `8`:
    case `9`:
      if (display.innerText == `0`) {
        display.innerText = numberValue;
      } else {
        display.innerText += numberValue;
      }
      break;
    
    case `=`:
      display.innerText = eval(display.innerText);
      operatorBox = null;
      break;
  }
};

function operators(ope) {
  let opeValue = ope.innerText;
  
  if (operatorBox !== null) { return; }
  
  if (display.innerText.slice(-1) == opeValue) {
    return;
  } else {
    display.innerText += opeValue;
    operatorBox = opeValue;
    console.log(operatorBox);
  }
};
