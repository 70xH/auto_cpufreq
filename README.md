# auto-cpufreq

> NOTE
>
> This is a forked repo from [github](https://github.com/AdnanHodzic/auto-cpufreq), some changes to support the Void Linux.
> May make some changes to optimize for AMD (no hopes).

Automatic CPU speed & power optimizer for Linux based on active monitoring of laptop's battery state, CPU usage and system load. Ultimately allowing you to improve battery life without making any compromises.

For tl;dr folks there's a: [Youtube: auto-cpufreq - tool demo](https://www.youtube.com/watch?v=QkYRpVEEIlg)

[![](http://img.youtube.com/vi/QkYRpVEEIlg/0.jpg)](http://www.youtube.com/watch?v=QkYRpVEEIlg"")


#### Supported architectures and devices

Supported devices must have an Intel, AMD or ARM CPU's. This tool was developed to improve performance and battery life on laptops, but running it on desktop/servers (to lower power consumption) should also be possible. 

## Features

* Monitoring 
  * Basic system information
  * CPU frequency (system total & per core)
  * CPU usage (system total & per core)
  * Battery state
  * System load
* CPU frequency scaling, governor and [turbo boost](https://en.wikipedia.org/wiki/Intel_Turbo_Boost) management based on
  * battery state
  * CPU usage
  * System load
* Automatic CPU & power optimization (temporary and persistent)

## Installing auto-cpufreq

Get source code, run installer and follow on screen instructions:

```
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
```

## How to run auto-cpufreq

auto-cpufreq can be run by simply running the `auto-cpufreq` and following on screen instructions, i.e:

`sudo auto-cpufreq`

## auto-cpufreq modes and options

### Monitor

`sudo auto-cpufreq --monitor`

No changes are made to the system, and is solely made for demonstration purposes what auto-cpufreq could do differently for your system.

### Live

`sudo auto-cpufreq --live`

Necessary changes are temporarily made to the system which are lost with system reboot. This mode is made to evaluate what the system would behave with auto-cpufreq permanently running on the system.

### Install - auto-cpufreq daemon

Necessary changes are made to the system for auto-cpufreq CPU optimizaton to persist across reboots. Daemon is deployed and then started as a systemd service. Changes are made automatically and live log is made for monitoring purposes.

`sudo auto-cpufreq --install`

After daemon is installed, `auto-cpufreq` is available as a binary and is running in the background. Its logs can be viewed by running: `auto-cpufreq --log`

Since daemon is running as a systemd service, its status can be seen by running:

`sv status auto-cpufreq`

If install has been performed as part of snap package, daemon status can be verified by running: 

`sv status snap.auto-cpufreq.service.service`

### Remove - auto-cpufreq daemon

auto-cpufreq daemon and its systemd service, along with all its persistent changes can be removed by running:

`sudo auto-cpufreq --remove`

### Log

If daemon has been instaled, live log of CPU/system load monitoring and optimizaiton can be seen by running:

`auto-cpufreq --log`

