local thingSpeakUrl = "http://api.thingspeak.com/update";

local headers = {
  "Content-Type" : "application/x-www-form-urlencoded",
  "X-THINGSPEAKAPIKEY" : "XXXXXXXXXXXX"
};

local field = "field1";

function httpPostToThingSpeak (data) {
  local request = http.post(thingSpeakUrl, headers, data);
  local response = request.sendsync();
  return response;
}
 
device.on("sendAnalogInput", function(analog_value) {
  local response =  httpPostToThingSpeak(field+"="+analog_value);
  server.log(response.body);
});
