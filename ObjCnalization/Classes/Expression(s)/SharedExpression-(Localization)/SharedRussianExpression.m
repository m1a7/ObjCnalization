//
//  SharedRussianExpression.m
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SharedRussianExpression.h"

@implementation SharedRussianExpression

+(NSArray<SharedExpression*>*) allExpressions
{
    NSArray* allExpression = @[
                               /**
                                1, 21, 31, 41, 51, 61, 71, 81, 101, 1001, …
                                
                                v = 0 and
                                i % 10 = 1 and
                                i % 100 != 11
                                
                                e.g.
                                - из 1 книги за 1 день
                                */
                               [[SharedExpression alloc] init:@"one"   andPattern:@"exp:(^1$)|(^[^1]1$)|(^[1-9][0-9]?[0,2,3,4,5,6,7,8,9]+1$)"],
                               
                             
                               /**
                                2~4, 22~24, 32~34, 42~44, 52~54, 62, 102, 1002, …
                                
                                v = 0 and
                                i % 10 = 2..4 and
                                i % 100 != 12..14
                                
                                e.g.
                                - из 2 книг за 2 дня
                                */
                               [[SharedExpression alloc] init:@"few"  andPattern:@"exp:(^[2-4]$)|(^[2-9][2-4]$)|([1-9]+[0-9]*[^1][2-4]$)"],
                               
                               /**
                                0, 5~20, 100, 1000, 10000, 100000, 1000000, …
                                
                                v = 0 and
                                i % 10 = 0 or
                                v = 0 and
                                i % 10 = 5..9 or
                                v = 0 and
                                i % 100 = 11..14
                                
                                e.g.
                                - из 5 книг за 5 дней
                                */
                               [[SharedExpression alloc] init:@"many"  andPattern:@"exp:(^[05-9]$)|(^1[1-4]$)|(^[1-9]+[0-9]*[5-9]$)|(^[1-9]+[0-9]*1{1}[1-4]$)|([1-9]+[0-9]*0$)"]
                               ];
    
    return allExpression;
}


@end
