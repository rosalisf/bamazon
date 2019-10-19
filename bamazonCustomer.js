const inquirer = require("inquirer");
const DB = require("./db.js");
const Product = require("./product.js");

function userInput(list) {
  inquirer
    .prompt([
      {
        name: "productId",
        type: "list",
        message: "Choose the product you'd like to buy:",
        //Populates the product names with the price form the database
        choices: list
      },
      {
        name: "unitNumber",
        type: "input",
        message: "How many of that product would you like to buy?"
      }
    ])

    .then(answers => {
      // This will match the answer with the product in the database
      DB.get_product_by_id(answers.productId).then(result => {
        let product = new Product(
          result[0].product_name,
          null,
          result[0].price,
          result[0].stock_quantity
        );
        // This will tell the customer/user the total price of the product(s) the customer/user wants.
        // This will also let the customer/user know if there is not enough of whatver product the customer/user wants.
        if (product.stock_quantity > answers.unitNumber) {
          DB.update_quantity(product, answers.unitNumber).then(result => {
            console.log(
              "The total price of " +
                product.product_name +
                " is " +
                product.price * answers.unitNumber +
                " USD"
            );
            DB.connection.commit();
            DB.connection.end();
          });
        } else {
          console.log("Insufficient quantity!");
        }
      });
    });
}

DB.getAllProduct()
  .then(function(result) {
    userInput(result);
  })
  .catch(function(err) {
    console.log(err);
  });

// db.get_product_by_id(1).then(function(result) {
//   console.log(result[0].id);
