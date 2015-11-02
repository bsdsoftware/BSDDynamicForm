//
//  MultipleChoiceTableViewCell.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultipleChoiceViewController.h"
#import "AnswerModel.h"

@interface MultipleChoiceTableViewCell : UITableViewCell <MultipleChoiceViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblTitolo;
@property (weak, nonatomic) IBOutlet UILabel *lblRisposte;
@property (nonatomic,strong)NSArray *answers;

-(void)setlabelSelectedAnswer;

@end
