//
//  PickerViewController.m
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()
@property (nonatomic,strong)NSString *selectedAnswer;


@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)pickerView:(UIPickerView *)pV didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	self.selectedAnswer = self.objects[row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [self.objects count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return self.objects[row];
}


- (IBAction)conferma:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
	NSLog(@"%@",self.selectedAnswer);
}


@end
