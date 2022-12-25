const express = require('express');

const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.urlencoded({extended: false}));


app.post('/user',(req,res,next) => {
    res.send('<h1> User : ' + req.body.username + '</h1>');
}); 


app.get('/users',(req, res, next) => {
    res.send('<form action="/user" method="POST"><input type="text" name="username"><button type="submit">Create User</button></input></form>');
});

app.listen(5000);





// app.use((req,res,next)=> {
//     let body = '';

//     req.on('end',() => {
//         const userName = body.split('=')[1];
//         if (userName) {
//             req.body = {name: userName};
//         }
//         next();
//     });
//     req.on('data',chunk => {
//         body += chunk;
//     });
// });



// const { chmodSync } = require('fs');
// const http = require('http');

// const server = http.createServer((req,res) =>{
//     console.log('INCOMING REQUEST');
//     console.log(req.method, req.url);

//     if (req.method === "POST") {
//         let body = '';
//         req.on('end',()=>{
//             const userName = body.split('=')[1];

//             console.log(body);
//             res.end('<h1>'+ userName + '</h1>')
//         });
//         req.on('data', (chunk) => {
//             body += chunk;
//         });
//     } else {
//         res.setHeader('Content-Type','text/html');
//         res.end('<form method="POST"><input type="text" name="username"><button type="submit">Create User</button></input></form>');
//     }
// });

// server.listen(5000);


// const fs = require('fs');

// const userName = 'Avirup';

// fs.writeFile('user-data.txt','Name: ' + userName,(err) => {
//     if(err){
//         console.log(err);
//         return;
//     }
//     console.log('wrote file');
// });