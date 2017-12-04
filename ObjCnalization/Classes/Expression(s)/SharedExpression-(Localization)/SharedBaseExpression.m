//
//  SharedBaseExpression.m
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SharedBaseExpression.h"

@implementation SharedBaseExpression

+(NSArray<SharedExpression*>*) allExpressions
{
    NSArray* allExpression = @[  /**
                                  Matches value equals 1.
                                  */
                               [[SharedExpression alloc] init:@"one"   andPattern:@"ie:x=1"],
                             
                               /**
                                Matches value greater than 1.
                                */
                               [[SharedExpression alloc] init:@">one"  andPattern:@"ie:x>1"],
                              
                               /**
                                Matches value equals 2.
                                */
                               [[SharedExpression alloc] init:@"two"   andPattern:@"ie:x=2"],
                               
                               /**
                                Matches value other than 1.
                                */
                               [[SharedExpression alloc] init:@"other" andPattern:@"exp:(^[^1])|(^\\d{2,})"]];
    
    return allExpression;
}


@end
