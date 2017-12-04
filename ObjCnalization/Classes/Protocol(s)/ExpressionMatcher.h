//
//  ExpressionMatcher.h
//  ObjCnalization
//
//  Created by Uber on 20/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Protocol that is the base protocol to conform for expression matchers like
 `InequalityExpressionMatcher` or `RegexExpressionMatcher`.
 */

@protocol ExpressionMatcher <NSObject>

/**
 Method used to validate passed `val` parameter.
 
 :param: val string value that will be used to match expression.
 :returns: `true` if value matches expression, otherwise `false`.
 */

- (BOOL) validate:(NSString*) val;

@end


