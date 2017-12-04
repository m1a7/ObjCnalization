//
//  RegexExpressionMatcher.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionMatcher.h"

typedef NSString RegexPattern;

@interface RegexExpressionMatcher : NSObject <ExpressionMatcher>

@property (nonatomic, strong) RegexPattern* pattern;

- (instancetype)initWithPattern:(RegexPattern*) pattern;
- (BOOL) validate:(NSString*) val;


@end
