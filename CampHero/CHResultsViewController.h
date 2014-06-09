//
//  CHResultsViewController.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCampsiteViewController.h"

@interface CHResultsViewController : UITableViewController

@property (nonatomic, copy) NSMutableArray *campsites;
@property(nonatomic, copy) NSString *restorationIdentifier;
@property(nonatomic) CHCampsiteViewController *cvc;

@end
