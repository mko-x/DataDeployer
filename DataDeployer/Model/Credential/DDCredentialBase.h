//
//  DDCredentialBase.h
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

static NSString * serviceName = @"DataDeployerService";

#import <Foundation/Foundation.h>

@interface DDCredentialBase : NSObject

-(NSString *) createEncryptionKey;
+(NSString *) createServiceName;

@end
