# Build status #

[![Build Status](https://api.travis-ci.org/xebialabs-community/xld-controlm-plugin.svg?branch=master)](https://api.travis-ci.org/xebialabs-community/xld-controlm-plugin)

# Preface #

This document describes the functionality provided by the Control-M plugin.

See the **XL Deploy Reference Manual** for background information on XL Deploy and deployment concepts.

# Overview #

The Control-M plugin is a XL Deploy plugin that adds capability for
deploying items in [Control-M provided by BMC](http://www.bmc.com/it-solutions/control-m.html)

# Requirements #

* **Requirements**
  * **XL Deploy** 5.0.0

# Build #

$ gradle build

And go to the build/distributions to find your plugin XLDP file.

# Installation #

Remove the previous plugin XLDP file from your `SERVER_HOME/plugins` directory.
Next, place the plugin XLDP file into your `SERVER_HOME/plugins` directory.
Finally, restart the server.


