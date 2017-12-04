//
//  InequalityExtendedExpressionParser.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "InequalityExtendedExpressionParser.h"
#import "InequalityExtendedExpressionMatcher.h"

@implementation InequalityExtendedExpressionParser


- (id<ExpressionMatcher>) parse
{
    InequalitySignEnum firstSign = [self firstSign];
    double firstValue            = [self firstValue];
    
    InequalitySignEnum secondSign = [self secondSign];
    double secondValue            = [self secondValue];
    

    if (firstSign && firstValue && secondSign && secondValue){
        
        if (firstValue < secondValue){
            firstSign = [InequalitySignObject invertWithValue: firstSign];
        }
        InequalityExpressionMatcher* leftMatcher  = [[InequalityExpressionMatcher alloc] initWithInequalitySignEnum:firstSign  withValue:firstValue];
        InequalityExpressionMatcher* rightMatcher = [[InequalityExpressionMatcher alloc] initWithInequalitySignEnum:secondSign withValue:secondValue];
        return [[InequalityExtendedExpressionMatcher alloc] initWithLeftMatcher:leftMatcher rightMatcher:rightMatcher];
    }
    return nil;
}


#pragma mark - Private methods

- (double) firstValue
{
    NSString* regExpExpressionPatternTypeEnum = [ExpressionPatternTypeObject getStringFromExpressionPatternType:ExpressionPatternTypeEnum_InequalityExtended];
    NSString* regExpSelf = @":(?<=^iex:)(-?\\d+[.]{0,1}[\\d]{0,})";
    
    NSString* fullRegex = [NSString stringWithFormat:@"%@%@",regExpExpressionPatternTypeEnum,regExpSelf];
    
    return [super getValueWithRegex:fullRegex withFailureMessage:@"Cannot find first value" withCapturingGroupIdx:1];
}

- (double) secondValue
{
    return [super getValueWithRegex:@"(?<=x<=|<)(-?\\d+[.]{0,1}[\\d]{0,})" withFailureMessage:@"Cannot find second value" withCapturingGroupIdx:1];
}

- (InequalitySignEnum) firstSign
{
    NSString* regExpExpressionPatternTypeEnum = [ExpressionPatternTypeObject getStringFromExpressionPatternType:ExpressionPatternTypeEnum_InequalityExtended];
    NSString* regExpSelf = @":-?\\d{0,}[.]?\\d{0,}(<=|<|)";
    NSString* fullRegex = [NSString stringWithFormat:@"%@%@",regExpExpressionPatternTypeEnum,regExpSelf];

    return [super getSignWithRegex:fullRegex withFailureMessage:@"Cannot find first sign" withCapturingGroupIdx:1];
}


- (InequalitySignEnum) secondSign
{
    NSString* regExpExpressionPatternTypeEnum = [ExpressionPatternTypeObject getStringFromExpressionPatternType:ExpressionPatternTypeEnum_InequalityExtended];
    NSString* regExpSelf = @":[-]?\\d*[.]?\\d*[<=>]{1,2}x(<=|<|)";
    NSString* fullRegex = [NSString stringWithFormat:@"%@%@",regExpExpressionPatternTypeEnum,regExpSelf];
    
    return [super getSignWithRegex:fullRegex withFailureMessage:@"Cannot find second sign" withCapturingGroupIdx:1];
}

@end
