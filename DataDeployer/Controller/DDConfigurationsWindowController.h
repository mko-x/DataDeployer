//
//  DDConfigurationController.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../References/DDProtocols.h"

@interface DDConfigurationsWindowController  : DDControllerType<DDProtocolController>
{
    NSArray * configurationKeys;
    NSDictionary * confogurationProperties;
}

@end
