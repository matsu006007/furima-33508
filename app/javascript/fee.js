function fee() {
  const ItemPrice = document.getElementById("item-price");
  this.addEventListener('input', ()=>{
    const InputValue = ItemPrice.value
    const TaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit")
    TaxPrice.innerHTML = Math.floor(InputValue * 0.1).toLocaleString();
    Profit.innerHTML = Math.floor(InputValue - (InputValue * 0.1)).toLocaleString();
  });
}

window.addEventListener('load', fee)