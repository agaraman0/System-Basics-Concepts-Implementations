const express = require('express');
const app = express();

app.use(express.json());

app.listen(3000, () => { console.log("Server is Listening At PORT 3000")})

app.get('/hello', (req,res) => {
    console.log("Headers:",req.headers);
    res.send('Hello, World!!!\n');
});