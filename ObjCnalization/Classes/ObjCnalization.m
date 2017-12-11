//
//  ObjCnalization.m
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ObjCnalization.h"
#import "Translation.h"
#import "JSONFileLoader.h"
#import "SharedExpression.h"
#import "SharedExpressionsLoader.h"

#import "SharedExpressionsProcessor.h"
#import "TranslationsLoader.h"
#import "LoadedTranslationsProcessor.h"

#import "NSArray+Collection.h"
#import "NSArray+HighOrder.h"

@implementation ObjCnalization

+ (instancetype)sharedInstance
{
    static ObjCnalization *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

// This is short method of sharedInstance
+ (instancetype)call
{
    return [ObjCnalization sharedInstance];
}

#pragma mark - Public methods

- (void) configure:(NSBundle*) bundle
{
    if (bundle)
    [[ObjCnalization sharedInstance] load:bundle];
    else
    [[ObjCnalization sharedInstance] load: [NSBundle mainBundle]];

}

- (void) configureIfNeeded:(NSBundle*) bundle
{
    if (!self.configured){
        [[ObjCnalization sharedInstance] configure:bundle];
    }
}



// Methods without pluralization
- (NSString*) locStr:(NSString*) key
{
    return  [self localizedString:key andFittWidth:0 andDefaultVal:nil andComment:nil];
}


- (NSString*) localizedString:(NSString*) key
{
    return  [self localizedString:key andFittWidth:0 andDefaultVal:nil andComment:nil];
}

- (NSString*) localizedString:(NSString*) key
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    return  [self localizedString:key andFittWidth:0 andDefaultVal:defaultValue andComment:comment];

}


- (NSString*) localizedString:(NSString*) key
                 andFittWidth:(NSInteger) fittingWidth
{
    return  [self localizedString:key andFittWidth:fittingWidth andDefaultVal:nil andComment:nil];
}



- (NSString*) localizedString:(NSString*) key
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    return [self localizedString:key andStringVal:key andFittWidth:fittingWidth andDefaultVal:defaultValue andComment:comment];
}


// String value methods

- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
{
    return [self localizedString:key andStringVal:stringValue andFittWidth:0 andDefaultVal:nil andComment:nil];
}



- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    return [self localizedString:key andStringVal:stringValue andFittWidth:0 andDefaultVal:defaultValue andComment:comment];

}


- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                 andFittWidth:(NSInteger) fittingWidth
{
    return [self localizedString:key andStringVal:stringValue andFittWidth:fittingWidth andDefaultVal:nil  andComment:nil];
}



- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    [self configureIfNeeded:[NSBundle mainBundle]];
    
    NSArray<Translation*>* filteredTranslations = [[ObjCnalization sharedInstance].translations filter:^BOOL(Translation* object) {
        return [object.key isEqualToString:key];
    }];
    
    Translation* translation = [filteredTranslations firstObject];
    
    if (translation)
    {
        NSString* localizedValue = [translation validate:stringValue andFittingWidth:fittingWidth];
        if (localizedValue)
        return localizedValue;
    }
    
    return (!defaultValue) ? defaultValue : key;
}


// Int value methods

- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
{
    return [self localizedString:key andIntVal:intValue andFittWidth:0 andDefaultVal:nil andComment:nil];

}


- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    return [self localizedString:key andIntVal:intValue andFittWidth:0 andDefaultVal:defaultValue andComment:comment];
}



- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
                 andFittWidth:(NSInteger) fittingWidth;
{
    return [self localizedString:key andIntVal:intValue andFittWidth:fittingWidth andDefaultVal:nil andComment:nil];
}

- (NSString*) localizedString:(NSString*) key
                       andIntVal:(NSInteger) intValue
                    andFittWidth:(NSInteger) fittingWidth
                   andDefaultVal:(NSString*) defaultValue
                      andComment:(NSString*) comment
{
    NSString* defValue   = (defaultValue) ? defaultValue : [NSString stringWithFormat:@"defaultValue for =%@",key];
    NSString* commentary = (comment)      ? comment      : [NSString stringWithFormat:@"comment for =%@",key];

    return [self localizedString:key
                    andStringVal:[NSString stringWithFormat:@"%ld",(long)intValue]
                    andFittWidth:fittingWidth
                   andDefaultVal:defValue
                      andComment:commentary];
}

















/*


// Very simple method
- (NSString*) localizedString:(NSString*) key
{
    return  [self localizedString:key andFittWidth:0 andDefaultVal:nil andComment:nil];
}

// Without number value
- (NSString*) localizedString:(NSString*) key
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    return [self localizedString:key andStringVal:key andFittWidth:fittingWidth andDefaultVal:defaultValue andComment:comment];
}

// String number
- (NSString*) localizedString:(NSString*) key
                 andStringVal:(NSString*) stringValue
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    [self configureIfNeeded:[NSBundle mainBundle]];

    NSArray<Translation*>* filteredTranslations = [[ObjCnalization sharedInstance].translations filter:^BOOL(Translation* object) {
        return [object.key isEqualToString:key];
    }];
    
    Translation* translation = [filteredTranslations firstObject];
    
    if (translation)
    {
        NSString* localizedValue = [translation validate:stringValue andFittingWidth:fittingWidth];
        if (localizedValue)
            return localizedValue;
    }
    

    return (!defaultValue) ? defaultValue : key;
}

// Int number
- (NSString*) localizedString:(NSString*) key
                    andIntVal:(NSInteger) intValue
                 andFittWidth:(NSInteger) fittingWidth
                andDefaultVal:(NSString*) defaultValue
                   andComment:(NSString*) comment
{
    return [self localizedString:key
                    andStringVal:[NSString stringWithFormat:@"%ld",(long)intValue]
                    andFittWidth:fittingWidth
                   andDefaultVal:defaultValue
                      andComment:comment];
}

*/




#pragma mark - Private methods

- (void) load:(NSBundle*) bundle
{
    NSString* base = @"base";
    NSString* language = [self getPreferredLanguage:[NSBundle mainBundle]];
    
    NSArray<SharedExpression*>* baseExpressions = [SharedExpressionsLoader  loadExpressions: [JSONFileLoader loadExpressions:base andBundle:bundle]];
    NSArray<SharedExpression*>* languageExpressions = [SharedExpressionsLoader  loadExpressions: [JSONFileLoader loadExpressions:language andBundle:bundle]];
    
    NSArray<SharedExpression*>* expressions = [SharedExpressionsProcessor processSharedExpression:language
                                                                   andPreferedLanguageExpressions:languageExpressions
                                                                       andBaseLanguageExpressions:baseExpressions];
    
    NSArray<LoadedTranslation*>* baseTranslations = [TranslationsLoader loadTranslations: [JSONFileLoader loadTranslations:base andBundle:bundle] ];

    
    NSArray<LoadedTranslation*>* languageTranslations = [TranslationsLoader loadTranslations: [JSONFileLoader loadTranslations:language andBundle:bundle] ];

     NSArray<Translation*>*  tmpTranslation = [LoadedTranslationsProcessor processTranslations:baseTranslations
                                       andPreferedLanguageTranslations:languageTranslations
                                                  andSharedExpressions:expressions];
    self.translations = [NSArray arrayWithArray:tmpTranslation];
    self.configured = YES;

}

- (CountryCode*) getPreferredLanguage:(NSBundle*) bundle
{
    CountryCode* code = [bundle.preferredLocalizations firstObject];
    if (code){
        return code;
    }
    return @"Not found region`s code";
}

@end
