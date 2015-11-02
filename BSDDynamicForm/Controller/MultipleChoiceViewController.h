//
//  MultipleChoiceViewController.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MultipleChoiceViewControllerDelegate;


@interface MultipleChoiceViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnConferma;
@property (weak, nonatomic) NSArray *answers;
@property (nonatomic, weak) id<MultipleChoiceViewControllerDelegate> delegate;
@property (nonatomic,strong)NSString *headerSectionTitle;

- (IBAction)conferma:(id)sender;

@end

@protocol MultipleChoiceViewControllerDelegate <NSObject>

-(void)onConfermaButton:(NSArray *)answers;

@end