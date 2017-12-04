//
//  SharedExpressionsLoader.m
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SharedExpressionsLoader.h"

@implementation SharedExpressionsLoader

+ (NSArray<SharedExpression*>*)loadExpressions:(NSDictionary<NSString*,NSString*>*) json
{
    __block NSMutableArray<SharedExpression*>* expressions = [NSMutableArray new];

    
    [json enumerateKeysAndObjectsUsingBlock:^(id identifier, id pattern, BOOL *stop) {
        [expressions addObject: [[SharedExpression alloc]init:identifier andPattern:pattern]];
    }];
    
    if (expressions.count > 0){
        return expressions;
    } else {
        NSLog(@"Array is empty");
        return nil;
           }
    
    return expressions;
}
@end
