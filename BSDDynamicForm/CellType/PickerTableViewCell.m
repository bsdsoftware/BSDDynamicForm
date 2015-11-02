//
//  PickerTableViewCell.m
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import "PickerTableViewCell.h"
#import "ActionSheetPicker.h"


@implementation PickerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)scegli:(id)sender {
	NSInteger idxSelezionato = 0;
	
	for(int i = 0;i<self.risposte.count;i++) {
		if(((AnswerModel *)self.risposte[i]).selected){
			idxSelezionato = i;
			break;
		}
	}
	
	ActionSheetStringPicker *picker = [[ActionSheetStringPicker alloc] initWithTitle:@"Scelta"
																				rows:[self getValoreRisposte]
																	initialSelection:idxSelezionato
																		   doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, NSString *selectedValue) {
																			   [self.btnScelta setTitle:selectedValue forState:UIControlStateNormal];
																			   [self setRispostaSelezionata:selectedIndex];
																		   }
																		 cancelBlock:nil
																			  origin:sender];
	
	[picker setDoneButton:[[UIBarButtonItem alloc] initWithTitle:@"Scegli" style:UIBarButtonItemStylePlain target:nil action:nil]];
	picker.hideCancel = YES;
	[picker showActionSheetPicker];
}


-(NSArray *)getValoreRisposte {
	NSMutableArray *risp = [NSMutableArray new];
	for (AnswerModel *ans in self.risposte) {
		[risp addObject:ans.value];
	}
	
	return risp;
}

-(void)setRispostaSelezionata:(NSInteger)index {
	self.selectedAnswer = self.risposte[index];
	for (AnswerModel *answer in self.risposte) {
		answer.selected = NO;
	}
	((AnswerModel *)self.risposte[index]).selected = YES;
}

@end
