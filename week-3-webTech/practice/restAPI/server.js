const express = require('express')
const path = require('path');
const server = express();
const port = 3000;

server.use(express.urlencoded({extended:true}));
server.use(express.json());
server.set('views', path.join(__dirname,'views'));
server.set('view engine', 'ejs');

const foodItems = [
    {
        fid:"F101",
        fname:"Masala Dosa",
        unitPrice:"70"
    },
    {
        fid:"F102",
        fname:"Cheese Sandwich",
        unitPrice:"50"
    },
    {
        fid:"F103",
        fname:"Paneer Chilli",
        unitPrice:"120"
    },
]

server.get('/food', (req,res) => {
    res.render('foods/index', {foodItems})
});

server.get('food/new', (req,res) => {
    res.render('foods/new');
})

server.listen(port, () =>{
    console.log(`listening on port: ${port}`);
});