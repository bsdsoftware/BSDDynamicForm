//
//  AnswerModel.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnswerModel : NSObject

@property(nonatomic,assign)int pk;
@property(nonatomic,strong) NSString *value;
@property(nonatomic, assign)BOOL selected;


@end
