//
//  Expression.h
//  ObjCnalization
//
//  Created by Uber on 20/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "ExpressionMatcher.h"


//  TypeAlias in Objective-C
typedef NSString ExpressionPattern;


@class  LengthVariation;

#import "ExpressionPatternTypeObject.h"

@interface Expression : NSObject

@property (strong, nonatomic) ExpressionPattern* pattern;
@property (strong, nonatomic) NSString*   value;
@property (strong, nonatomic) NSMutableArray<LengthVariation*>* lengthVariations;

@property (strong, nonatomic) id <ExpressionMatcher> expressionMatcher;


- (BOOL) validate:(NSString*) val;
- (ExpressionPatternTypeEnum) getExpressionType:(ExpressionPattern*) pattern;

- (instancetype)initWithPattern:(NSString*) pattern andValue:(NSString*) value andLenghtVariations:(NSArray<LengthVariation*>*) lengthVariations;

@end



