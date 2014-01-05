//
//  DDLogger.m
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDLogger.h"

@implementation DDLogger

+(void) logItem:(NSObject *) logData
{
    if(logData == nil){
        NSLog(@"Something tried to log nil");
        return;
    }
    
    if ([logData class] == [NSString class]){
        NSLog( @"%@", (NSString *) logData);
    }
    else{
        @try {
            NSLog(@"%@", logData );
        }
        @catch (NSException *exception) {
            NSLog(@"Unable to log data of class: %@", logData.class );
        }
        
    }
}

@end
