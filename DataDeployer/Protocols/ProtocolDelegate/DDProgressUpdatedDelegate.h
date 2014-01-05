//
//  DDProgressUpdatedDelegate.h
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  ProgressState
 */
typedef enum {
    /**
     *  process not startet yet
     */
    Waiting = 0,
    
    /**
     *  process currently active
     */
    ZipRunning,
    
    /**
     *  process paused
     */
    Paused,
    
    /**
     *  process was canceled
     */
    Canceled,
    
    /**
     *  process ran in error
     */
    ZipError,
    
    /**
     *  process has finished
     */
    ZipDone,
    
    FtpRunning,
    
    FtpError,
    
    FtpDone
} DDProgressState;

/**
 *  To convert enum to string:
 * NSString *str = DDProgressState_toString[theEnumValue];
 *
 * @see DDProgressStateTransformer
 */
extern NSString * const DDProgressStateName[];

@protocol DDProgressUpdatedDelegate <NSObject>

@required
/**
 *  Current progress state
 *
 *  @param s current progress state as defined with DDProgressState
 */
-(void) notifyProgressStateChanged:(DDProgressState) value;

/**
 *  The number of items reamining in progress
 *
 *  @param int remaining items
 */
-(void) notifyRemainingCountChanged:(int)value;

/**
 *  Currently finished item
 *
 *  @param value string interpretation
 */
-(void) notifyFinishedItemChanged:(NSString *) value;

@end
