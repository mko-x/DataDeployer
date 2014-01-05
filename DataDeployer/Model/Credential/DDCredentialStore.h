//
//  DDCredentialCreator.h
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDCredentialBase.h"

#import "SSKeychain.h"

@interface DDCredentialStore : DDCredentialBase

+(void) createWithUserName: (NSString *) userName andPassword:(NSString *) password;
+(NSString *) getPasswordForUserName: (NSString *) userName;
+(NSString *) getCurrentUserPassword;

@end
