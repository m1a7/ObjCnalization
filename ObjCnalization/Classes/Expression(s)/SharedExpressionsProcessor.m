//
//  SharedExpressionsProcessor.m
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "SharedExpressionsProcessor.h"
#import "SharedExpression.h"
//#import <ObjectiveSugar/ObjectiveSugar.h>

#import "NSArray+Collection.h"
#import "NSArray+HighOrder.h"

#import "SharedBaseExpression.h"
#import "SharedPolishExpression.h"
#import "SharedRussianExpression.h"


@implementation SharedExpressionsProcessor

+(NSArray<SharedExpression*>*) processSharedExpression:(CountryCode*) preferedLanguage
                        andPreferedLanguageExpressions:(NSArray<SharedExpression*>*) preferedLanguageExpressions
                            andBaseLanguageExpressions:(NSArray<SharedExpression*>*) baseLanguageExpressions
{
 
   // let uniqueBaseExpressions = baseLanguageExpressions <! preferedLanguageExpressions
    NSArray* uniqueBaseExpressions = [self getUniqueObjectsFromToArray:baseLanguageExpressions andRhs:preferedLanguageExpressions];
    
    //let loadedExpressions = uniqueBaseExpressions + preferedLanguageExpressions
    NSArray* loadedExpressions = [uniqueBaseExpressions arrayByAddingObjectsFromArray:preferedLanguageExpressions];
    
    //let prefBuiltInExpressions = loadBuiltInExpressions(preferedLanguage)
    NSArray* prefBuiltInExpressions = [SharedExpressionsProcessor loadBuiltInExpressions:preferedLanguage];
    
    //let baseBuiltInExpressions = SharedBaseExpression.allExpressions()
    NSArray<SharedExpression*>* baseBuiltInExpressions = [SharedBaseExpression allExpressions];

    //let uniqueBaseBuiltInExpressions = baseBuiltInExpressions <! prefBuiltInExpressions
    NSArray<SharedExpression*>* uniqueBaseBuiltInExpressions = [self getUniqueObjectsFromToArray:baseBuiltInExpressions andRhs:prefBuiltInExpressions];
    
    //let builtInExpressions = uniqueBaseBuiltInExpressions + prefBuiltInExpressions
    NSArray<SharedExpression*>* builtInExpressions = [uniqueBaseBuiltInExpressions arrayByAddingObjectsFromArray:prefBuiltInExpressions];
    
    //return loadedExpressions + (builtInExpressions <! loadedExpressions)
    return  [loadedExpressions  arrayByAddingObjectsFromArray: [self getUniqueObjectsFromToArray:builtInExpressions andRhs:loadedExpressions]];
}

+(NSArray<SharedExpression*>*) loadBuiltInExpressions:(CountryCode*) language
{
     if ([language isEqualToString:@"pl"])  return [SharedPolishExpression allExpressions];
     if ([language isEqualToString:@"ru"])  return [SharedRussianExpression allExpressions];
    return nil;
}


+(NSArray<SharedExpression*>*) getUniqueObjectsFromToArray:(NSArray<SharedExpression*>*) lhs andRhs:(NSArray<SharedExpression*>*) rhs
{
    
    NSMutableArray* result = [NSMutableArray arrayWithArray:lhs];
    
    if (rhs.count > 0)
    {
    
        result = (NSMutableArray*)[lhs filter:^BOOL(SharedExpression* objectLhs) {
            
            return [[rhs filter:^BOOL(SharedExpression* objectRhs) {
                          return  [objectLhs.identifier isEqualToString:objectRhs.identifier];
                    }] count] == 0;
        }];
        // Вариант - 2
        // uniquearray = [yourarray valueForKeyPath:@"@distinctUnionOfObjects.self"];
        // Соединяем два массива, потом удаляем в циклу
    }
    return result;
}

@end


