//
//  PlacesTableViewController.h
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceModel.h"
#import "Location.h"
#import "DataPersister.h"
#import "AppDelegate.h"

@interface PlacesTableViewController : UITableViewController<DataPersisterDelegate>
{
    DataPersister *data;
    NSArray *places;
    NSTimer *locationTimer;
}

- (void)timerFireMethod:(NSTimer *)timer;

@end
