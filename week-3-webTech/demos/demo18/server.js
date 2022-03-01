const http=require('http');
const port=3000;
//step2: Server must be created
//step2.2: what server will do when client sends the request
function onRequest(req,resp){
    resp.write("Welcome!");
    resp.end();
}
const server=http.createServer(onRequest);
//Step3: Server must be listening to a particular port
function onServerStart(){
    console.log(`http://localhost:${port} started`);
}
server.listen(port,onServerStart);