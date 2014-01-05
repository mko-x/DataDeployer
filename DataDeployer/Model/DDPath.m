//
//  DDPath.m
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDPath.h"

@implementation DDPath

@synthesize path;

-(id)initWithUrl:(NSURL *) url{
    if(self = [super init]){
        self.path = url;
    }
    
    return self;
}

-(id)initWithString:(NSString *)string{
    
    if(self = [super init]){
        self.path = [[NSURL alloc] initFileURLWithPath:string];
    }
    
    return self;
}

-(NSURL *) asUrl{
    return path;
}

@end
