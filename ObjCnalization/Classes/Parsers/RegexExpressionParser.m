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
        // Должно быть так:  exp:(^1$)|(^[^1]1$)|(^[1-9][0-9]?[0,2,3,4,5,6,7,8,9]+1$)
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
    //NSString* regex = [Regex firstMatchInString:self.pattern andPattern:patternFromEnum];

    // Должно быть:  (((?!1).[2-4]{1})$)|(^[2-4]$)
    NSString* regex = [Regex firstMatchInString:self.pattern andPattern:[NSString stringWithFormat:@"(?<=^%@:).*",patternFromEnum]];
    
    if (regex){
        return regex;
    } else {
        NSLog(@"Cannot find any regular expression, pattern: %@",self.pattern);
    }
    return nil;
}


@end
