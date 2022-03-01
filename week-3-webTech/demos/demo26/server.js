// import express from 'express';
// import path from 'path';
// const port = 8080;
// const message="http://localhost:4200/ website is hosted";
// const __dirname=path.resolve(path.dirname(''));
// const server=express();
// server.get('/',(req,resp)=>{
//     resp.setHeader('Content-Type','text/html');
//     resp.sendFile(__dirname+'/index.html');
// });
// server.get('/style.css',(req,resp)=>{
//     resp.setHeader('Content-Type','text/css');
//     resp.sendFile(__dirname+'/css/style.css');
// });
// server.get('/main.js',(req,resp)=>{
//     resp.setHeader('Content-Type','application/javascript');
//     resp.sendFile(__dirname+'/js/main.js');
// });

// server.listen(port,()=>{console.log(message);})

import express from 'express';
import path from 'path';
const port = 8080;
const message = "http://localhost:8080/ website is hosted";
const __dirname = path.resolve(path.dirname(''));
const server = express();
server.get('/', (req,res) => {
    res.setHeader('Content-Type', 'text/html');
    res.sendFile(__dirname+'/index.html');
});
server.get('/style.css', (req,res) => {
    res.setHeader('Content-Type','text/css');
    res.sendFile(__dirname+'/css/style.css');
});
server.get('/main.js',(req,res) => {
    res.setHeader('Content-Type','text/javascript');
    res.sendFile(__dirname+'/js/main.js');
})

server.listen(port,() => {console.log(message)});