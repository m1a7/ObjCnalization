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
    NSArray* uniqueBaseExpressions = [self getUniqueObjectsFromToArray:baseLanguageExpressions andRhs:preferedLanguageExpressions];
    
    NSArray* loadedExpressions = [uniqueBaseExpressions arrayByAddingObjectsFromArray:preferedLanguageExpressions];
    
    NSArray* prefBuiltInExpressions = [SharedExpressionsProcessor loadBuiltInExpressions:preferedLanguage];
    
    NSArray<SharedExpression*>* baseBuiltInExpressions = [SharedBaseExpression allExpressions];

    NSArray<SharedExpression*>* uniqueBaseBuiltInExpressions = [self getUniqueObjectsFromToArray:baseBuiltInExpressions andRhs:prefBuiltInExpressions];
    
    NSArray<SharedExpression*>* builtInExpressions = [uniqueBaseBuiltInExpressions arrayByAddingObjectsFromArray:prefBuiltInExpressions];
    
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
    }
    return result;
}

@end


