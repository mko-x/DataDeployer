//
//  DDApplicationPersistence.h
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../References/DDApplicatons.h"
#import "../Protocols/ProtocolDelegate/DDApplicationPersistenceDelegate.h"

@interface DDApplicationPersistence : NSObject<NSApplicationDelegate, DDProtocolApplication, DDApplicationPersistenceDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
