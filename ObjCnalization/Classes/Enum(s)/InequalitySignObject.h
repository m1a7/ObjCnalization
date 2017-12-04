//
//  InequalitySignObject.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    InequalitySignEnum_LessThan,
    InequalitySignEnum_LessThanOrEqual,
    InequalitySignEnum_Equal,
    InequalitySignEnum_GreaterThanOrEqual,
    InequalitySignEnum_GreaterThan,
    
    InequalitySignEnum_ErrorInitialization
    
} InequalitySignEnum;


@interface InequalitySignObject : NSObject

+(NSString*) getStringFromInequalitySignEnum:(InequalitySignEnum) enumType;

+(InequalitySignEnum) getEnumValueFromString:(NSString*) enumTypeInString;

+(InequalitySignEnum) invertWithValue:(InequalitySignEnum) enumValue;

@end
