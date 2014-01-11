//
//  DataPersister.m
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "DataPersister.h"

@implementation DataPersister

-(void) fetchData:(NSString *)url withAlias:(NSString *)alias{
    NSURL *requestUrl = [[NSURL alloc] initWithString:url];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestUrl];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError *err = nil;
        
        NSDictionary *dictData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        [self.delegate didReceiveData:dictData withAlias:alias];
    }];
}

@end
