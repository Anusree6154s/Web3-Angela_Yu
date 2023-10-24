import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
  // This event listener is triggered when the web page has finished loading.
  // It fetches the current balance from the 'dbank' and updates the displayed value.
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100);
});

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault(); // Prevent the default form submission behavior.
  
  const button = event.target.querySelector("#submit-btn");

  // Get the input and withdrawal amounts from the form's input fields.
  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  // Check if there is an input amount; if so, top up the 'dbank' account.
  if (document.getElementById("input-amount").value.length != 0) {
    await dbank.topUp(inputAmount);
  }

  // Check if there is a withdrawal amount; if so, perform a withdrawal from the 'dbank' account.
  if (document.getElementById("withdrawal-amount").value.length != 0) {
    await dbank.withdrawal(outputAmount);
  }

  // Compound the interest for the 'dbank' account.
  await dbank.compound();
  
  // Fetch and display the updated balance from the 'dbank'.
  const currentAmount = await dbank.checkBalance();
  console.log(currentAmount); // Log the current balance for debugging.
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  // Clear the input fields and enable the submit button.
  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  button.removeAttribute("disabled");
});
