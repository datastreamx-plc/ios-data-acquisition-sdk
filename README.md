# Location SDK v1.1.3


## Installation using Cocoapods

- add this line in your Podfile:

```shell
swift pod "QDPublisher", :git => 'https://github.com/datastreamx-plc/ios-data-acquisition-sdk.git', :tag => '1.1.3'
```

and then install by type `pod install` in your command line

## Configure Info.plist

### update your location usage descriptions

```xml
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string><your location access description></string>

<key>NSLocationAlwaysUsageDescription</key>
<string><your location access description></string>

<key>NSLocationWhenInUseUsageDescription</key>
<string><your location access description></string>
```

### update your tracking manager description

```xml
<key>NSUserTrackingUsageDescription </key>
<string><your tracking usage description></string>
```

## Setup Integration Key and Start Tracking

register your integration key after app launch, after that you can setup your event and start tracking location, usually your AppDelegate

```swift
import QDPublisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    let publisher = Publisher.shared
    let integrationKey: String = "your integration key here"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        /// setup event. You need implement method from `PublisherDelegate`
        publisher.delegate = self
                  
        /// setup integration key
        publisher.setup(integrationKey)
        
        /// if this value is true it will not show custom alert from our location SDK and if false it will show custom alert that we can update the message
        publisher.disableAlertWhenUserDenied = true
        
        /// this is custom alert title to request access location
        publisher.requestAccessAlertTitle = "Need Location Access"
        
        /// this is custom alert message to request access location
        publisher.requestAccessAlertMessage = {
            "Please give authorization location access to continue the process. Go to Settings > Privacy > Location Services \(Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) ?? "")"
        }()
        
        ///start tracking location. After you call this method, our SDK will automatically tracking event and do the logic for you
        publisher.startTrackingLocation()
    }
}
```

Implement PublisherDelegate - iOS

After setting publisher.delegate = self you need to implement PublisherDelegate : 

```swift
extension AppDelegate: PublisherDelegate {
    
    /// this method called when failure to track location
    func publisherOnError(error: Error) {
        print("track location failed, error: \(error.localizedDescription)")
    }
    
    /// this method called when location successfully tracked
    func publisherOnSuccessTracking() {
        print("location successfully tracked")
    }
    
    /// this controller used to show alert.
    func publisherControllreParent() -> UIViewController? {
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
    }
    
}
```

## For Objective-C

Basically, the API is same just different language. Here’s the full code for objective-c in AppDelegate.m
```objective-c
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
NSString *integrationKey = @"your integration key here";


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Publisher* publisher = Publisher.shared;
    
    /// setup event. You need implement method from `PublisherDelegate`
    publisher.delegate = self;
    
    /// setup integration key
    [publisher setup: integrationKey];
    
    /// if this value is true it will not show custom alert from our location SDK and if false it will show custom alert that we can update the message
    publisher.disableAlertWhenUserDenied = false;
    
    /// this is custom alert title to request access location
    publisher.requestAccessAlertTitle = @"Need Location Access";
    
    
    /// this is custom alert message to request access location
    NSString *bundleName = [NSBundle.mainBundle objectForInfoDictionaryKey:(id)kCFBundleNameKey];
    publisher.requestAccessAlertMessage = [NSString stringWithFormat:@"%@ %@",  @"Please give authorization location access to continue the process. Go to Settings > Privacy > Location Services", bundleName];
    
    ///start tracking location. After you call this method, our SDK will automatically tracking event and do the logic for you
    [publisher startTrackingLocation];
    
    return YES;
}


#pragma mark - PublisherDelegate

- (UIViewController * _Nullable)publisherControllreParent {
    NSPredicate *isKeyWindow = [NSPredicate predicateWithFormat:@"isKeyWindow == YES"];
    return [[[UIApplication sharedApplication] windows] filteredArrayUsingPredicate:isKeyWindow].firstObject.rootViewController;
}


- (void)publisherOnErrorWithError:(NSError * _Nonnull)error {
    NSLog(@"qdPublisher %@", error.localizedDescription);
}

- (void)publisherOnSuccessTracking {
    NSLog(@"qdPublisher Success");
}

@end
```

And don’t forget to add implement PublisherDelegate in AppDelegate.h

```objective-c
#import <UIKit/UIKit.h>
@import QDPublisher;

@interface AppDelegate : UIResponder <UIApplicationDelegate, PublisherDelegate>

@end
```
