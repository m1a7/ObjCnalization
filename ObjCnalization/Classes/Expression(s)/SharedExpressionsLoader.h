//
//  SharedExpressionsLoader.h
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SharedExpression.h"

@interface SharedExpressionsLoader : NSObject

+ (NSArray<SharedExpression*>*)loadExpressions:(NSDictionary<NSString*,NSString*>*) json;

@end
