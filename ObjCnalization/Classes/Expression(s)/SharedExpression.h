//
//  SharedExpression.h
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SharedExpression : NSObject

@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* pattern;

- (instancetype)init:(NSString*)identifier andPattern:(NSString*) pattern;

@end


@protocol SharedExpressionProtocol <NSObject>

+ (NSArray<SharedExpression*>*)allExpressions;

@end
