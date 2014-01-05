//
//  DDCredentialBase.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDCredentialBase.h"
#import "DDCredentialBase_private.h"

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/sysctl.h>

NSString * machineData, *cpuType, *userData;

@implementation DDCredentialBase

+(NSString *) createServiceName{
    return serviceName;
}

-(NSString *) createEncryptionKey{
    
    NSString * result = @"key";
    
    if([self machineModel]){
        result = [result stringByAppendingString:machineData];
    }
    
    if([self cpuType]){
        result = [result stringByAppendingString:cpuType];
    }
    
    if([self userData]){
        result = [result stringByAppendingString:userData];
    }
    
    return result;
}

-(NSString *) userData
{
    if(userData){
        return userData;
    }
    return userData = NSHomeDirectory();
}

-(NSString *) cpuType
{
    if(cpuType){
        return cpuType;
    }
    return cpuType = [self fetchSystemPropertyForKey:@"hw.cputype"];
}

-(NSString *) machineModel
{
    if(machineData){
        return machineData;
    }
    return machineData = [self fetchSystemPropertyForKey:@"hw.model"];
}

-(NSString *) fetchSystemPropertyForKey:(NSString *) key{
    
    size_t len = 0;
    sysctlbyname([key UTF8String], NULL, &len, NULL, 0);
    
    if (len)
    {
        char *model = malloc(len*sizeof(char));
        sysctlbyname([key UTF8String], model, &len, NULL, 0);
        NSString *model_ns = [NSString stringWithUTF8String:model];
        free(model);
        return model_ns;
    }

    return nil;
}

@end
