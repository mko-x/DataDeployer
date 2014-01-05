//
//  DDBaseTextFieldDelegate.h
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDUserDataChangedDelegate.h"

@interface DDBaseTextFieldDelegate : NSObject<NSTextFieldDelegate>{
    id<DDUserDataChangedDelegate> delegate;
}

@property (retain, nonatomic) id<DDUserDataChangedDelegate> delegate;

-(id) initWithDelegate:(id<DDUserDataChangedDelegate>) changedDelegate;

@end
