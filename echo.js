'use strict';

const http = require('http')
const querystring = require('querystring')
const payloadbase64 = process.argv[2];
var buf = new Buffer(payloadbase64, 'base64');


var postData = querystring.stringify({
  'msg' : buf.toString()
});

var options = {
  hostname: process.env.ECHO_SERVER_HOST || 'localhost',
  port: 4000,
  path: '/',
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Content-Length': Buffer.byteLength(postData)
  }
};

var req = http.request(options, (res) => {
  let str ='';
  res.setEncoding('utf8');
  res.on('data', (chunk) => {
    str += chunk;
  });
  res.on('end', () => {

    let obj = JSON.parse(str)
    console.log(`${obj.method} ${obj.url} ${obj.body}`)
    process.exit(0);
  });
});

req.on('error', (e) => {
  console.log(`problem with request: ${e.message}`);
  process.exit(1);
});

// write data to request body
req.write(postData);
req.end();

/* Task was successful */