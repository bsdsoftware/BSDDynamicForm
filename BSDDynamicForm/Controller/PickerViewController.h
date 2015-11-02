//
//  PickerViewController.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnConferma;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic,strong) NSArray *objects;
- (IBAction)conferma:(id)sender;


@end
