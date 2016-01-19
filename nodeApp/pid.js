var sleep = require('sleep'),
    http = require('http');
    pid = require('./pid2.js'),
    wpi = require('wiring-pi'),
    timeframe = 1000;
wpi.wiringPiSetup();

setInterval(pid.loop, timeframe);

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
  console.log('send http');
}).listen(3000);