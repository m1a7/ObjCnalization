//
//  LoadedTranslationsProcessor.m
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "LoadedTranslationsProcessor.h"

#import "Translation.h"
#import "LoadedTranslation.h"
#import "Regex.h"

#import "NSArray+Collection.h"
#import "NSArray+HighOrder.h"
#import "Expression.h"
#import "SharedExpression.h"
#import "LengthVariation.h"

@implementation LoadedTranslationsProcessor

+ (NSArray<Translation*>*) processTranslations:(NSArray<LoadedTranslation*>*) baseTranslations
               andPreferedLanguageTranslations:(NSArray<LoadedTranslation*>*) preferedLanguageTranslations
                          andSharedExpressions:(NSArray<SharedExpression*>*) sharedExpressions
{
    
    
    NSMutableArray<LoadedTranslation*>* uniqueBaseTranslations = [NSMutableArray arrayWithArray:baseTranslations];
    
    if (preferedLanguageTranslations.count > 0)
    {
        uniqueBaseTranslations = (NSMutableArray*)[baseTranslations filter:^BOOL(LoadedTranslation* objectFirst) {
           
            return [[preferedLanguageTranslations filter:^BOOL(LoadedTranslation* objectSecond) {
                return [objectFirst.keyForDict isEqualToString:objectSecond.keyForDict];
            }] count] == 0;
        }];
    }
    
    NSArray<LoadedTranslation*>* translationsReadyToProcess = [preferedLanguageTranslations arrayByAddingObjectsFromArray:uniqueBaseTranslations];

    return [translationsReadyToProcess map:^id(id obj, NSUInteger idx) {
        
        LoadedTranslation* translation = (LoadedTranslation*)obj;
        if ([translation.keyForDict isEqualToString:@"cars"]){
        
        }
        switch(translation.typeEnum) {
                
           case LoadedTranslationTypeEnum_Simple: {
                NSString* value = translation.content[translation.keyForDict];
                Expression* expr = [[Expression alloc]initWithPattern:translation.keyForDict andValue:value andLenghtVariations:nil];
                return [[Translation alloc] initWithKey:translation.keyForDict andExpressions:@[expr]];
                break;
            }
                
            case LoadedTranslationTypeEnum_WithExpressions: {

                NSMutableArray<Expression*>* expressions = [NSMutableArray new];
     
                for (NSString* key in [translation.content allKeys]) {
                    SharedExpression* firstObj = [[sharedExpressions filter:^BOOL(SharedExpression* sharedExpr) {
                        return [sharedExpr.identifier isEqualToString:key];
                    }] firstObject];
                    
                    NSString* pattern = (firstObj.pattern) ? firstObj.pattern : key;
                    [expressions addObject: [[Expression alloc] initWithPattern:pattern andValue:translation.content[key] andLenghtVariations:nil]];
                }
                return [[Translation alloc] initWithKey:translation.keyForDict andExpressions:expressions];
                break;
            }
                
            case LoadedTranslationTypeEnum_WithLengthVariations: {

                NSMutableArray<LengthVariation*>* lengthVariations = [NSMutableArray new];
                for (NSString* key in [translation.content allKeys]) {
                
                    LengthVariation* lenghVar = [[LengthVariation alloc] initWithWidth:[self parseNumberFromLengthVariation:key]
                                                                              strValue:translation.content[key]];
                    [lengthVariations addObject: lenghVar];
                }
                
                Expression* expr = [[Expression alloc] initWithPattern:translation.keyForDict
                                                              andValue: [lengthVariations lastObject].value
                                                   andLenghtVariations:lengthVariations];
                return [[Translation alloc] initWithKey:translation.keyForDict andExpressions:@[expr]];
                break;
            }
                
            case LoadedTranslationTypeEnum_WithExpressionsAndLengthVariations: {
                
                NSMutableArray<Expression*>* expressions = [NSMutableArray new];
               
                for (NSString* key in [translation.content allKeys])
                {
                        SharedExpression* firstObj = [[sharedExpressions filter:^BOOL(SharedExpression* sharedExpr) {
                            return [sharedExpr.identifier isEqualToString:key];
                        }] firstObject];
                    
                        NSString* pattern = (firstObj.pattern) ? firstObj.pattern : key;

                        if([translation.content[key] isKindOfClass:[NSDictionary<NSString*,NSString*> class]])
                        {
                              NSMutableArray<LengthVariation*>* lengthVariations = [NSMutableArray new];
 
                            [translation.content[key] enumerateKeysAndObjectsUsingBlock:^(id lvKey, id lvValue, BOOL *stop) {
                                  [lengthVariations addObject:[[LengthVariation alloc] initWithWidth:[LoadedTranslationsProcessor parseNumberFromLengthVariation:lvKey]
                                                                                            strValue:lvValue]];
                              }];
                            
                             [expressions addObject:[[Expression alloc]initWithPattern:pattern
                                                                              andValue:[lengthVariations lastObject].value
                                                                   andLenghtVariations:lengthVariations]];
                            
                        } else if ([translation.content[key] isKindOfClass:[NSString class]])
                                  {
                                   [expressions addObject: [[Expression alloc]initWithPattern:pattern andValue:translation.content[key] andLenghtVariations:nil]];
                                  }
                }
                NSLog(@" [[Translation alloc] initWithKey:translation.keyForDict andExpressions:expressions] = %@",expressions);
                return [[Translation alloc] initWithKey:translation.keyForDict andExpressions:expressions];
                break;
            }
            case LoadedTranslationTypeEnum_ErrorInitialization: {
                NSLog(@"LoadedTranslationTypeEnum_ErrorInitialization");
                break;
            }
        }
        return @"";
    }];
    
}

+ (NSInteger) parseNumberFromLengthVariation:(NSString*) string
{
    return [[Regex matchInString:string andPattern:@"@(\\d+)" andCapturingGroupIdx:1] integerValue];
}

@end
