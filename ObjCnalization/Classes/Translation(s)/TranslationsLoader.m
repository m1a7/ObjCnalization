//
//  TranslationsLoader.m
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "TranslationsLoader.h"

@implementation TranslationsLoader

#pragma mark - Public methods
+ (NSArray<LoadedTranslation*>*) loadTranslations:(NSDictionary<NSString*,id>*) json
{
    NSLog(@"+ (NSArray<LoadedTranslation*>*) loadTranslations:(NSDictionary<NSString*,id>*) json");
    NSMutableArray<LoadedTranslation*>* loadedTranslations = [NSMutableArray new];
    __weak NSMutableArray* weakArray = loadedTranslations;
    
    [json enumerateKeysAndObjectsUsingBlock:^(NSString* key, id value, BOOL *stop) {
    
        if ([value isKindOfClass:[NSString class]])
        {
            [weakArray addObject:  [[LoadedTranslation alloc] initWithType:LoadedTranslationTypeEnum_Simple andKey:key andContent:@{key:value}]];
        } else {
            
                JSONDictionary* dictionary = (JSONDictionary*)value;
                LoadedTranslationTypeEnum type = [TranslationsLoader detectElementType:dictionary];
            

            if(type != NSNotFound){
                    [weakArray addObject:  [[LoadedTranslation alloc] initWithType:type andKey:key andContent:dictionary]];
                }else {
                       NSLog(@"Translation type is not supported for: %@",dictionary);
                      }
               }
    }];
    return loadedTranslations;
}

#pragma mark - Private methods
+ (LoadedTranslationTypeEnum) detectElementType:(JSONDictionary*) element
{
    int dicts   = 0;
    int strings = 0;
    
    for (id value in [element allValues]) {

        if ([value isKindOfClass:[NSString class]])
            strings += 1;
        else if ([value isKindOfClass:[NSDictionary<NSString*,id> class]]) // #warning скользкий момент
            dicts += 1;
    }
    
    if(strings > 0 && dicts == 0)
    {
        NSString* key = [element.allKeys firstObject];
        // 1. Взять первый символ из строки

        return [[key substringToIndex:1] isEqualToString:@"@"] ? LoadedTranslationTypeEnum_WithLengthVariations : LoadedTranslationTypeEnum_WithExpressions;
        
    } else if (strings >= 0 && dicts > 0) {
        return LoadedTranslationTypeEnum_WithExpressionsAndLengthVariations;
    }
    return 0;
}

@end
