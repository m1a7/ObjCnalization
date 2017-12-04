//
//  InequalityExpressionMatcher.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionMatcher.h"
#import "InequalitySignObject.h"

@interface InequalityExpressionMatcher : NSObject <ExpressionMatcher>

@property (nonatomic, assign) InequalitySignEnum sign;
@property (nonatomic, assign) double value;

- (instancetype)initWithInequalitySignEnum:(InequalitySignEnum) enumValue withValue:(double) value;
- (BOOL) validate:(NSString *)val;

@end
