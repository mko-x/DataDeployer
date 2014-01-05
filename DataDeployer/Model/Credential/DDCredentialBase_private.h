//
//  DDCredentialBase_private.h
//  DataDeployer
//
//  Created by mko on 26.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDCredentialBase.h"

@interface DDCredentialBase ()

-(NSString *) machineModel;
-(NSString *) userData;
-(NSString *) cpuType;
-(NSString *) fetchSystemPropertyForKey:(NSString *) key;

@end
