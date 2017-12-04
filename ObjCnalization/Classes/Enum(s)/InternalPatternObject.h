//
//  InternalPattern.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    InternalPatternEnum_Expression,
    InternalPatternEnum_ExpressionPatternType,
    InternalPatternEnum_KeyWithoutExpression
    
} InternalPatternEnum;


@interface InternalPatternObject : NSObject

+(NSString*) getStringFromInternalPatternEnum:(InternalPatternEnum) enumType;

@end

