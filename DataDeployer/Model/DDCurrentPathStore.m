//
//  DDTempDataFilesStore.m
//  DataDeployer
//
//  Created by mko on 25.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDCurrentPathStore.h"

@implementation DDCurrentPathStore

+(void) setCurrentLocalPath:(NSString *) path{
    currentPath = path;
}

+(NSString *) getCurrentLocalPath{
    return currentPath;
}

+(void) setCurrentRemotePath:(NSString *) path{
    currentRemotePath = path;
}

+(NSString *) getCurrentRemotePath{
    return currentRemotePath;
}

@end
