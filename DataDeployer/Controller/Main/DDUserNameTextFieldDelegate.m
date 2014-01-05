//
//  DDUserNameTextFieldDelegate.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDUserNameTextFieldDelegate.h"

@implementation DDUserNameTextFieldDelegate

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    [delegate notifyUserNameChanged:[textField stringValue]];
}

@end
