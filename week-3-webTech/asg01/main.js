//create object to store Product details such as pid,pname,unitprice

//using new keyword

const product = new Object();
product.pid = "P102";
product.pname = "xyz";
product.unitPrice = 230;
product.details = () => {
    return product.pid + " " + product.pname + " " + product.unitPrice;
}
console.log(product.details());

// object creation using constructor
function Product(pid, pname, unitPrice) {
    this.pid = pid;
    this.pname = pname;
    this.unitPrice = unitPrice;
    this.details = () => { return this.pid + " " + this.pname + " " + this.unitPrice};
}
const p1 = new Product("P898", "goPro", 23000);
console.log(p1.details());


//using json
const p2 = {"pid": "P102",
            "pname": "Ipad",
            "unitPrice": 50000,
            "details": function(){ return this.pid + " " + this.pname + " " + this.unitPrice}
            };

console.log(p2.details());