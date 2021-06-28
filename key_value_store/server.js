const database = require('./database')
const express = require('express')
const redis = require('redis').createClient();

const app = express()
const cache = {}

app.get('/nocache/index.html', (req,res) => {
    database.get('index.html', page => {
        res.send(page);
    });
});

app.get('/withcache/index.html', (req,res) => {

    redis.get('index.html',(err,redisRes)=> {
        if(redisRes) {
            res.send(redisRes)
            return;
        }

        database.get('index.html',page => {
            redis.set('index.html',page,'EX',10);
            res.send(page)
        });
    });

    
    
    // if ('index.html' in cache) {
    //     res.send(cache['index.html'])
    //     return;
    // }
    
    // database.get('index.html', page => {
    //     cache['index.html'] = page
    //     res.send(page);
    // });
});

app.listen(3001, function() {
    console.log("Server Is Listening At Port 3001")
})