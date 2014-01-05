//
//  DDZipCreator.m
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDZipCreator.h"

#import "../../../Objective-Zip/ZipFile.h"
#import "../../../Objective-Zip/ZipWriteStream.h"

#import "../../Application/DDApplicationData.h"

#import "../DDCurrentPathStore.h"

#import "../../Protocols/ProtocolData/DDWithUrl.h"

ZipWriteStream * stream;
DDProgressState currentState;
int remainingItemCount;
NSString * lastFinishedItem;

@implementation DDZipCreator

@synthesize delegate, fileManager;

-(id) initWithDelegate:(id<DDProgressUpdatedDelegate>) updateDelegate{
    
    if(self = [super init]){
        self.delegate = updateDelegate;
        self.fileManager = [NSFileManager defaultManager];
    }
    
    return self;
}

/**
 *  Writes selceted data to a zip file. If the file already exists and is an archive, method will try to integrate
 *  files.
 *
 *  @param filePathList Array of file paths to zip
 *  @param zipFilePath  destination file path.
 */
-(BOOL) writeFiles: (NSArray *) filePathList toZipFile:(NSURL *) zipFilePath overwrite:(BOOL) overwrite{
    
    if(filePathList == nil || filePathList.count < 1){
        return false;
    }
//#error http://stackoverflow.com/questions/2161327/creating-zip-files-in-objectivec-for-iphone
//#error https://github.com/pixelglow/zipzap
    int initialCount = remainingItemCount = (int) [filePathList count];
    
    [self notify:Waiting andRemaining:initialCount andLastFinished:nil];
    
    ZipFile * zipFile;
    NSError *err;
    ZipFileMode filemode;
    
    NSString * zipFileName = [zipFilePath lastPathComponent];
    NSString * docPath = [DDApplicationData applicationUserDocumentsDirectory];
    NSString * fullPathToFile = [docPath stringByAppendingPathComponent:zipFileName];
    
    [DDCurrentPathStore setCurrentLocalPath:fullPathToFile];
    
    if([zipFilePath checkResourceIsReachableAndReturnError: &err] == NO){
        filemode = ZipFileModeCreate;
    }
    else if(err == nil && !overwrite){
        filemode = ZipFileModeAppend;
    }
    else if (err == nil && overwrite){
        [self deleteFile:[zipFilePath absoluteString]];
        filemode =ZipFileModeCreate;
    }
    else{
        NSLog(@"Failed to create zip file at %@", zipFilePath);
        return false;
    }
    
    bool fileCreated = filemode == ZipFileModeAppend;
    
    [self notifyIfCurrentStateChanged:ZipRunning];
    
    for (NSObject *object in filePathList) {
        @try {
            
            if(fileCreated){
                filemode = ZipFileModeAppend;
            }
            else{
                filemode = ZipFileModeCreate;
                fileCreated = true;
            }
            
            zipFile = [[ZipFile alloc] initWithFileName:fullPathToFile mode:filemode];
            
            NSString * filePath = @"";
            NSString * fileName = @"";
            if([object conformsToProtocol:@protocol(DDWithUrl)]){
                NSObject<DDWithUrl> * withURL = (NSObject<DDWithUrl> *)object;
                filePath = [[withURL asUrl] absoluteString];
                fileName = [[withURL asUrl] lastPathComponent];
            }
            else if([object isKindOfClass:[NSString class]]){
                filePath = (NSString *) object;
                fileName = [[[NSURL alloc] initFileURLWithPath:(NSString *) object] lastPathComponent];
            }
            else{
                NSLog(@"Inalid object in filePathList %@", object);
                continue;
            }
            
            NSData * data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&err];
            
            ZipWriteStream *stream= [zipFile writeFileInZipWithName:fileName
                                                   compressionLevel:ZipCompressionLevelBest];
            
            [stream writeData:data];
            [stream finishedWriting];
            [self notify:ZipRunning andRemaining:(remainingItemCount -1) andLastFinished:fileName];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception);
            return false;
        }
        @finally {
            [zipFile close];
        }
    }
    
    [self notify:ZipDone andRemaining:remainingItemCount andLastFinished:nil];
    
    return true;
}

-(void) notify:(DDProgressState) state
                                 andRemaining:(int) count
                                 andLastFinished:(NSString *) item{
    [self notifyIfCurrentStateChanged:state];
    
    [self notifyRemainingItemCount:count];
    
    [self notifyIfFinishedItemChanged:item];
}

- (void)notifyRemainingItemCount:(int)count {
    if(count != remainingItemCount){
        remainingItemCount = count;
        [delegate notifyRemainingCountChanged:count];
    }
}

- (void)notifyIfCurrentStateChanged:(DDProgressState)state {
    if(state != currentState){
        currentState = state;
        [delegate notifyProgressStateChanged:state];
    }
}

-(void) notifyIfFinishedItemChanged:(NSString *) item{
    if(item != nil && ![item isEqualToString:lastFinishedItem]){
        lastFinishedItem = item;
        [delegate notifyFinishedItemChanged:item];
    }
}

-(void) deleteFile:(NSString *)path{
    NSError *err;
    [[NSFileManager defaultManager] removeItemAtPath:path error:&err];
    if (err.code != NSFileNoSuchFileError) {
        NSLog(@"%@", err);
    }
}
@end
