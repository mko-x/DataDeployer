//
//  DDProgressWindowController.h
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "../Protocols/ProtocolDelegate/DDProgressUpdatedDelegate.h"

@interface DDProgressWindowController : NSWindowController<DDProgressUpdatedDelegate>

@property  NSArray * data;
@property IBOutlet NSTextView * textView;
@property IBOutlet NSProgressIndicator *progressBar;
@property NSURL * workingDirectory;

@property (weak) IBOutlet NSButton *processControlButton;

- (IBAction)startProcess:(id)sender;

-(id) initWithWindowNibName:(NSString *) name workingPath:(NSURL *) url andData: (NSArray *) dataArray;
@end
