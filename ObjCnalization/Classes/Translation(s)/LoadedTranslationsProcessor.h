//
//  LoadedTranslationsProcessor.h
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Translation;
@class LoadedTranslation;
@class SharedExpression;

@interface LoadedTranslationsProcessor : NSObject

+ (NSArray<Translation*>*) processTranslations:(NSArray<LoadedTranslation*>*) baseTranslations
               andPreferedLanguageTranslations:(NSArray<LoadedTranslation*>*) preferedLanguageTranslations
                          andSharedExpressions:(NSArray<SharedExpression*>*) sharedExpressions;

+ (NSInteger) parseNumberFromLengthVariation:(NSString*) string;

@end
