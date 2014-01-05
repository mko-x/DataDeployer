//
//  DDPublisher.m
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDPublisher.h"
#import "../DDCurrentPathStore.h"
#import "DDCurrentUserData.h"
#import "DDCredentialStore.h"

@implementation DDPublisher

@synthesize remoteUrl, delegate, manager;

FMServer* server;
NSTimer* progTimer;
BOOL succeeded;

-(id) initWithDelegate:(id<DDProgressUpdatedDelegate> ) updateDelegate{
    if(self = [super init]){
        self.delegate = updateDelegate;
    }
    
    return self;
}

-(BOOL) transferFiles{
    
    NSString * remotePath = [DDCurrentPathStore getCurrentRemotePath];
    
    NSString * userName = [DDCurrentUserData getCurrentUserName];
    NSString * password = [DDCredentialStore getPasswordForUserName:userName];
    
    server = [FMServer serverWithDestination:remotePath username:userName password:password];
    
    [self publishCurrentDataToServer];
    
    return true;
}

-(void) publishCurrentDataToServer{
    
    progTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
    [self performSelectorInBackground:@selector(startUploading) withObject:nil];
    
}

-(void)changeProgress {
    if (!manager) {
        return;
    }
    NSNumber* progress = [manager.progress objectForKey:kFMProcessInfoProgress];
    float p = progress.floatValue; //0.0f ≤ p ≤ 1.0f

    float remaining = (1.0 - p) * 100;
    
    int rem = ceil(remaining);
    
    [delegate notifyRemainingCountChanged:rem];
}

-(void)startUploading {
    
    NSURL * source = [NSURL fileURLWithPath:[DDCurrentPathStore getCurrentLocalPath]];
    
    manager = [[FTPManager alloc] init];
    
    succeeded = [manager uploadFile:source toServer:server];
    
    [delegate notifyProgressStateChanged:FtpRunning];
    
    [self performSelectorOnMainThread:@selector(uploadFinished) withObject:nil waitUntilDone:NO];
}

-(void)uploadFinished {
    [progTimer invalidate];
    
    if(succeeded){
        [delegate notifyProgressStateChanged:FtpDone];
    }
    else{
        [delegate notifyProgressStateChanged:FtpError];
    }
}

@end
