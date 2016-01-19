var liquidPID = require('liquid-pid'),
    actualP = 0,
    pidController,
    fs = require('fs'),
    sleep = require('sleep'),
    http = require('http');

pidController = new liquidPID({
  temp: {
    ref: 67         // Point temperature                                       
  },
  Pmax: 1000,       // Max power (output),
  
  // Tune the PID Controller
  Kp: 25,           // PID: Kp
  Ki: 1000,         // PID: Ki
  Kd: 9             // PID: Kd
});





var getTemp = function(path, cb){
  fs.readFile(path, 'utf8', function (err, data) {
    if (err){
      console.log(err);
      throw err;
    }
    var temp = data.match(/YES|[0-9]{5}/g)      
    var tempObj = {temp: temp[1]/1000, err: temp[0]};
      console.log(tempObj.temp);
    cb(tempObj);
  });
  

}




actualP = pidController.calculate(69.0);    // call with the actual temp
console.log(actualP);

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
  console.log('send http');
  getTemp('./w1_slave',function(temp){
    console.log('im callback' + temp.temp)
    actualP = pidController.calculate(temp.temp);    // call with the actual temp
    console.log(actualP);

  })

}).listen(3000);