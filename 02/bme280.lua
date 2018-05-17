require "json"

local py_script = "<BME280_DIR>/bme280_json.py"

function bme280_value()
   local cmd = string.format('python %q', py_script)
   local hdl = io.popen(cmd, "r")
   local content = hdl:read("*all")
   hdl:close()
   return json.decode(content)
end

function property_temperature(method, path, headers, query, data)
   if method ~= "GET" then return 405, "Only GET is allowed" end
   local val = bme280_value()
   local resp = json.encode({
         value   = val.temperature,
         time    = os.time() * 1000,
         quality = "GOOD"
   })
   return 200, resp
end

function property_pressure(method, path, headers, query, data)
   if method ~= "GET" then return 405, "Only GET is allowed" end
   local val = bme280_value()
   local resp = json.encode({
         value   = val.pressure,
         time    = os.time() * 1000,
         quality = "GOOD"
   })
   return 200, resp
end

function property_humidity(method, path, headers, query, data)
   if method ~= "GET" then return 405, "Only GET is allowed" end
   local val = bme280_value()
   local resp = json.encode({
         value   = val.humidity,
         time    = os.time() * 1000,
         quality = "GOOD"
   })
   return 200, resp
end

--
-- Here we register specific functions to act as handlers for
-- a given path.  Once registered, these functions can be executed
-- by accessing the script resource's REST interface using the
-- following pattern:
--
--  /scripts/<script_name>/<registered_path>
--

log.info(p_data.name, "Registering HTTP callbacks")

tw_http.registerCallback("/property/temperature",   "property_temperature")
tw_http.registerCallback("/property/pressure",   "property_pressure")
tw_http.registerCallback("/property/humidity",   "property_humidity")

--
-- This is the main loop of the script. It can be used to execute
-- functionality on a regular basis, or can be used as a thread to
-- execute requests that are submitted via a registered callback.
--
-- The script resource signals the end of the script by setting
-- p_data.run to false, so we must check it periodically.
--

log.info(p_data.name, "Beginning main loop")

while p_data.run do
   tw_utils.psleep(1000)
end

log.info(p_data.name, "Exiting")
