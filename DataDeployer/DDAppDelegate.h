//
//  DDAppDelegate.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import "../../GapTruck/MKoUtils/Global.h"
#import "DDApplicationProvider.h"
#import "References/DDApplicatons.h"
#import "Logger/DDLogger.h"
#import "Controller/DDApplicationController.h"

@interface DDAppDelegate : NSObject <NSApplicationDelegate>
{
    DDApplicationController * appController;
}

@property (assign) DDApplicationController * appController;

@property DDApplicationPersistence * applicationPersistence;

@property (assign) IBOutlet NSWindow *window;

- (IBAction)saveAction:(id)sender;

@end
