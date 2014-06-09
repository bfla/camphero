//
//  CHFilterViewController.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHFilterViewController : UITableViewController

@property (nonatomic, strong) NSArray *filters;
@property (nonatomic, copy) NSString *locationName;

@end
