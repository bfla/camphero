//
//  CHDirectionsViewController.h
//  CampHero
//
//  Created by Brian Flaherty on 6/10/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CHDirectionsViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView; // create property to hold the MapView
@property (nonatomic, copy) NSDictionary *campsite; // store the campsite

//-(void)dismissDirections:(id)sender;
- (void)resetMapArea;

@end
