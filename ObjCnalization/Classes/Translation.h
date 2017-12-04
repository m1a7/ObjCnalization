//
//  Translation.h
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Expression;


@interface Translation : NSObject

@property (nonatomic, strong) NSString* key;
@property (nonatomic, strong) NSArray<Expression*>* expressions;

- (NSString*) validate:(NSString*) text andFittingWidth:(NSInteger) fittingWidth;

- (instancetype)initWithKey:(NSString*) key andExpressions:(NSArray<Expression*>*) expressions;

@end
