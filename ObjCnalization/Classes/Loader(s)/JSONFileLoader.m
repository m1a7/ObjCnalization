//
//  JSONFileLoader.m
//  ObjCnalization
//
//  Created by Uber on 26/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "JSONFileLoader.h"

@implementation JSONFileLoader

+ (JSONDictionary*) loadTranslations:(CountryCode*) countryCode andBundle:(NSBundle*) bundle
{
    NSDictionary* dict = [self load:countryCode andBundle:bundle];
    if (dict){
        return dict;
    }
    return @{};
}

+ (NSDictionary<NSString*,NSString*>*) loadExpressions:(CountryCode*) countryCode andBundle:(NSBundle*) bundle
{
   JSONDictionary* dict = [self load:@"expressions" andBundle:bundle];
    
    if (dict){
        JSONDictionary* internalDict = dict[countryCode];
        if (internalDict){
            return internalDict;
        }else {
            return @{};
        }
    }
    return nil;
}

+ (JSONDictionary*) load:(NSString*) fileName andBundle:(NSBundle*) bundle
{
    NSURL* fileURL = [bundle URLForResource:fileName withExtension:@"json"];
    
    if (fileURL){
       return  [self load:fileURL];
    }
    return nil;
}


+ (JSONDictionary*) load:(NSURL*) fileURL
{
    NSData* data = [NSData dataWithContentsOfURL:fileURL];
    if (data)
    {
        NSError *errorTransformJsonToDict = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &errorTransformJsonToDict];
        if (dictionary)
        {
            return dictionary;
        }
        return nil;
    } else {
        NSLog(@"Cannot load content of file.");
    }
    return nil;
}


@end
