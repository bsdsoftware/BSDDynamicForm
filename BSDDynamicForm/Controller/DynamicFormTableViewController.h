//
//  RegistrationTableViewController.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynamicFormProtocol;

@interface DynamicFormTableViewController : UITableViewController <UITextFieldDelegate,UITextViewDelegate>

- (IBAction)annulla:(id)sender;
- (IBAction)conferma:(id)sender;

@property(nonatomic,weak)id<DynamicFormProtocol> delegate;
@property(nonatomic,strong)	NSMutableArray *fieldList;

@end


@protocol DynamicFormProtocol <NSObject>

-(void)onFormConfirm:(NSArray *)fieldsList;

@end