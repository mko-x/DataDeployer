//
//  DDApplicationPersistence.m
//  DataDeployer
//
//  Created by mko on 22.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDApplicationPersistence.h"

@implementation DDApplicationPersistence

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

-(void) store:(id<DDProtocolConfiguration> *) configuration {
    //DDProtocolConfiguration *oRating = (DDProtocolConfiguration *)
    if(![self hasConfiguration]){
        [NSEntityDescription insertNewObjectForEntityForName:@"SettingsProfile"
                                      inManagedObjectContext:self.managedObjectContext];
    }
    
    //[NSEntityDescription entityForName:@"SettingsProfile" inManagedObjectContext:<#(NSManagedObjectContext *)#>
}

- (NSArray *) getItems:(NSString *) sEntity {
    //         --------
    // sEntity ist der Tabellen-Name, wie er im Datenmodell definiert wurde. Also z.B. @"Speaker".
    NSManagedObjectContext *oContext = self.managedObjectContext;
    NSFetchRequest *oFetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *oEntity = [NSEntityDescription entityForName:sEntity
                                               inManagedObjectContext:oContext];
    oFetch.entity = oEntity;
    
    // executeFetchRequest liefert ein NSArray of NSManagedObject zurück, also z.B. ein
    // NSArray of Client.
    NSError *oError = nil;
    NSArray *aItem = [oContext executeFetchRequest:oFetch error:&oError];
    
    return aItem;
}

-(BOOL) hasConfiguration{
    
    NSManagedObjectContext *oContext = self.managedObjectContext;
    NSFetchRequest *oFetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *oEntity = [NSEntityDescription entityForName:@"SettingsProfile"
                                               inManagedObjectContext:oContext];
    oFetch.entity = oEntity;
    
    NSError *oError = nil;
    return [oContext countForFetchRequest:oFetch error:&oError] >0;
}

// =================================================================================================
#pragma mark - Core Data methods
// =================================================================================================

// Creates if necessary and returns the managed object model for the application.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DataDeployer" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.)
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSManagedObjectModel *mom = [self managedObjectModel];
    if (!mom) {
        NSLog(@"%@:%@ No model to generate a store from", [self class], NSStringFromSelector(_cmd));
        return nil;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationFilesDirectory = [DDApplicationData applicationFilesDirectory];
    NSError *error = nil;
    
    NSDictionary *properties = [applicationFilesDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    
    if (!properties) {
        BOOL ok = NO;
        if ([error code] == NSFileReadNoSuchFileError) {
            ok = [fileManager createDirectoryAtPath:[applicationFilesDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
        }
        if (!ok) {
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    } else {
        if (![properties[NSURLIsDirectoryKey] boolValue]) {
            // Customize and localize this error.
            NSString *failureDescription = [NSString stringWithFormat:@"Expected a folder to store application data, found a file (%@).", [applicationFilesDirectory path]];
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            [dict setValue:failureDescription forKey:NSLocalizedDescriptionKey];
            error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:101 userInfo:dict];
            
            [[NSApplication sharedApplication] presentError:error];
            return nil;
        }
    }
    
    NSURL *url = [applicationFilesDirectory URLByAppendingPathComponent:@"DataDeployer.storedata"];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    if (![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error]) {
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    _persistentStoreCoordinator = coordinator;
    
    return _persistentStoreCoordinator;
}

// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:@"Failed to initialize the store" forKey:NSLocalizedDescriptionKey];
        [dict setValue:@"There was an error building up the data file." forKey:NSLocalizedFailureReasonErrorKey];
        NSError *error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    
    return _managedObjectContext;
}

@end
