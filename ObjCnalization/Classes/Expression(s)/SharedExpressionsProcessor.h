//
//  SharedExpressionsProcessor.h
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SharedExpression;

typedef NSString CountryCode;


@interface SharedExpressionsProcessor : NSObject

+(NSArray<SharedExpression*>*) processSharedExpression:(CountryCode*) preferedLanguage
                        andPreferedLanguageExpressions:(NSArray<SharedExpression*>*) preferedLanguageExpressions
                            andBaseLanguageExpressions:(NSArray<SharedExpression*>*) baseLanguageExpressions;

+(NSArray<SharedExpression*>*) loadBuiltInExpressions:(CountryCode*) language;

+(NSArray<SharedExpression*>*) getUniqueObjectsFromToArray:(NSArray<SharedExpression*>*) lhs andRhs:(NSArray<SharedExpression*>*) rhs;

@end
