//
//  DDTableController.m
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import "DDMainWindowController.h"

#import "DDCurrentPathStore.h"
#import "DDCurrentUserData.h"
#import "DDCredentialStore.h"

#import "DDUserNameTextFieldDelegate.h"
#import "DDPasswordTextFieldDelegate.h"

@implementation DDMainWindowController

@synthesize mutableArrayData, tableView, outputFileName, tbWorkingDirectory, tbServerUrl, tbUserName, stbPassword, userNameDelegate, passwordDelegate;

-(id) init{
    
    if(self = [super init]){
        [self updateTextFieldDelegates];
    }
    
    return self;
}

- (void)awakeFromNib {
    
    mutableArrayData = [[NSMutableArray alloc]init];
    
    NSString * zStr1 =  NSLocalizedStringFromTable(@"NoChosenData", @"StringData" , "");
    DDPath * zDataObject = [[DDPath alloc]initWithString:zStr1];
    [mutableArrayData addObject:zDataObject];

    
    [tableView reloadData];
    
} // end awakeFromNib

- (void)updateTextFieldDelegates {
    userNameDelegate = [[DDUserNameTextFieldDelegate alloc] initWithDelegate:self];
    
    passwordDelegate = [[DDPasswordTextFieldDelegate alloc] initWithDelegate:self];
    
}

/**
 *  Let the user select data with finder
 *
 *  @param sender 
 */
- (IBAction)openChooseWorkingDirectory:(id)sender {

    NSSavePanel * savePanel = [[NSSavePanel alloc] init];
    
    if([savePanel runModal] == NSOKButton){
        outputFileName = [[savePanel URL] lastPathComponent];
        [self.tbWorkingDirectory setStringValue: outputFileName];

    }
    
}

- (IBAction)chooseData:(id)sender {
    
    NSOpenPanel * browsePanel = [[NSOpenPanel alloc] init];
    
    [browsePanel setCanChooseDirectories:true];
    [browsePanel setCanChooseFiles:true];
    [browsePanel setAllowsMultipleSelection:true];
    
    if([browsePanel runModal] == NSOKButton){
        NSArray * newData = [browsePanel URLs];
        
        [mutableArrayData removeAllObjects];
        
        for(int i = 0; i < [newData count]; i++){
            DDPath * newPath = [[DDPath alloc] initWithUrl: [newData objectAtIndex:i]];
            [self addRow:newPath];
        }
    }
}

- (IBAction)publish:(id)sender {
    
    outputFileName = [tbWorkingDirectory stringValue];
    [DDCurrentPathStore setCurrentRemotePath:[tbServerUrl stringValue]];
    [DDCurrentUserData setCurrentUserName:[tbUserName stringValue]];
    
    [DDCredentialStore createWithUserName:[tbUserName stringValue] andPassword:[stbPassword stringValue]];
    
    NSURL * outputPath = [[DDApplicationData applicationFilesDirectory] URLByAppendingPathComponent:outputFileName isDirectory:false];
    
    if(!progressWindowController){
        progressWindowController = [[DDProgressWindowController alloc] initWithWindowNibName:@"DDProgressWindow" workingPath:outputPath andData:mutableArrayData];
//        progressWindowController = [progressWindowController initWithWindowNibName:@"DDProgressWindow"];

    }
    
    [progressWindowController showWindow:self];
}

-(void) makeCredentials{
    
    NSString * userName = [tbUserName stringValue];
    NSString * passwd = [stbPassword stringValue];
    
    [DDCredentialStore createWithUserName:userName andPassword:passwd];
}


- (void)addRow:(DDPath *)pDataObj {
    [mutableArrayData addObject:pDataObj];
    [tableView reloadData];
} // end addRow


- (int)numberOfRowsInTableView:(NSTableView *)pTableViewObj {
    return (int) [mutableArrayData count];
} // end numberOfRowsInTableView


- (id) tableView:(NSTableView *)pTableViewObj
objectValueForTableColumn:(NSTableColumn *)pTableColumn
             row:(int)pRowIndex {
    DDPath * zDataObject = (DDPath *)
    [mutableArrayData objectAtIndex:pRowIndex];
    if (! zDataObject) {
        NSLog(@"tableView: objectAtIndex:%d = NULL",pRowIndex);
        return NULL;
    } // end if
    
    if ([[pTableColumn identifier] isEqualToString:@"Col_ID1"]) {
        return [[[zDataObject path] relativeString] stringByRemovingPercentEncoding];
    }
    
    return NULL;
    
} // end tableView:objectValueForTableColumn:row:


- (void)tableView:(NSTableView *)pTableViewObj
   setObjectValue:(id)pObject
   forTableColumn:(NSTableColumn *)pTableColumn
              row:(int)pRowIndex {
    
    DDPath * zDataObject   = (DDPath *)
    [mutableArrayData objectAtIndex:pRowIndex];
    
    if ([[pTableColumn identifier] isEqualToString:@"Col_ID1"]) {
        [zDataObject setPath:[[NSURL alloc] initFileURLWithPath:(NSString *) pObject]];
    }
    
    
} // end tableView:setObjectValue:forTableColumn:row:

//Delegate methods

-(void) notifyUserNameChanged:(NSString *) name{
    NSString * pw = [DDCredentialStore getPasswordForUserName:name];
    if(pw){
        [stbPassword setStringValue:pw];
    }
    [DDCurrentUserData setCurrentUserName:name];
    
}

-(void) notifyPasswordChanged:(NSString *) password{
    [DDCredentialStore createWithUserName:[DDCurrentUserData getCurrentUserName] andPassword:password];
}


@end
