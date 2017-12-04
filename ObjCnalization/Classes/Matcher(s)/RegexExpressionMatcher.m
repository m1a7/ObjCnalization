//
//  RegexExpressionMatcher.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "RegexExpressionMatcher.h"
#import "Regex.h"

@implementation RegexExpressionMatcher

- (instancetype)initWithPattern:(RegexPattern*) pattern
{
    self = [super init];
    if (self) {
        self.pattern = pattern;
    }
    return self;
}

- (BOOL) validate:(NSString*) val
{
    return  [Regex firstMatchInString:val andPattern:self.pattern] != nil;
}

@end
