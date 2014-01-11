//
//  Location.h
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property double latitude;
@property double longitude;

-(id) initWithLatitude: (double) lat andLongitude:(double) lon;

@end
