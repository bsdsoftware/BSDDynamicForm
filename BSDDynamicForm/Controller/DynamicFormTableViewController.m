//
//  RegistrationTableViewController.m
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import "DynamicFormTableViewController.h"
#import "FieldModel.h"
#import "AnswerModel.h"
#import "TextTableViewCell.h"
#import "TextViewTableViewCell.h"
#import "PickerTableViewCell.h"
#import "MultipleChoiceTableViewCell.h"
#import "PickerViewController.h"
#import "MultipleChoiceViewController.h"
#import "ConfermaViewTableCell.h"
#import "ActionSheetPicker.h"


@interface DynamicFormTableViewController ()

@end

@implementation DynamicFormTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	FieldModel *modelConferma = [FieldModel new];
	modelConferma.type = TypeFormFieldConferma;
	
	self.fielList = [NSMutableArray new];
	[self.fielList addObject:modelConferma];
	
	[self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fielList count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	FieldModel *model = self.fielList[indexPath.row];
	switch (model.type) {
		case typeFormFieldText: {
			return 81;
			break;
		}
		case typeFormFieldTextView: {
			return 149;
			break;
		}
		case typeFormFieldRadioButton: {
			return 75;
			break;
		}
		case typeFormFieldCheckBox: {
			return 75;
			break;
		}
		case TypeFormFieldConferma: {
			return 80;
			break;
		}
		default:
			break;
	}
	return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	FieldModel *model = self.fielList[indexPath.row];
	UITableViewCell *cell;
	
	switch (model.type) {
		case typeFormFieldText: {
			TextTableViewCell *textCell = [tableView dequeueReusableCellWithIdentifier:@"cellText"];
			textCell.lblTitolo.text = model.headerName;
			cell = textCell;
			break;
		}
		case typeFormFieldTextView: {
			TextViewTableViewCell *textViewCell = [tableView dequeueReusableCellWithIdentifier:@"cellTextView"];
			textViewCell.lblTitolo.text = model.headerName;
			cell = textViewCell;
			break;
		}
		case typeFormFieldRadioButton: {
			PickerTableViewCell *pickerViewCell = [tableView dequeueReusableCellWithIdentifier:@"cellPicker"];
			pickerViewCell.lblTitolo.text = model.headerName;
			pickerViewCell.risposte = model.answers;
			for (AnswerModel *ans in model.answers) {
				if(ans.selected) {
					[pickerViewCell.btnScelta setTitle:ans.value forState:UIControlStateNormal];
					break;
				}
			}
			cell = pickerViewCell;
			break;
		}
		case typeFormFieldCheckBox: {
			MultipleChoiceTableViewCell *multipleChoiceCell = [tableView dequeueReusableCellWithIdentifier:@"cellMultipleChoice"];
			multipleChoiceCell.lblTitolo.text = model.headerName;
			multipleChoiceCell.answers = model.answers;
			[multipleChoiceCell setlabelSelectedAnswer];
			cell = multipleChoiceCell;
			break;
		}
		case TypeFormFieldConferma: {
			ConfermaViewTableCell *confermaCell = [tableView dequeueReusableCellWithIdentifier:@"cellConferma"];
			cell = confermaCell;
			break;
		}
		default:
			break;
	}
	
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if([segue.identifier isEqualToString:@"segueMultipleChoice"]) {
		NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
		FieldModel *fieldSelected = self.fielList[selectedIndex.row];
		MultipleChoiceViewController *multipleChoiceVC = segue.destinationViewController;
		MultipleChoiceTableViewCell *cell = [self.tableView cellForRowAtIndexPath:selectedIndex];
		multipleChoiceVC.delegate = cell;
		multipleChoiceVC.answers = fieldSelected.answers;
		multipleChoiceVC.headerSectionTitle = fieldSelected.headerName;
	}
}

-(void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
}



- (IBAction)annulla:(id)sender {
	
}

- (IBAction)conferma:(id)sender {
	for (int i = 0; i < (self.fielList.count -1); i++) {
		NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0] ;
		UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:index];
		FieldModel *model = self.fielList[i];
		if([cell isKindOfClass:[TextTableViewCell class]]){
			model.selectedAnswers = @[((TextTableViewCell *)cell).txtCampo.text];
		} else if([cell isKindOfClass:[TextViewTableViewCell class]]) {
			model.selectedAnswers = @[((TextViewTableViewCell *)cell).textViewCampo.text];
		} else if([cell isKindOfClass:[PickerTableViewCell class]]) {
			model.selectedAnswers = @[((PickerTableViewCell *)cell).selectedAnswer];
		} else if([cell isKindOfClass:[MultipleChoiceTableViewCell class]]) {
			model.selectedAnswers = ((MultipleChoiceTableViewCell *)cell).answers;
		} else if([cell isKindOfClass:[ConfermaViewTableCell class]]) {
			
		}
	}
	
	[self.delegate onFormConfirm:self.fielList];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView {
	[textView resignFirstResponder];
	return YES;
}

@end





















