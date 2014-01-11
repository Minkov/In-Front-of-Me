//
//  DataPersister.h
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataPersisterDelegate <NSObject>

-(void) didReceiveData:(NSDictionary*) responseData withAlias:(NSString *) alias;

@end

@interface DataPersister : NSObject

@property (nonatomic, weak) id<DataPersisterDelegate> delegate;

-(void) fetchData: (NSString *) url withAlias:(NSString *) alias;

@end
