# QDPublisher

## Installation using Cocoapods

- add this line in your Podfile:  
`pod "QDPublisher", :git => 'https://github.com/datastreamx-plc/ios-data-acquisition-sdk.git'`
- and then install by type `pod install` in your command line

## Register Integration Key
register your integration key after app launch, usually your AppDelegate.swift

- `import QDPublisher` to use this framework
- in `didFinishLaunchingWithOptions` method add this code
`QDPublisher.service.setup(integrationKey: String)`

## Tracking

You can use location tracking or generic tracking.

for location tracking, you can use this code:
`QDPublisher.service.track(location: CLLocation)`

for generic tracking, you can use this code:
`QDPublisher.service.track(generic: [String : Any])`
