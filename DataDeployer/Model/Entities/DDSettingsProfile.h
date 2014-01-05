//
//  DDSettingsProfile.h
//  DataDeployer
//
//  Created by mko on 24.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../Protocols/ProtocolData/DDProtocolConfiguration.h"

@interface DDSettingsProfile : NSObject<DDProtocolConfiguration>

@property NSString * port;
@property NSString * serverUrl;
@property NSString * userName;
@property NSString * workingDirectory;

@end
