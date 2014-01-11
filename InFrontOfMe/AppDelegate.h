//
//  AppDelegate.h
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/6/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *appId;
@property (strong, nonatomic) NSString *appCode;

@property (strong, nonatomic) NSString *rootUrl;

@property (nonatomic, strong) Location *location;

@property (nonatomic, strong) CLLocationManager *manager;

-(NSString *) buildUrlWithParameters:(NSDictionary *) queryParameters;

@end
