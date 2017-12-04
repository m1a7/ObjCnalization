//
//  Regex.m
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "Regex.h"

@implementation Regex


+ (NSString*) matchInString:(NSString*) str andPattern:(NSString*) pattern andCapturingGroupIdx:(NSInteger)capturingGroupIdx
{
    __block NSString* resultString;

    NSRange range = NSMakeRange(0, str.length);

    NSRegularExpression* regExp = [Regex regexp:pattern];
    [regExp enumerateMatchesInString:str
                             options:NSMatchingReportCompletion
                               range:range
                          usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {

                              if (result){
                                  if (result.numberOfRanges > capturingGroupIdx)
                                  {
                                      resultString = [Regex substring:str andRange: [result rangeAtIndex:capturingGroupIdx]];
                                  } else {
                                      resultString = [Regex substring:str andRange:result.range];
                                         }
                              }
                              
                          }];
    return resultString;
}


+ (NSString*) firstMatchInString:(NSString*) str andPattern:(NSString*) pattern
{
    NSRegularExpression*  regExp = [Regex regexp:pattern];
    NSTextCheckingResult* result = [regExp firstMatchInString:str options:NSMatchingReportCompletion range:NSMakeRange(0,str.length)];
   
    if (result){
        return [Regex substring:str andRange:result.range];
    }
    
    return nil;
}



+ (NSArray<NSString*>*) matchesInString:(NSString*) str andPattern:(NSString*) pattern
{
    NSMutableArray* matches = [NSMutableArray new];
    NSRegularExpression* regExp = [Regex regexp:pattern];

    NSArray* results = [regExp matchesInString:str options:NSMatchingReportCompletion range:NSMakeRange(0,str.length)];
    
    for (NSTextCheckingResult* result in results) {
        [matches addObject:[Regex substring:str andRange:result.range]];
    }
    return matches;
}


// Private methods
+ (NSRegularExpression*) regexp:(NSString*) pattern
{
    NSError* error = nil;//[NSError new];
    NSRegularExpression* expression = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                                options:NSRegularExpressionCaseInsensitive
                                                                                  error:&error];
    if (!expression){
        NSLog(@"File=(Regex.h) | Method=(+(NSRegularExpression*) regexp:(NSString*) pattern) | Error = %@",error);
    }
    return expression;
}

+ (NSString*) substring:(NSString*)str andRange:(NSRange) range
{
    return [str substringWithRange:range];
}

@end
