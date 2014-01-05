//
//  DDProgressWindowController.m
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDProgressWindowController.h"

#import "../Model/Worker/DDZipCreator.h"
#import "../Model/Worker/DDPublisher.h"

@interface DDProgressWindowController ()

@end

@implementation DDProgressWindowController

int initialCount, lastCount = -1;

@synthesize data, textView, progressBar, workingDirectory, processControlButton;

-(id) initWithWindowNibName:(NSString *) name workingPath:(NSURL *) url andData: (NSArray *) dataArray{
    
    if(self = [self initWithWindowNibName:name]){
        data = dataArray;
        workingDirectory = url;
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    [progressBar setMaxValue: initialCount = (int)[data count]];
    [progressBar setUsesThreadedAnimation:true];
    [progressBar setIndeterminate:false];
    
    [processControlButton setTitle:@"Start"];
}

- (IBAction)startProcess:(id)sender {
    
    DDZipCreator * zipCreator = [[DDZipCreator alloc] initWithDelegate:self];
    if([zipCreator writeFiles:data toZipFile:workingDirectory overwrite:false]){
        DDPublisher * publisher = [[DDPublisher alloc] initWithDelegate:self];
        
        [progressBar setMaxValue: initialCount = 100];
        [progressBar setIndeterminate:false];
        
        [publisher transferFiles];
    }
}

/**
 *   Notification methods
 */

-(void) notifyProgressStateChanged:(DDProgressState) value{
    NSString * stringRepresentation = DDProgressStateName[value];
    [[self window] setTitle:stringRepresentation];
    [self addMessage:stringRepresentation];
    [[self window] displayIfNeeded];
    
}

-(void) notifyRemainingCountChanged:(int)value{
    if(lastCount < 0){
        [progressBar setIndeterminate:false];
    }
    double newValue = initialCount -value;
    double increment = newValue - lastCount;
    [progressBar incrementBy:increment];
    [progressBar displayIfNeeded];
    lastCount = newValue;
}

-(void) notifyFinishedItemChanged:(NSString *) value{
    
    [self addMessage:value];
}

-(void) addMessage:(NSString *) message{
    NSAttributedString * attributedString = [[NSAttributedString alloc] initWithString:message];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[textView textStorage] appendAttributedString:attributedString];
        [textView insertNewline:self];
        [textView displayIfNeeded];
    });
}

@end
