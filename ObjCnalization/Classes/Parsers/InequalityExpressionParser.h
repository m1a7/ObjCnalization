//
//  InequalityExpressionParser.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExpressionParser.h"
#import "InequalitySignObject.h"
#import "Regex.h"
#import "ExpressionPatternTypeObject.h"
#import "InequalityExpressionMatcher.h"



@interface InequalityExpressionParser : NSObject <ExpressionParser>

@property (nonatomic, strong) ExpressionPattern* pattern;

- (instancetype)initWithPattern:(NSString*) pattern;
- (id<ExpressionMatcher>) parse;


#pragma mark - Private methods

- (InequalitySignEnum) sign;
- (double) value;
- (double) getValueWithRegex:(NSString*) regex withFailureMessage:(NSString*) failureMessage withCapturingGroupIdx:(NSInteger) capturingGroupIdx;
- (InequalitySignEnum) getSignWithRegex:(NSString*) regex withFailureMessage:(NSString*) failureMessage withCapturingGroupIdx:(NSInteger) capturingGroupIdx;
@end
