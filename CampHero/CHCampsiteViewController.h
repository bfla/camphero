//
//  CHCampsiteViewController.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h> // !MapKit
@class CHReserveOnlineViewController;
@class CHCampsiteMapViewController;

@interface CHCampsiteViewController : UIViewController <MKMapViewDelegate> // !MapKit Protocol

@property(nonatomic, copy) NSString *restorationIdentifier;

@property (nonatomic, copy) NSDictionary *campsite;
@property (nonatomic, copy) NSDictionary *campsiteJSON;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property BOOL fetchFailedError;

//@property (nonatomic) CHReserveOnlineViewController *rovc;
//@property (nonatomic) CHCampsiteMapViewController *cmvc;

-(IBAction)callCampground:(id)sender;
-(IBAction)callToReserve:(id)sender;
-(IBAction)getDirections:(id)sender;
-(IBAction)visitReservationWebsite:(id)sender;

@end
