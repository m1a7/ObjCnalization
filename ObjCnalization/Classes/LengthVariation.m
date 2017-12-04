//
//  LengthVariation.m
//  ObjCnalization
//
//  Created by Uber on 20/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "LengthVariation.h"

@implementation LengthVariation

- (instancetype)initWithWidth:(NSInteger) width strValue:(NSString*) value
{
    self = [super init];
    if (self) {
        self.width = width;
        self.value = value;
    }
    return self;
}

@end
