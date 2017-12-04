//
//  LoadedTranslation.h
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadedTranslationTypeObject.h"

@interface LoadedTranslation : NSObject

@property (nonatomic, assign) LoadedTranslationTypeEnum typeEnum;

@property (nonatomic, strong) NSString* keyForDict;

@property (nonatomic, strong) NSDictionary<NSString*, id>* content;

- (instancetype)initWithType:(LoadedTranslationTypeEnum) type andKey:(NSString*) key andContent:(NSDictionary<NSString*, id>*) content;

@end

