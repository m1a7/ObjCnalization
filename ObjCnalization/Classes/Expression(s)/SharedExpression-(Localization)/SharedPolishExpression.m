//
//  SharedPolishExpression.m
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SharedPolishExpression.h"

@implementation SharedPolishExpression

+(NSArray<SharedExpression*>*) allExpressions
{
    NSArray* allExpression = @[
                               /**
                                (2-4), (22-24), (32-4), ..., (..>22, ..>23, ..>24)
                                
                                e.g.
                                - 22 samochody, 1334 samochody, 53 samochody
                                - 2 minuty, 4 minuty, 23 minuty
                                */
                               [[SharedExpression alloc] init:@"few"   andPattern:@"exp:(((?!1).[2-4]{1})$)|(^[2-4]$)"],
                               
                               /**
                                0, (5-9), (10-21), (25-31), ..., (..0, ..1, ..5-9)
                                
                                e.g.
                                - 0 samochodów, 10 samochodów, 26 samochodów, 1147 samochodów
                                - 5 minut, 18 minut, 117 minut, 1009 minut
                                */
                               [[SharedExpression alloc] init:@"many"  andPattern:@"exp:(^[05-9]$)|(.*(?=1).[0-9]$)|(^[0-9]{1}.*[0156789]$)"]
                               
                               ];
    
    return allExpression;
}


@end
