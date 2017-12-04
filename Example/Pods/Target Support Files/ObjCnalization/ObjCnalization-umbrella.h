#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+Collection.h"
#import "NSArray+HighOrder.h"
#import "NSDictionary+Collection.h"
#import "NSString+Collection.h"
#import "RVCollection.h"
#import "ExpressionPatternTypeObject.h"
#import "InequalitySignObject.h"
#import "InternalPatternObject.h"
#import "Expression.h"
#import "SharedBaseExpression.h"
#import "SharedPolishExpression.h"
#import "SharedRussianExpression.h"
#import "SharedExpression.h"
#import "SharedExpressionsLoader.h"
#import "SharedExpressionsProcessor.h"
#import "LengthVariation.h"
#import "JSONFileLoader.h"
#import "InequalityExpressionMatcher.h"
#import "InequalityExtendedExpressionMatcher.h"
#import "RegexExpressionMatcher.h"
#import "ObjCnalization.h"
#import "InequalityExpressionParser.h"
#import "InequalityExtendedExpressionParser.h"
#import "RegexExpressionParser.h"
#import "ExpressionMatcher.h"
#import "ExpressionParser.h"
#import "Regex.h"
#import "LoadedTranslation.h"
#import "LoadedTranslationsProcessor.h"
#import "LoadedTranslationTypeObject.h"
#import "TranslationsLoader.h"
#import "Translation.h"

FOUNDATION_EXPORT double ObjCnalizationVersionNumber;
FOUNDATION_EXPORT const unsigned char ObjCnalizationVersionString[];

