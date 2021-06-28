const express = require('express');
const app = express();

app.use(express.json());

app.listen(3000, () => { console.log("Server is Listening At PORT 3000")})

app.get('/hello', (req,res) => {
    console.log("Headers:",req.headers);
    console.log('Method:',req.method);
    console.log('Response:',res)
    res.send('Received GET request!\n');
});

app.post('/hello', (req,res) => {
    console.log("Headers:",req.headers);
    console.log('Method:',req.method);
    console.log('Body:',req.body);
    console.log('Response:',res)
    res.send('Received POST request!\n');
});