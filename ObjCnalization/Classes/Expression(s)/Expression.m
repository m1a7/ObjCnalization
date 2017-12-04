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
        
        if ([pattern isEqualToString:@"welcome"] || [value isEqualToString:@"welcome"]){
            
        }
        
        self.pattern = pattern;
        self.value   = value;
        //self.lengthVariations = (!lengthVariations) ? [NSMutableArray arrayWithArray:lengthVariations] : [NSMutableArray array];
        if (lengthVariations){
            self.lengthVariations = [NSMutableArray arrayWithArray:lengthVariations];
        }
        
        ExpressionPatternTypeEnum enumExpression = [self getExpressionType:pattern];
        
        if ([value isEqualToString:@"welcome"]){
            
        }
        
        if (enumExpression == ExpressionPatternTypeEnum_ErrorInitialization){
            NSLog(@"Осторожно ExpressionPatternTypeEnum_ErrorInitialization в файле Expression.m | метод = - (instancetype)initWithPattern");
        }
        
        if (enumExpression){

            
            switch(enumExpression) {
                case ExpressionPatternTypeEnum_Inequality:          self.expressionMatcher = [[[InequalityExpressionParser         alloc] initWithPattern:pattern]  parse];  break;
                case ExpressionPatternTypeEnum_InequalityExtended:  self.expressionMatcher = [[[InequalityExtendedExpressionParser alloc] initWithPattern: pattern] parse];  break;
                case ExpressionPatternTypeEnum_Regex:               self.expressionMatcher = [[[RegexExpressionParser              alloc] initWithPattern:pattern]  parse];  break;
               
                case ExpressionPatternTypeEnum_ErrorInitialization:  NSLog(@"File=(Expression.m) Method=(initWithPattern) ExpressionPatternTypeEnum_ErrorInitialization"); break;
                
                default: NSLog(@"-switch(enumExpression) - default"); break;
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

    // result должен равняться примерно exp что то в этом роде
    if (result){
        return [ExpressionPatternTypeObject getEnumValueFromString:result];
    } else {
        NSLog(@"Expression.m потенциально enum == ExpressionPatternTypeEnum_ErrorInitialization");
    }
    
    return ExpressionPatternTypeEnum_ErrorInitialization;
}



@end

