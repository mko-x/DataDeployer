//
//  DDApplicationData.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "../References/DDApplicatons.h"

@interface DDApplicationData : NSObject<DDProtocolApplication>

+(NSURL *)applicationFilesDirectory;
+(NSString *)applicationUserDocumentsDirectory;
@end
