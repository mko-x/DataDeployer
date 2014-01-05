//
//  DDApplicationProvider.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../References/DDApplicatons.h"

typedef enum applicationTypes{
    Persistence, Data
} DDApplicationTypes;

static DDApplicationPersistence * persistence;
static DDApplicationData * data;

@interface DDApplicationProvider : NSObject

+(id<DDProtocolApplication> ) receive: (DDApplicationTypes) type;

@end
