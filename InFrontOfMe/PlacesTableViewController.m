//
//  PlacesTableViewController.m
//  InFrontOfMe
//
//  Created by Doncho Minkov on 1/10/14.
//  Copyright (c) 2014 minkovit. All rights reserved.
//

#import "PlacesTableViewController.h"

@interface PlacesTableViewController ()

@end

@implementation PlacesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(!data){
        data = [[DataPersister alloc] init];
        data.delegate = self;
    }
    locationTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                                     target:self
                                                   selector:@selector(timerFireMethod:)
                                                   userInfo:nil
                                                    repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return places.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlaceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[places objectAtIndex:indexPath.row] name];
    
    return cell;
}

- (void)timerFireMethod:(NSTimer *)timer {
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    if(app.location){
        [timer invalidate];
        timer = nil;
        NSString *url = [app buildUrlWithParameters:[[NSDictionary alloc] initWithObjectsAndKeys: [NSString stringWithFormat:@"%f,%f", app.location.latitude, app.location.longitude], @"at"
                                                     , nil]];
        NSLog(@"%@", app.location);
        [data fetchData:url withAlias:@"get-places"];
    }
}

-(void) didReceiveData:(NSDictionary *)responseData withAlias:(NSString *)alias
{
    NSArray *placesJson = [[responseData objectForKey:@"results"] objectForKey:@"items"];
    NSArray *models = [PlaceModel placesWithDictionaries:placesJson];
    places = [[NSArray alloc] initWithArray:models];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end