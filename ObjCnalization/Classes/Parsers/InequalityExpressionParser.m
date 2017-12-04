//
//  InequalityExpressionParser.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "InequalityExpressionParser.h"

@implementation InequalityExpressionParser 


- (instancetype)initWithPattern:(NSString*) pattern;
{
    self = [super init];
    if (self) {
        self.pattern = pattern;
    }
    return self;
}



- (id<ExpressionMatcher>) parse
{
    InequalitySignEnum sign = [self sign];
    double value            = [self value];
    

    if (sign && value){
        return [[InequalityExpressionMatcher alloc] initWithInequalitySignEnum:sign withValue:value];
    }
    return nil;
}



#pragma mark - Private methods

/*   List of Methods
 
 - (InequalitySignEnum) sign...
 - (double) value...
 - (double) getValueWithRegex...
 - (InequalitySignEnum) getSignWithRegex...
*/


- (InequalitySignEnum) sign
{
    NSString* fullRegex = [NSString stringWithFormat:@"%@%@", [ExpressionPatternTypeObject getStringFromExpressionPatternType:
                                                               ExpressionPatternTypeEnum_Inequality],
                                                               @":x(<=|<|=|>=|>)"];
    
    return [self getSignWithRegex:fullRegex withFailureMessage:@"Cannot find any sign" withCapturingGroupIdx:1];
}


- (double) value
{
    NSString* fullRegex = [NSString stringWithFormat:@"%@%@", [ExpressionPatternTypeObject getStringFromExpressionPatternType:
                                                               ExpressionPatternTypeEnum_Inequality],
                                                                @":x[^-\\d]{1,2}(-?\\d+[.]{0,1}[\\d]{0,})"];
    
    return [self getValueWithRegex:fullRegex withFailureMessage:@"Cannot find any value" withCapturingGroupIdx:1];
}



- (double) getValueWithRegex:(NSString*) regex withFailureMessage:(NSString*) failureMessage withCapturingGroupIdx:(NSInteger) capturingGroupIdx
{
    NSString* value = [Regex matchInString:self.pattern andPattern:regex andCapturingGroupIdx:capturingGroupIdx];
    
    if (value){
        return  [value doubleValue];
    } else {
        NSLog(@"failureMessage = %@ | pattern = %@ | regex = %@",failureMessage, self.pattern, regex);
    }
    return 0;
}


- (InequalitySignEnum) getSignWithRegex:(NSString*) regex withFailureMessage:(NSString*) failureMessage withCapturingGroupIdx:(NSInteger) capturingGroupIdx
{
    NSString* rawValue = [Regex matchInString:self.pattern andPattern:regex andCapturingGroupIdx:capturingGroupIdx];
    InequalitySignEnum sign = [InequalitySignObject getEnumValueFromString:rawValue];
    
    if (sign){
        return sign;
    } else {
        NSLog(@"failureMessage = %@ | pattern = %@ | regex = %@ | InequalitySignEnum_ErrorInitialization",failureMessage, self.pattern, regex);
        
    }
    return InequalitySignEnum_ErrorInitialization;
}

@end
