hardware.pin9.configure(ANALOG_IN);

function sendAnalogInput()
{
  local analogInput = hardware.pin9.read();
    
  server.log("Analog Input: " + analogInput);
 
  agent.send("sendAnalogInput", analogInput);
}

imp.onidle(function() {
  sendAnalogInput();
  server.sleepfor(15);
});
