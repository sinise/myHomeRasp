var fs = require('fs'),
    PID = require('pid-controller');
    
var temperture = 20,
    tempertureSetpoint = 25;

var Kp = 10,
    Ki = 1,
    Kd = 0;

var ctr = new PID(temperture, tempertureSetpoint, Kp, Ki, Kd, 'direct'),
    timeframe = 1000;

ctr.setSampleTime(timeframe);
ctr.setOutputLimits(100, timeframe);
ctr.setMode('auto');
var calculatePid = function(temp) {
    if (typeof calculatePid.counter == 'undefined') {
        calculatePid.counter = 0;
    }
    ctr.setInput(temp);
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

exports.loop = function(){getTemp('/sys/bus/w1/devices/28-0315a713faff/w1_slave', calculatePid)}
