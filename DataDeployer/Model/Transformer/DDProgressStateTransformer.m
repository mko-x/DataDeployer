//
//  DDProgressStateTransformer.m
//  DataDeployer
//
//  Created by mko on 24.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "../../Protocols/ProtocolDelegate/DDProgressUpdatedDelegate.h"

NSString * const DDProgressStateName[] = {
    
    [Waiting] = @"waiting",
    
    [ZipRunning] = @"zip process running",
    
    [Paused] = @"paused",
    
    [Canceled] = @"canceled",
    
    [ZipError] = @"zip process exited with error",
    
    [ZipDone] = @"zip process done",
    
    [FtpRunning] = @"ftp process running",
    
    [FtpError] = @"ftp process exited with error",
    
    [FtpDone] = @"ftp process done"
};
