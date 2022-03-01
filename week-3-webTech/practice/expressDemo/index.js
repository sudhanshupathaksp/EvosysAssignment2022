const express = require('express');
const app = express();
const port = 3000;

app.use((req,res) => {
    console.log("we got a new request!!!")
    //res.send("we got your request");
    // res.send({color:"red"});
     res.send('<h1>welcome</h1>')
})
// app.get('/', (req,res) => {

// })

app.listen(port, () => {
    console.log(`listening on port: ${port}`)
})