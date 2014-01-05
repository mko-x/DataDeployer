//
//  DDProtocolConfiguration.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DDProtocolConfiguration <NSObject>

@required

/**
 *  local working directory
 */
@property NSString * workingDirectory;

// server configuration
@property NSString * serverUrl;
@property NSString * userName;
@property NSString * port;
@end
