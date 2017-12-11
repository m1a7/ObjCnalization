//
//  LoadedTranslationTypeObject.h
//  ObjCnalization
//
//  Created by Uber on 27/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    LoadedTranslationTypeEnum_Simple = 0,
    LoadedTranslationTypeEnum_WithExpressions,
    LoadedTranslationTypeEnum_WithLengthVariations,
    LoadedTranslationTypeEnum_WithExpressionsAndLengthVariations,
    
    LoadedTranslationTypeEnum_ErrorInitialization
    
} LoadedTranslationTypeEnum;


@interface LoadedTranslationTypeObject : NSObject

@end
