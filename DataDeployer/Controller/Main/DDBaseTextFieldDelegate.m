//
//  DDBaseTextFieldDelegate.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDBaseTextFieldDelegate.h"

@implementation DDBaseTextFieldDelegate

@synthesize delegate;

-(id) initWithDelegate:(id<DDUserDataChangedDelegate>) changedDelegate{
    
    if(self = [super init]){
        delegate = changedDelegate;
    }
    
    return self;
}

@end
