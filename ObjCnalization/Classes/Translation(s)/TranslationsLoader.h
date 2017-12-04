//
//  TranslationsLoader.h
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadedTranslation.h"

typedef NSDictionary<NSString *, id> JSONDictionary;

@interface TranslationsLoader : NSObject

#pragma mark - Public methods
+ (NSArray<LoadedTranslation*>*) loadTranslations:(NSDictionary<NSString*,id>*) json;

#pragma mark - Private methods
+ (LoadedTranslationTypeEnum) detectElementType:(JSONDictionary*) element;

@end
