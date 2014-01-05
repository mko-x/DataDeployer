//
//  DDProtocolController.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../References/DDTypes.h"
/**
 *  BaseType for all controllers
 */
@protocol DDProtocolController <NSObject>

-(DDControllerType *) create;
-(void) update: (NSMutableArray *) newItems;

@end
