//
//  MultipleChoiceViewController.m
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import "MultipleChoiceViewController.h"
#import "AnswerModel.h"

@interface MultipleChoiceViewController ()

@end

@implementation MultipleChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.answers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"multipleChoiceCell" forIndexPath:indexPath];
	AnswerModel *vm = self.answers[indexPath.row];
	cell.textLabel.text = vm.value;
	cell.accessoryType = vm.selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	AnswerModel *vm = self.answers[indexPath.row];
	vm.selected = !vm.selected;
	[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return self.headerSectionTitle;
}



- (IBAction)conferma:(id)sender {
	[self.delegate onConfermaButton:self.answers];
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
