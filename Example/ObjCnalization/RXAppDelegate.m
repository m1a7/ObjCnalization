//
//  RXAppDelegate.m
//  ObjCnalization
//
//  Created by m1a7 on 12/04/2017.
//  Copyright (c) 2017 m1a7. All rights reserved.
//

#import "RXAppDelegate.h"
#import <ObjCnalization/ObjCnalization.h>

@implementation RXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[ObjCnalization sharedInstance] configure:[NSBundle mainBundle]];
    
    NSString* welcome     = [[ObjCnalization sharedInstance] localizedString:@"welcome"];
    NSString* book        = [[ObjCnalization sharedInstance] localizedString:@"book"];
    NSString* timeSeconds = [[ObjCnalization sharedInstance] localizedString:@"time-seconds" andIntVal:60];
    NSString* timeMinutes = [[ObjCnalization sharedInstance] localizedString:@"time-minutes" andIntVal:21];
    NSString* timeHours   = [[ObjCnalization sharedInstance] localizedString:@"time-hours"   andIntVal:3];
    
    NSString* books          = [[ObjCnalization sharedInstance] localizedString:@"books"           andIntVal:21];
    NSString* forgotPassword = [[ObjCnalization sharedInstance] localizedString:@"forgot-password" andFittWidth:300];
    
    NSString* cars       = [[ObjCnalization sharedInstance] localizedString:@"cars"        andIntVal:32  andFittWidth:200];
    NSString* policeCars = [[ObjCnalization sharedInstance] localizedString:@"police-cars" andIntVal:471 andFittWidth:0];
    
    [[I18n call] localizedString:<#(NSString *)#> andStringVal:<#(NSString *)#> andFittWidth:<#(NSInteger)#> andDefaultVal:<#(NSString *)#> andComment:<#(NSString *)#>]
    NSLog(@"welcome = %@",welcome);
    NSLog(@"book    = %@",book);
    
    NSLog(@"timeSeconds  = %@",timeSeconds);
    NSLog(@"timeMinutes  = %@",timeMinutes);
    NSLog(@"timeHours    = %@",timeHours);
    
    NSLog(@"books          = %@",books);
    NSLog(@"forgotPassword = %@",forgotPassword);
    
    NSLog(@"cars       = %@",cars);
    NSLog(@"policeCars = %@",policeCars);
    
    return YES;
}


@end
