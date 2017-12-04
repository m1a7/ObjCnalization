//
//  InequalitySignObject.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "InequalitySignObject.h"


@implementation InequalitySignObject

+(NSString*) getStringFromInequalitySignEnum:(InequalitySignEnum) enumType
{
    NSString *result = nil;
    switch(enumType) {
        case InequalitySignEnum_LessThan:            result = @"<";  break;
        case InequalitySignEnum_LessThanOrEqual:     result = @"<=";  break;
        case InequalitySignEnum_Equal:               result = @"=";  break;
        case InequalitySignEnum_GreaterThanOrEqual:  result = @">=";  break;
        case InequalitySignEnum_GreaterThan:         result = @">";  break;

        default: result = @"unknown";
    }
    return result;
}

+(InequalitySignEnum) getEnumValueFromString:(NSString*) enumTypeInString
{
    if ([enumTypeInString isEqualToString:@"<"])  return InequalitySignEnum_LessThan;
    if ([enumTypeInString isEqualToString:@"<="]) return InequalitySignEnum_LessThanOrEqual;
    if ([enumTypeInString isEqualToString:@"="])  return InequalitySignEnum_Equal;
    if ([enumTypeInString isEqualToString:@">="]) return InequalitySignEnum_GreaterThanOrEqual;
    if ([enumTypeInString isEqualToString:@">"])  return InequalitySignEnum_GreaterThan;
    if (YES) NSLog(@"File=(InequalitySignObject.m) | Method=+(InequalitySignEnum) getEnumValueFromString = InequalitySignEnum_ErrorInitialization");
        
    return InequalitySignEnum_ErrorInitialization;
}

+(InequalitySignEnum) invertWithValue:(InequalitySignEnum) enumValue
{
    switch(enumValue) {
        case InequalitySignEnum_LessThan:            return InequalitySignEnum_GreaterThan;         break;
        case InequalitySignEnum_LessThanOrEqual:     return InequalitySignEnum_GreaterThanOrEqual;  break;
        case InequalitySignEnum_Equal:               return InequalitySignEnum_Equal;               break;
        case InequalitySignEnum_GreaterThanOrEqual:  return InequalitySignEnum_LessThanOrEqual;     break;
        case InequalitySignEnum_GreaterThan:         return InequalitySignEnum_LessThan;            break;
            
        default: NSLog(@"File=(InequalitySignObject.m) method=(invertWithValue) | Not found enum value in switch"); break;
    }
    
    return InequalitySignEnum_ErrorInitialization;
}

@end
