//
//  DDCredentialCreator.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDCredentialStore.h"

#import "DDCurrentUserData.h"

@implementation DDCredentialStore

+(void) createWithUserName: (NSString *) userName andPassword:(NSString *) password{
    
    if(![self getPasswordForUserName:userName]){
    [SSKeychain setPassword:password forService:[self createServiceName] account:userName];
    }
}

+(NSString *) getPasswordForUserName: (NSString *) userName{
    return [SSKeychain passwordForService:[self createServiceName] account:userName];
}

+(NSString *) getCurrentUserPassword{
    return [self getPasswordForUserName:[DDCurrentUserData getCurrentUserName]];
}

@end
