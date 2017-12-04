//
//  JSONFileLoader.h
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSDictionary<NSString *, id> JSONDictionary;
typedef NSString CountryCode;

@interface JSONFileLoader : NSObject

+ (JSONDictionary*) loadTranslations:(CountryCode*) countryCode andBundle:(NSBundle*) bundle;
+ (NSDictionary<NSString*,NSString*>*) loadExpressions:(CountryCode*) countryCode andBundle:(NSBundle*) bundle;

+ (JSONDictionary*) load:(NSString*) fileName andBundle:(NSBundle*) bundle;
+ (JSONDictionary*) load:(NSURL*) fileURL;

@end
