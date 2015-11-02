//
//  FieldModel.h
//  BSDDinamicForm
//
//  Created by Sama Alessandro on 30/10/15.
//  Copyright © 2015 Sama Alessandro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Costanti.h"

@interface FieldModel : NSObject

@property(nonatomic,strong)NSString *headerName;
@property(nonatomic,assign)int pk;
@property(nonatomic,assign)TypeFormField type;
@property(nonatomic,strong)NSArray *answers;
@property(nonatomic,strong)NSArray *selectedAnswers;


@end
