//
//  DDApplicationPersistenceDelegate.h
//  DataDeployer
//
//  Created by mko on 24.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../ProtocolData/DDProtocolConfiguration.h"

@protocol DDApplicationPersistenceDelegate <NSObject>

@required
-(void) store:(id<DDProtocolConfiguration> *) configuration;

@end
