//
//  PlaceModel.m
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "PlaceModel.h"

@implementation PlaceModel

-(id) initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if(self){
        NSArray *position = [dict objectForKey:@"position"];
        self.position =[[Location alloc] initWithLatitude:[[position objectAtIndex:0] doubleValue]andLongitude:[[position objectAtIndex:1] doubleValue]];
        self.name = [dict objectForKey:@"title"];
        self.rating = [NSString stringWithFormat:@"%.2f", [[dict objectForKey:@"averageRating"] doubleValue]];
   //     NSLog(@"%@", self.position);
    }
    
    return self;
}


/*
 2014-01-10 15:11:37.188 InFrontOfMe[5079:3d07] {
 averageRating = "3.415183305740356";
 category =     {
 href = "http://demo.places.nlp.nokia.com/places/v1/categories/places/hotel?app_id=20LQKdkPz8egIpAfWPBl&app_code=2_AGS7mBl9YxXgiuvvKg2Q";
 id = hotel;
 title = Hotel;
 type = "urn:nlp-types:category";
 };
 distance = 158;
 having =     (
 );
 href = "http://demo.places.nlp.nokia.com/places/v1/places/8409q8yy-21bed8d37fad48ac9d73b4e7da472594;context=Zmxvdy1pZD01ZjZjZmQzNi04YWU1LTVkZDktYmI4Zi01YzM2N2IyNDM3MGRfMTM4OTM1OTQ5MzE3OV8wXzY1ODgmcmFuaz05OQ?app_id=20LQKdkPz8egIpAfWPBl&app_code=2_AGS7mBl9YxXgiuvvKg2Q";
 icon = "http://download.vcdn.nokia.com/p/d/places2/icons/categories/01.icon";
 id = "8409q8yy-21bed8d37fad48ac9d73b4e7da472594";
 position =     (
 "37.78504",
 "-122.40493"
 );
 title = "The Mosser";
 type = "urn:nlp-types:place";
 vicinity = "54 4th St<br/>San Francisco, CA 94103";
 }
 
 */

+(NSArray *) placesWithDictionaries:(NSArray *)dicts{
    NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:dicts.count];
    for (int i =0; i< [dicts count]; i++) {
        PlaceModel *model = [[PlaceModel alloc] initWithDictionary:[dicts objectAtIndex:i]];
        [models addObject:model];
    }
    return models;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"Place with name: \"%@\"", self.name];
}

@end
