//
//  DDCurrentUserData.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDCurrentUserData.h"

@implementation DDCurrentUserData

+(void) setCurrentUserName:(NSString *) name{
    userName = name;
}

+(NSString *) getCurrentUserName{
    return userName;
}

@end
