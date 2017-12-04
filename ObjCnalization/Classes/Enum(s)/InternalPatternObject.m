//
//  InternalPattern.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "InternalPatternObject.h"

@implementation InternalPatternObject

+(NSString*) getStringFromInternalPatternEnum:(InternalPatternEnum) enumType
{
    NSString *result = nil;
    switch(enumType) {
        case InternalPatternEnum_Expression:             result = @"(?<=\\{)(.+)(?=\\})"; break;
        case InternalPatternEnum_ExpressionPatternType:  result = @"(^.{2,3})(?=:)";      break;
        case InternalPatternEnum_KeyWithoutExpression:   result = @"^(.*?)(?=\\{)";       break;
            
        default: result = @"unknown";
    }
    return result;
}

@end
