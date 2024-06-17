module("luci.controller.fancontrol", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/fancontrol") then
        return
    end

    entry({"admin", "services", "fancontrol"}, cbi("fancontrol"), _("Fan Control"), 60).dependent = true
end
