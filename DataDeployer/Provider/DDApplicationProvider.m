//
//  DDApplicationProvider.m
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDApplicationProvider.h"

@implementation DDApplicationProvider

+(id<DDProtocolApplication>) receive: (DDApplicationTypes) type{
    switch(type){
        case Persistence:
            if(persistence == nil){
                persistence = [[DDApplicationPersistence alloc] init];
            }
            return persistence;
        case Data:
            if(data == nil){
                data = [[DDApplicationData alloc] init];
            }
            return data;
    }
    
    return nil;
}

@end
