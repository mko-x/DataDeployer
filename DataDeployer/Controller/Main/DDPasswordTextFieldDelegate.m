//
//  DDPasswordTextFieldDelegate.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDPasswordTextFieldDelegate.h"

@implementation DDPasswordTextFieldDelegate

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    [delegate notifyPasswordChanged:[textField stringValue]];
}

@end
