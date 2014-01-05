//
//  DDTableController.h
//  DataDeployer
//
//  Created by mko on 23.12.13.
//  Copyright (c) 2013 Markus Kosmal. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "../Application/DDApplicationData.h"
#import "DDProgressWindowController.h"
#import "../Model/DDPath.h"
#import "DDUserDataChangedDelegate.h"

@interface DDMainWindowController : NSObject<DDUserDataChangedDelegate>{
@private
    DDProgressWindowController * progressWindowController;
}

@property NSMutableArray * mutableArrayData;
@property IBOutlet NSTableView * tableView;

@property NSString * outputFileName;

@property (weak) IBOutlet NSTextField *tbWorkingDirectory;
@property (weak) IBOutlet NSTextField *tbServerUrl;
@property (weak) IBOutlet NSTextField *tbUserName;
@property (weak) IBOutlet NSSecureTextField *stbPassword;

@property  IBOutlet id<NSTextFieldDelegate>  userNameDelegate;
@property  IBOutlet id<NSTextFieldDelegate> passwordDelegate;

- (IBAction)openChooseWorkingDirectory:(id)sender;

- (IBAction)chooseData:(id)sender;
- (IBAction)publish:(id)sender;

- (void)addRow:(DDPath *)pDataObj;

- (int)numberOfRowsInTableView:(NSTableView *)pTableViewObj;

- (id) tableView:(NSTableView *)pTableViewObj
objectValueForTableColumn:(NSTableColumn *)pTableColumn
             row:(int)pRowIndex;

- (void)tableView:(NSTableView *)pTableViewObj
   setObjectValue:(id)pObject
   forTableColumn:(NSTableColumn *)pTableColumn
              row:(int)pRowIndex;

@end
