//
//  DDPublisher.h
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <FTPManager.h>

#import "../../Protocols/ProtocolDelegate/DDProgressUpdatedDelegate.h"

@interface DDPublisher : NSObject{
    id<DDProgressUpdatedDelegate> delegate;
}

@property (strong) FTPManager * manager;

@property NSURL * remoteUrl;
@property (retain, nonatomic) id<DDProgressUpdatedDelegate> delegate;

-(id) initWithDelegate:(id<DDProgressUpdatedDelegate> ) updateDelegate;

-(BOOL) transferFiles;

#pragma mark - forbidden
-(instancetype) init __attribute__((unavailable("init not available")));


@end
