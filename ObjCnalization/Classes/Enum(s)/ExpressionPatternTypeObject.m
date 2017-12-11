//
//  ExpressionPattern.m
//  ObjCnalization
//
//  Created by Uber on 20/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ExpressionPatternTypeObject.h"


@implementation ExpressionPatternTypeObject

+(NSString*) getStringFromExpressionPatternType:(ExpressionPatternTypeEnum) enumType
{
    NSString *result = nil;
    switch(enumType) {
        case ExpressionPatternTypeEnum_Inequality:          result = @"ie";  break;
        case ExpressionPatternTypeEnum_InequalityExtended:  result = @"iex";  break;
        case ExpressionPatternTypeEnum_Regex:               result = @"exp";  break;
       
        default: result = @"unknown";
    }
    return result;
}

+(ExpressionPatternTypeEnum) getEnumValueFromString:(NSString*) enumTypeInString
{
    if ([enumTypeInString isEqualToString:@"ie"])  return ExpressionPatternTypeEnum_Inequality;
    if ([enumTypeInString isEqualToString:@"iex"]) return ExpressionPatternTypeEnum_InequalityExtended;
    if ([enumTypeInString isEqualToString:@"exp"]) return ExpressionPatternTypeEnum_Regex;
    else {

    }
    
    return ExpressionPatternTypeEnum_ErrorInitialization;
}
@end

