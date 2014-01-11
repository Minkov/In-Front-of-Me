//
//  PlaceModel.h
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface PlaceModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Location *position;
@property (nonatomic, strong) NSString *rating;

-(id) initWithDictionary: (NSDictionary *) dict;

+(NSArray *) placesWithDictionaries:(NSArray *) dicts;

@end
