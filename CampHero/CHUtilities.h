//
//  CHUtilities.h
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHUtilities : NSObject

-(void)monitorWebConnection;
-(void)stopMonitoringWebConnection;
-(BOOL)verifyWebConnection;

+ (instancetype)sharedUtilities;

@end
