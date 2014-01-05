//
//  DDTempDataFilesStore.h
//  DataDeployer
//
//  Created by mko on 25.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * currentPath;
static NSString * currentRemotePath;

@interface DDCurrentPathStore : NSObject

+(void) setCurrentLocalPath:(NSString *) path;
+(NSString *) getCurrentLocalPath;

+(void) setCurrentRemotePath:(NSString *) path;
+(NSString *) getCurrentRemotePath;

@end
