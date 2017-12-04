//
//  Translation.m
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "Translation.h"
#import "Expression.h"
#import "LengthVariation.h"

@implementation Translation

- (NSString*) validate:(NSString*) text andFittingWidth:(NSInteger) fittingWidth
{
    for (Expression* expression in self.expressions) {
        
        if ([expression validate:text])
        {
            NSString* localizedValue = expression.value;
            
            if (fittingWidth != NSNotFound && expression.lengthVariations.count > 0)
            {
                
                NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"width"
                                                                            ascending: YES];
                NSArray<LengthVariation*> *lengthVariations =  [expression.lengthVariations sortedArrayUsingDescriptors: @[sortOrder]];
                
                for (LengthVariation* variation in lengthVariations) {

                    if (variation.width <= fittingWidth){
                        localizedValue = variation.value;
                    }
                }
            }
           // Обрезаем строку
            NSString* newStr = [localizedValue stringByReplacingOccurrencesOfString:@"%d"
                                                              withString:text];
            if (newStr.length > 0) {
                return newStr;
            }
            return localizedValue;
        }
    }
    return @"Значение не найдено !"; // nil
}

- (instancetype)initWithKey:(NSString*) key andExpressions:(NSArray<Expression*>*) expressions
{
    self = [super init];
    if (self) {
        self.key = key;
        self.expressions = [NSArray arrayWithArray:expressions];
    }
    return self;
}

@end
