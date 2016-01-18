var liquidPID = require('liquid-pid'),
    actualP = 0,
    pidController;

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

while (true){
actualP = pidController.calculate(66.7);	// call with the actual temp
console.log(actualP);

actualP = pidController.calculate(67.0);    // call with the actual temp
console.log(actualP);

actualP = pidController.calculate(69.0);    // call with the actual temp
console.log(actualP);
}
