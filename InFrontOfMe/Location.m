//
//  Location.m
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "Location.h"

@implementation Location

-(id) initWithLatitude:(double)lat andLongitude:(double)lon{
    self = [super init];
    if(self){
        self.latitude = lat;
        self.longitude = lon;
    }
    return self;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"(%f, %f)", self.latitude, self.longitude];
}

@end