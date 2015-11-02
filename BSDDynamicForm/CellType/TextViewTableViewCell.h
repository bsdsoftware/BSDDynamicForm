//
//  TextViewTableViewCell.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewTableViewCell : UITableViewCell <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblTitolo;
@property (weak, nonatomic) IBOutlet UITextView *textViewCampo;


@end
