--[[

Luci statistics - iptables plugin diagram definition
(c) 2008 Freifunk Leipzig / Jo-Philipp Wich <xm@leipzig.freifunk.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

$Id: ipt_bytes.lua 2276 2008-06-03 23:18:37Z jow $

]]--

module("luci.statistics.rrdtool.definitions.iptables.ipt_bytes", package.seeall)

function rrdargs( graph, plugin, plugin_instance, dtype )

	return {
		data = { 
			options = {
				ipt_bytes = { total = true }
			}
		}
	}
end
