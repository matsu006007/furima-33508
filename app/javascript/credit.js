const credit = () => {
Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
const form = document.getElementById("buyer-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("buyer-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy_info[number]"),
      cvc: formData.get("buy_info[cvc]"),
      exp_month: formData.get("buy_info[exp-month]"),
      exp_year: `20${formData.get("buy_info[exp-year]")}`,
    };

    
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200 ) {
        const token = response.id;
        const renderDom = document.getElementById("buyer-form");
        const tokenObj = `<input value=${token} name = 'token' type="hidden" >`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        
        document.getElementById("buyer-form").submit();
    });
  });
}

window.addEventListener('load', credit)