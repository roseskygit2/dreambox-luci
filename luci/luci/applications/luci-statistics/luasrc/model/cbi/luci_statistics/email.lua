--[[

Luci configuration model for statistics - collectd email plugin configuration
(c) 2008 Freifunk Leipzig / Jo-Philipp Wich <xm@leipzig.freifunk.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

$Id: email.lua 6060 2010-04-13 20:42:26Z jow $

]]--

m = Map("luci_statistics",
	translate("E-Mail Plugin Configuration"),
	translate(
		"The email plugin creates a unix socket which can be used " ..
		"to transmit email-statistics to a running collectd daemon. " ..
		"This plugin is primarily intended to be used in conjunction " ..
		"with Mail::SpamAssasin::Plugin::Collectd but can be used in " ..
		"other ways as well."
	))

-- collectd_email config section
s = m:section( NamedSection, "collectd_email", "luci_statistics" )

-- collectd_email.enable
enable = s:option( Flag, "enable", translate("Enable this plugin") )
enable.default = 0

-- collectd_email.socketfile (SocketFile)
socketfile = s:option( Value, "SocketFile" )
socketfile.default = "/var/run/collect-email.sock"
socketfile:depends( "enable", 1 )

-- collectd_email.socketgroup (SocketGroup)
socketgroup = s:option( Value, "SocketGroup" )
socketgroup.default  = "nobody"
socketgroup.rmempty  = true
socketgroup.optional = true
socketgroup:depends( "enable", 1 )

-- collectd_email.socketperms (SocketPerms)
socketperms = s:option( Value, "SocketPerms" )
socketperms.default  = "0770"
socketperms.rmempty  = true
socketperms.optional = true
socketperms:depends( "enable", 1 )

-- collectd_email.maxconns (MaxConns)
maxconns = s:option( Value, "MaxConns", translate("Maximum allowed connections") )
maxconns.default   = 5
maxconns.isinteger = true
maxconns.rmempty   = true
maxconns.optional  = true
maxconns:depends( "enable", 1 )

return m
