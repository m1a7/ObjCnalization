//
//  ExpressionParser.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionMatcher.h"

typedef NSString ExpressionPattern;


@protocol ExpressionParser <NSObject>

@property (nonatomic, strong) ExpressionPattern* pattern;

- (id<ExpressionMatcher>) parse;
- (instancetype)initWithPattern:(NSString*) pattern;


@end
