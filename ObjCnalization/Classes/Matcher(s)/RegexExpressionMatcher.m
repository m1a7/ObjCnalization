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
        NSLog(@"-----------------");
        NSLog(@"|Создается RegexExpressionMatcher");
        NSLog(@"|self.pattern = %@",self.pattern);
        NSLog(@"-----------------");
    
    
        /*
        Вот такой должен быть паттерн
        -----------------
        |Создается RegexExpressionMatcher
        |self.pattern = (((?!1).[2-4]{1})$)|(^[2-4]$)
        -----------------
         */
    }
    return self;
}

- (BOOL) validate:(NSString*) val
{
    return  [Regex firstMatchInString:val andPattern:self.pattern] != nil;
}

@end
