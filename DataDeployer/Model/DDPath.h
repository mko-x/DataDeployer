//
//  DDPath.h
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Protocols/ProtocolData/DDWithUrl.h"

@interface DDPath : NSObject<DDWithUrl>
{
    NSURL * path;
}

@property (copy) NSURL * path;

-(id)initWithUrl:(NSURL *) url;
-(id)initWithString:(NSString *)string;

@end
