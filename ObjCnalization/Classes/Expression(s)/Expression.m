//
//  Expression.m
//  ObjCnalization
//
//  Created by Uber on 20/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "Expression.h"

#import "LengthVariation.h"
#import "Regex.h"
#import "InternalPatternObject.h"
#import "InequalityExpressionParser.h"
#import "InequalityExtendedExpressionParser.h"
#import "RegexExpressionParser.h"

@implementation Expression


- (instancetype)initWithPattern:(NSString*) pattern andValue:(NSString*) value andLenghtVariations:(NSArray<LengthVariation*>*) lengthVariations
{
    self = [super init];
    if (self) {
        
        self.pattern = pattern;
        self.value   = value;

        if (lengthVariations){
            self.lengthVariations = [NSMutableArray arrayWithArray:lengthVariations];
        }
        
        ExpressionPatternTypeEnum enumExpression = [self getExpressionType:pattern];
        
 
        if (enumExpression == ExpressionPatternTypeEnum_ErrorInitialization){

        }
        
        if (enumExpression){
            switch(enumExpression) {
                case ExpressionPatternTypeEnum_Inequality:          self.expressionMatcher = [[[InequalityExpressionParser         alloc] initWithPattern:pattern]  parse];  break;
                case ExpressionPatternTypeEnum_InequalityExtended:  self.expressionMatcher = [[[InequalityExtendedExpressionParser alloc] initWithPattern: pattern] parse];  break;
                case ExpressionPatternTypeEnum_Regex:               self.expressionMatcher = [[[RegexExpressionParser              alloc] initWithPattern:pattern]  parse];  break;
               
                case ExpressionPatternTypeEnum_ErrorInitialization:  break;
                
                default: break;
            }
        }
    }
    return self;
}


- (BOOL) validate:(NSString*) val
{
    if (self.expressionMatcher){
        return  [self.expressionMatcher validate:val];
    }
    return [self.pattern isEqualToString:val];
}

- (ExpressionPatternTypeEnum) getExpressionType:(ExpressionPattern*) pattern
{
    NSString* patternForRegex = [InternalPatternObject getStringFromInternalPatternEnum: InternalPatternEnum_ExpressionPatternType];
    NSString* result = [Regex firstMatchInString:pattern andPattern:patternForRegex];

    if (result){
        return [ExpressionPatternTypeObject getEnumValueFromString:result];
    } 
    
    return ExpressionPatternTypeEnum_ErrorInitialization;
}



@end

