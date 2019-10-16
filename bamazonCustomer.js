const inquirer = require("inquirer");
const DB = require("./db.js");
const Product = require("./product.js");

function userInput() {
  inquirer
    .prompt([
      {
        name: "productId",
        type: "input",
        message: "What is the ID of the product you'd like to buy?"
      },
      {
        name: "unitNumber",
        type: "input",
        message: "How many of that product would you like to buy?"
      }
    ])

    // Set response data as a variable and retrieve it as JSON

    .then(answers => {
      DB.get_product_by_id(answers.productId).then(result => {
        let product = new Product(
          result[0].product_name,
          null,
          result[0].price,
          result[0].stock_quantity
        );
        if (product.stock_quantity > answers.unitNumber) {
          DB.update_quantity(product, answers.unitNumber).then(result => {
            console.log(product.price * answers.unitNumber);
            DB.connection.commit();
            DB.connection.end();
          });
        } else {
          console.log("Insufficient quantity!");
        }
      });
    });
}
userInput();

// db.get_product_by_id(1).then(function(result) {
//   console.log(result[0].id);
