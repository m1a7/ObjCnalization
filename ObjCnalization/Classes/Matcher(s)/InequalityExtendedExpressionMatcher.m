//
//  InequalityExtendedExpressionMatcher.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "InequalityExtendedExpressionMatcher.h"

@implementation InequalityExtendedExpressionMatcher

- (instancetype)initWithLeftMatcher:(InequalityExpressionMatcher*) left rightMatcher:(InequalityExpressionMatcher*) right
{
    self = [super init];
    if (self) {
        self.leftMatcher  = left;
        self.rightMatcher = right;
    }
    return self;
}

- (BOOL) validate:(NSString *)val
{
    return [self.leftMatcher validate:val] && [self.rightMatcher validate:val];
}

@end
