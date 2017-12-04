//
//  InequalityExtendedExpressionMatcher.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionMatcher.h"
#import "InequalityExpressionMatcher.h"

@interface InequalityExtendedExpressionMatcher : NSObject <ExpressionMatcher>


@property (nonatomic, strong) InequalityExpressionMatcher* leftMatcher;
@property (nonatomic, strong) InequalityExpressionMatcher* rightMatcher;

- (instancetype)initWithLeftMatcher:(InequalityExpressionMatcher*) left rightMatcher:(InequalityExpressionMatcher*) right;
- (BOOL) validate:(NSString *)val;

@end
