//
//  DDCredentialBaseTest.m
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DDCredentialBase.h"
#import "../../DataDeployer/Model/Credential/DDCredentialBase_private.h"

@interface DDCredentialBaseTest : XCTestCase

@property DDCredentialBase * base;

@end

@implementation DDCredentialBaseTest

@synthesize base = _base;

- (void)setUp
{
    [super setUp];
    _base = [[DDCredentialBase alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testMachineModel
{
    NSString * modelName = [_base machineModel];
    XCTAssertNotNil(modelName);
    NSLog(@"%@",modelName);
}

@end
