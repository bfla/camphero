//
//  CHSearchStore.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class CHMapViewController;

@interface CHSearchStore : NSObject <CLLocationManagerDelegate>

@property BOOL locationIsUser;
@property BOOL lastSearchWasTextSearch;
@property BOOL shouldResetMap;
@property (nonatomic, readonly) NSString *locationName;
@property BOOL noWifiError;
@property BOOL noPermissionError;
@property BOOL searchFailedError;
// Search parameters
@property (nonatomic, readonly) CLLocation *userLocation;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, readonly) NSString *keywords;
@property (nonatomic, readonly) int tribeFilter;
// Search results
@property (nonatomic, readonly) NSArray *campsites;
@property (nonatomic, readonly) NSArray *filteredCampsites;

// Getters and setters accessible to external classes
+ (instancetype)sharedStore;
- (void)mapWasReset;
// Search functions available to external classes
- (void)runTextSearch:(NSString *)input searchIsAroundUserLocation:(BOOL)isAroundUserLocation;
- (void)mapAreaSearch:(CHMapViewController *)mapView keywords:(NSString *)input distance:(NSString *)distance;
- (void)searchNearUser;
- (void)saveActiveTribeFilter:(int)activeTribeId;
- (void)applyTribeFilter;
// Helper methods available to external classes
- (NSMutableString *)formatPhoneNumber:(NSString *)phoneNumber;

@end
