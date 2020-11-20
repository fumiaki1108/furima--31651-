function tax() {
  const priceNum = document.getElementById("item-price");
  priceNum.addEventListener('keyup', () => {
    const price = priceNum.value;
    const tex = Math.round(price / 10);
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    const profit = price - tex;
    taxArea.innerHTML = tex;
    profitArea.innerHTML = profit;
  });
};

window.addEventListener('load', tax);

   console.log
