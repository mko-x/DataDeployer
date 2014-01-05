//
//  DDProtocolPathController.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DDProtocolPathController <DDProtocolController>

-(int) count;
-(id) objectAtIndex: (NSUInteger *) index;
-(void) update: (NSMutableArray *) newItems;

@end
