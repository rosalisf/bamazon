const mysql = require("mysql");

function DB() {
  self = this;
  this.connection = mysql.createConnection({
    host: "localhost",

    // Your port; if not 3306
    port: 8889,

    // Your username
    user: "root",

    // Your password
    password: "root",
    database: "bamazon"
  });
  this.query = function(query, parameters) {
    return new Promise(function(resolve, reject) {
      self.connection.query(query, parameters, function(err, result) {
        if (err) {
          reject(new Error(err));
        } else {
          resolve(result);
        }
      });
    });
  };
  this.get_product_by_id = function(id) {
    return this.query("SELECT * FROM products WHERE id=?", [id]);
  };
  this.update_quantity = function(product, units) {
    product.stock_quantity -= 1;
    return this.query(
      "UPDATE products SET stock_quantity=stock_quantity-? WHERE product_name=?",
      [units, product.product_name]
    );
  };
}

module.exports = new DB();
