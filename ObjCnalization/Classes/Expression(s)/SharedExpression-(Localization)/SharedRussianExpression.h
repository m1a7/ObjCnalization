//
//  SharedRussianExpression.h
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SharedExpression.h"
@interface SharedRussianExpression : NSObject <SharedExpressionProtocol>

+(NSArray<SharedExpression*>*) allExpressions;

@end
