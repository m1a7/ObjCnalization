//
//  InequalityExpressionMatcher.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "InequalityExpressionMatcher.h"

@implementation InequalityExpressionMatcher

- (instancetype)initWithInequalitySignEnum:(InequalitySignEnum) enumValue withValue:(double) value
{
    self = [super init];
    if (self) {
        self.sign  = enumValue;
        self.value = value;
    }
    return self;
}

- (BOOL) validate:(NSString *)val
{
    double n = val.doubleValue;
    
    switch(self.sign) {
        case InequalitySignEnum_LessThan:            return n <  self.value;  break;
        case InequalitySignEnum_LessThanOrEqual:     return n <= self.value;  break;
        case InequalitySignEnum_Equal:               return n == self.value;  break;
        case InequalitySignEnum_GreaterThanOrEqual:  return n >= self.value;  break;
        case InequalitySignEnum_GreaterThan:         return n >  self.value;  break;
            
        default:  break;
    }
   
    return NO;
}
@end
