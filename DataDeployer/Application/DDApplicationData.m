//
//  DDApplicationData.m
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDApplicationData.h"

@implementation DDApplicationData

// Returns the directory the application uses to store the Core Data store file. This code uses a directory named "com.mko.DataDeployer" in the user's Application Support directory.
+(NSURL *)applicationFilesDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *appSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    return [appSupportURL URLByAppendingPathComponent:@"com.mko.DataDeployer"];
}

+(NSString *)applicationUserDocumentsDirectory{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    
    NSString *docDIr = [paths objectAtIndex:0];
    
    NSString * applicationDirName = @"DataDeployer";
    
    NSString *fullPathToFile = [docDIr stringByAppendingPathComponent:applicationDirName];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError * err;
    
    if(![fileManager fileExistsAtPath:fullPathToFile]){
        [fileManager createDirectoryAtPath:fullPathToFile withIntermediateDirectories:YES attributes:nil error:&err];
    }
    
    return fullPathToFile;
}

@end
