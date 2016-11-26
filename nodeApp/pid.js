var sleep = require('sleep'),
    http = require('http');
    pid = require('./pid2.js'),
    wpi = require('wiring-pi'),
    timeframe = 2000;
wpi.setup('wpi');

var pin = 0;
wpi.pinMode(0,wpi.OUTPUT);
var value = 0;
setInterval(function() {
console.log(value)
  wpi.digitalWrite(pin, value);
  value = +!value;
}, 5000);
setInterval(pid.loop, timeframe);

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
  console.log('send http');
}).listen(3000);
