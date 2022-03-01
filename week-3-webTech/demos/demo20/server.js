http.createServer((req,resp)=>{
    const url=req.url;
    const method=req.method;
    // //Below code explains what is url and method in request
    // resp.setHeader('Content-Type','text/html')
    // resp.write("<br/>req.url: "+url);
    // resp.write("<br/>req.method: "+method);
    // resp.end();
    if(method==='GET'){
            
        switch(url){
            case '/':
            case '/index.html':
                myfunction(__dirname+'/index.html','text/html',resp);
                break;
            case '/aboutus.html':
                myfunction(__dirname+'/aboutus.html','text/html',resp);
                break;            
            case '/contactus.html':
                
            myfunction(__dirname+'/contactus.html','text/html',resp);
                break;
            case '/signup.html':
                myfunction(__dirname+'/signup.html','text/html',resp);
                break;
            case '/signin.html':    
            myfunction(__dirname+'/signin.html','text/html',resp);
                break;
            case '/style.css':
                myfunction(__dirname+'/css/style.css','text/css',resp);
                break;
            default:
                    resp.write('Content not found');
                    resp.end();
                break;
        }
    }else {
        switch(url){
            case '/welcome':    
            myfunction(__dirname+'/welcome.html','text/html',resp);
                break;
            default:
                    resp.write('Content not found');
                    resp.end();
                break;
        }
    }


}).listen(port,()=>{console.log(serverMessage);});