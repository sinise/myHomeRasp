var fs = require('fs'),
    sleep = require('sleep'),
    http = require('http'),
    PID = require('pid-controller');

var temperture = 20,
    tempertureSetpoint = 23;

var Kp = 50,
    Ki = 1,
    Kd = 0;

var ctr = new PID(temperture, tempertureSetpoint, Kp, Ki, Kd, 'direct'),
    timeframe = 1000;

ctr.setSampleTime(timeframe);
ctr.setOutputLimits(0, timeframe);
ctr.setMode('auto');
var calculatePid = function(temp) {
    if (typeof calculatePid.counter == 'undefined') {
        calculatePid.counter = 0;
    }
    ctr.setInput(temperture);
    ctr.setMode(1);
    ctr.compute();
    console.log("Output : " + ctr.getOutput() + " ; Temp : " + ctr.getInput() + "°c");
};

var getTemp = function(path, cb){
  fs.readFile(path, 'utf8', function (err, data) {
    if (err){
      console.log(err);
      throw err;
    }
    var temp = data.match(/YES|[0-9]{5}/g)      
    var tempObj = {temp: temp[1]/1000, err: temp[0]};
    temperture = tempObj.temp;
    cb(tempObj.temp);
  });
}

function loop(){getTemp('./w1_slave', calculatePid)}
setInterval(loop, timeframe);

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
  console.log('send http');
//  getTemp('./w1_slave',function(temp){
 //   console.log('im callback' + temp.temp)

  //})
}).listen(3000);