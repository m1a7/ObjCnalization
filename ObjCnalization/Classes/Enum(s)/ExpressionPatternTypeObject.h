//
//  ExpressionPattern.h
//  ObjCnalization
//
//  Created by Uber on 20/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { ExpressionPatternTypeEnum_Inequality,
               ExpressionPatternTypeEnum_InequalityExtended,
               ExpressionPatternTypeEnum_Regex,
    
               ExpressionPatternTypeEnum_ErrorInitialization
    
} ExpressionPatternTypeEnum;


@interface ExpressionPatternTypeObject : NSObject

+(NSString*) getStringFromExpressionPatternType:(ExpressionPatternTypeEnum) enumType;

+(ExpressionPatternTypeEnum) getEnumValueFromString:(NSString*) enumTypeInString;

@end




