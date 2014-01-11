//
//  AppDelegate.m
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize appId;
@synthesize appCode;
@synthesize rootUrl;
@synthesize location =_location;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self detectLocation];
    
    self.appId = @"20LQKdkPz8egIpAfWPBl";
    self.appCode = @"2_AGS7mBl9YxXgiuvvKg2Q";
    self.rootUrl = @"http://demo.places.nlp.nokia.com/places/v1/discover/explore?size=100";
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)apnplication
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) detectLocation
{
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
    self.manager.distanceFilter = kCLDistanceFilterNone;
    self.manager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.manager startUpdatingLocation];
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location = [locations lastObject];
    self.location = [[Location alloc] initWithLatitude:location.coordinate.latitude andLongitude:location.coordinate.longitude];
    [self.manager stopUpdatingLocation];
}

-(NSString *) buildUrlWithParameters:(NSDictionary *)queryParameters{
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@&app_code=%@&app_id=%@",self.rootUrl, self.appCode, self.appId];
    for (id key in queryParameters) {
        [url appendFormat:@"&%@=%@", key, [queryParameters objectForKey:key]];
    }
    return url;
}

@end
