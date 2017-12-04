//
//  SharedExpression.m
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SharedExpression.h"

@implementation SharedExpression

- (instancetype)init:(NSString*)identifier andPattern:(NSString*) pattern
{
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.pattern    = pattern;
    }
    return self;
}

@end
