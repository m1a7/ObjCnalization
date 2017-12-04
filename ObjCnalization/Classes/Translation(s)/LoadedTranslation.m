//
//  LoadedTranslation.m
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "LoadedTranslation.h"

@implementation LoadedTranslation

- (instancetype)initWithType:(LoadedTranslationTypeEnum) type andKey:(NSString*) key andContent:(NSDictionary<NSString*, id>*) content;
{
    self = [super init];
    if (self) {
        self.typeEnum = type;
        self.keyForDict  = key;
        self.content = [NSDictionary dictionaryWithDictionary:content];
    }
    return self;
}
@end
