//
//  Regex.h
//  ObjCnalization
//
//  Created by Uber on 25/11/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Regex : NSObject

+ (NSString*) matchInString:(NSString*)      str andPattern:(NSString*) pattern andCapturingGroupIdx:(NSInteger)capturingGroupIdx;
+ (NSString*) firstMatchInString:(NSString*) str andPattern:(NSString*) pattern;
+ (NSArray<NSString*>*) matchesInString:(NSString*)    str andPattern:(NSString*) pattern;

// Private methods
+ (NSRegularExpression*) regexp:(NSString*) pattern;
+ (NSString*) substring:(NSString*)str andRange:(NSRange) range;

@end
