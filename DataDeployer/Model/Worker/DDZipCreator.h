//
//  DDZipCreator.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../Protocols/ProtocolDelegate/DDProgressUpdatedDelegate.h"

/**
 *  Worker to create zip files
 */
@interface DDZipCreator : NSObject{
    id<DDProgressUpdatedDelegate> delegate;
}

@property (retain, nonatomic) id<DDProgressUpdatedDelegate> delegate;
@property NSFileManager * fileManager;

-(id) initWithDelegate:(id<DDProgressUpdatedDelegate> ) updateDelegate;

/**
 *  write files to desired zip file
 *
 *  @param filePathList list of desired filenames
 *  @param zipFilePath  target path for zipfile
 *  @param overwrite    force overwriting of already existing target
 *
 *  @return true if successful, see log for errors if false
 */
-(BOOL) writeFiles: (NSArray *) filePathList toZipFile:(NSURL *) zipFilePath overwrite:(BOOL) overwrite;

#pragma mark - forbidden
-(instancetype) init __attribute__((unavailable("init not available")));

@end
