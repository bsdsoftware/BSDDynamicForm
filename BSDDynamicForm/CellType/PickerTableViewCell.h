//
//  PickerTableViewCell.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerModel.h"

@interface PickerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitolo;
@property (weak, nonatomic) IBOutlet UIButton *btnScelta;
- (IBAction)scegli:(id)sender;
@property (nonatomic,strong)NSArray *risposte;
@property (nonatomic,strong)AnswerModel *selectedAnswer;

@end
