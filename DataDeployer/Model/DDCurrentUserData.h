//
//  DDCurrentUserData.h
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * userName;

@interface DDCurrentUserData : NSObject

+(void) setCurrentUserName:(NSString *) name;
+(NSString *) getCurrentUserName;
@end
