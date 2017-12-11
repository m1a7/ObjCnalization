//
//  RegexExpressionParser.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "RegexExpressionParser.h"

@implementation RegexExpressionParser

- (instancetype)initWithPattern:(NSString *)pattern
{
    self = [super init];
    if (self) {
        self.pattern = pattern;
    }
    return self;
}


- (id <ExpressionMatcher>) parse
{
    NSString* regex = [self regexPattern];
    if (regex){
        return [[RegexExpressionMatcher alloc] initWithPattern:regex];
    }
    return nil;
}

- (RegexPattern*) regexPattern
{
    NSString* patternFromEnum = [ExpressionPatternTypeObject getStringFromExpressionPatternType: ExpressionPatternTypeEnum_Regex];
    NSString* regex = [Regex firstMatchInString:self.pattern andPattern:[NSString stringWithFormat:@"(?<=^%@:).*",patternFromEnum]];
    
    if (regex){
        return regex;
    }
    
    return nil;
}


@end
