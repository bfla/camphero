//
//  CHMapMarker.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CHMapMarker : NSObject <MKAnnotation> // Adopt MKAnnotation protocol for map markers

@property (nonatomic) CLLocationCoordinate2D coordinate; // add coordinate property
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) NSDictionary *campsite;

@end
