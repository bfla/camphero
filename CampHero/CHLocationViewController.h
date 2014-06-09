//
//  CHLocationViewController.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CHLocationViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSArray *campsites;
@property (nonatomic, retain) CLLocationManager *locationManager;

- (IBAction)tappedUseCurrentLocButton:(id)sender;

@end
