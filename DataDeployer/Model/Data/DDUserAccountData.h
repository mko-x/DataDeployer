//
//  DDUserAccountData.h
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDUserAccountData : NSObject

@property NSString * userAccountName;
@property NSData * userPassword;

-(id) initWithUserName:(NSString *) userName andUserPassword:(NSData *) userPassword;

@end
