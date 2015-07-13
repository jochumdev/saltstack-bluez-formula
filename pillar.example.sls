#!jinja|yaml
# vi: set ft=yaml.jinja :

bluez:
  lookup:
    pkgs:
      - bluez
      - bluez-alsa
      - bluez-cups
      - bluez-tools

  configs:
    'main.conf':
      content: |
        [General]
        # List of plugins that should not be loaded on bluetoothd startup
        #DisablePlugins = network,input

        # Default adaper name
        # %h - substituted for hostname
        # %d - substituted for adapter id
        Name = %h

        # Default device class. Only the major and minor device class bits are
        # considered.
        Class = 0x000100

        # How long to stay in discoverable mode before going back to non-discoverable
        # The value is in seconds. Default is 180, i.e. 3 minutes.
        # 0 = disable timer, i.e. stay discoverable forever
        DiscoverableTimeout = 0

        # How long to stay in pairable mode before going back to non-discoverable
        # The value is in seconds. Default is 0.
        # 0 = disable timer, i.e. stay pairable forever
        PairableTimeout = 0

        # Use some other page timeout than the controller default one
        # which is 16384 (10 seconds).
        PageTimeout = 8192

        # Automatic connection for bonded devices driven by platform/user events.
        # If a platform plugin uses this mechanism, automatic connections will be
        # enabled during the interval defined below. Initially, this feature
        # intends to be used to establish connections to ATT channels.
        AutoConnectTimeout = 60

        # What value should be assumed for the adapter Powered property when
        # SetProperty(Powered, ...) hasn't been called yet. Defaults to true
        InitiallyPowered = true

        # Remember the previously stored Powered state when initializing adapters
        RememberPowered = true

        # Use vendor id source (assigner), vendor, product and version information for
        # DID profile support. The values are separated by ":" and assigner, VID, PID
        # and version.
        # Possible vendor id source values: bluetooth, usb (defaults to usb)
        #DeviceID = bluetooth:1234:5678:abcd

        # Do reverse service discovery for previously unknown devices that connect to
        # us. This option is really only needed for qualification since the BITE tester
        # doesn't like us doing reverse SDP for some test cases (though there could in
        # theory be other useful purposes for this too). Defaults to true.
        ReverseServiceDiscovery = true

        # Enable name resolving after inquiry. Set it to 'false' if you don't need
        # remote devices name and want shorter discovery cycle. Defaults to 'true'.
        NameResolving = true

        # Enable runtime persistency of debug link keys. Default is false which
        # makes debug link keys valid only for the duration of the connection
        # that they were created for.
        DebugKeys = false

        # Enable the GATT functionality. Default is false
        EnableGatt = false

    'audio.conf':
      content: |
        # Configuration file for the audio service

        # This section contains options which are not specific to any
        # particular interface
        [General]
        Enable = Sink,Source

        # Switch to master role for incoming connections (defaults to true)
        #Master=true

        # If we want to disable support for specific services
        # Defaults to supporting all implemented services
        Disable=Socket

        # SCO routing. Either PCM or HCI (in which case audio is routed to/from ALSA)
        # Defaults to HCI
        # SCORouting=PCM

        # Automatically connect both A2DP and HFP/HSP profiles for incoming
        # connections. Some headsets that support both profiles will only connect the
        # other one automatically so the default setting of true is usually a good
        # idea.
        AutoConnect=true

        # Headset interface specific options (i.e. options which affect how the audio
        # service interacts with remote headset devices)
        [Headset]

        # Set to true to support HFP, false means only HSP is supported
        # Defaults to true
        HFP=true

        # Maximum number of connected HSP/HFP devices per adapter. Defaults to 1
        MaxConnected=1

        # Set to true to enable use of fast connectable mode (faster page scanning)
        # for HFP when incoming call starts. Default settings are restored after
        # call is answered or rejected. Page scan interval is much shorter and page
        # scan type changed to interlaced. Such allows faster connection initiated
        # by a headset.
        FastConnectable=true

        # Just an example of potential config options for the other interfaces
        [A2DP]
        SBCSources=1
        MPEG12Sources=0
