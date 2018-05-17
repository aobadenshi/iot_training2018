
local py_script = "<LED_DIR>/lchika_blink.py"

module ("templates.edgething", thingworx.template.extend)

properties.temperature = { baseType="NUMBER", pushType="ALWAYS", handler="script", key="bme280/property/temperature"}
properties.pressure = { baseType="NUMBER", pushType="ALWAYS", handler="script", key="bme280/property/pressure"}
properties.humidity = { baseType="NUMBER", pushType="ALWAYS", handler="script", key="bme280/property/humidity"}

serviceDefinitions.Add(
  input { name="p1", baseType="NUMBER", description="The first addend of the operation" },
  input { name="p2", baseType="NUMBER", description="The second addend of the operation" },
  output { baseType="NUMBER", description="The sum of the two parameters" },
  description { "Add two numbers" }
)

serviceDefinitions.Flash (
   input { baseType="NOTHING", description=""},
   output { baseType="NOTHING", description=""},
   description { "Flash LED" }
)

services.Add = function(me, headers, query, data)
  if not data.p1 or not data.p2 then
    return 400, "You must provide the parameters p1 and p2"
  end
  return 200, data.p1 + data.p2
end

services.Flash = function(me, headers, query, data)
   if os.execute() == 1 then
      local cmd = string.format('python %q', py_script)
      local code = os.execute(cmd)
      log.force(me.name, "Flash:"..code)
      return 200
   else
      log.force("could not execute")
      return 500
   end
end
