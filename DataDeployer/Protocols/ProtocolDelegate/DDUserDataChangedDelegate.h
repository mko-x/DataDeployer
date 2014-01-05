//
//  DDUserDataChangedDelegate.h
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DDUserDataChangedDelegate <NSObject>

@required
-(void) notifyUserNameChanged:(NSString *) name;
-(void) notifyPasswordChanged:(NSString *) password;

@end
