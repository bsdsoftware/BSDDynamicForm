//
//  MultipleChoiceTableViewCell.m
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import "MultipleChoiceTableViewCell.h"


@implementation MultipleChoiceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)onConfermaButton:(NSArray *)answers {
	self.answers = answers;
	[self setlabelSelectedAnswer];
}


-(void)setlabelSelectedAnswer {
	NSString *labelText = @"";
	BOOL first = YES;
	for (AnswerModel *ans in self.answers) {
		if(ans.selected) {
			if(first){
				labelText = [labelText stringByAppendingString:ans.value];
				first = NO;
			} else {
				labelText = [[labelText stringByAppendingString:@" - "]stringByAppendingString:ans.value];
			}
		}
	}
	self.lblRisposte.text = labelText;
}


@end
