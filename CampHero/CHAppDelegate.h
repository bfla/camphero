//
//  CHAppDelegate.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, copy) NSArray *campsites;
@property (nonatomic, copy) NSString *current_loc;
@property(nonatomic, copy) NSString *restorationIdentifier;

@end
