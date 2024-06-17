m = Map("fancontrol", "Fan Control")

s = m:section(TypedSection, "settings", "Settings")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", "Enable")
enable.default = enable.enabled

gpio = s:option(Value, "gpio_pin", "GPIO Pin")
gpio.datatype = "uinteger"

temp = s:option(Value, "threshold_temp", "Threshold Temperature")
temp.datatype = "uinteger"

return m
