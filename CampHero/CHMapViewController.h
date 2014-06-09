//
//  CHMapViewController.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CHMapViewController : UIViewController  <MKMapViewDelegate> // adopt MapKit Protocol

@property (nonatomic, strong) IBOutlet MKMapView *mapView; // create property to hold the MapView
// Add property to hold campsites for the map markers etc***
@property (nonatomic, copy) NSMutableArray *campsites;

-(void)resetMarkers;

@end
