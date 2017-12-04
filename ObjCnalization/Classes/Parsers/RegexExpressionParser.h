//
//  RegexExpressionParser.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionParser.h"
#import "ExpressionMatcher.h"
#import "RegexExpressionMatcher.h"
#import "Regex.h"
#import "ExpressionPatternTypeObject.h"

typedef NSString ExpressionPattern;

@interface RegexExpressionParser : NSObject <ExpressionParser>


@property (nonatomic, strong) ExpressionPattern* pattern;

- (instancetype)initWithPattern:(NSString *)pattern;
- (id <ExpressionMatcher>) parse;

@end
