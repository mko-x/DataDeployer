//
//  DDUserAccountData.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDUserAccountData.h"

@implementation DDUserAccountData

@synthesize userAccountName = _userAccountName, userPassword = _userPassword;

-(id) initWithUserName:(NSString *) userName andUserPassword:(NSData *) userPassword {
    
    if(self = [self init]){
        _userAccountName = userName;
        _userPassword = userPassword;
    }
    
    return self;
}

@end
