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
    
    NSString* welcome     = [[ObjCnalization sharedInstance] localizedString:@"welcome"      andFittWidth:0 andDefaultVal:nil andComment:nil];
    NSString* book        = [[ObjCnalization sharedInstance] localizedString:@"book"         andFittWidth:0 andDefaultVal:nil andComment:nil];
    NSString* timeSeconds = [[ObjCnalization sharedInstance] localizedString:@"time-seconds" andIntVal:60   andFittWidth:0    andDefaultVal:nil andComment:nil];
    NSString* timeMinutes = [[ObjCnalization sharedInstance] localizedString:@"time-minutes" andIntVal:2    andFittWidth:0    andDefaultVal:nil andComment:nil];
    NSString* timeHours   = [[ObjCnalization sharedInstance] localizedString:@"time-hours"   andIntVal:3    andFittWidth:0    andDefaultVal:nil andComment:nil];
    
    NSString* books          = [[ObjCnalization sharedInstance] localizedString:@"books"           andIntVal:21     andFittWidth:0    andDefaultVal:nil andComment:nil];
    NSString* forgotPassword = [[ObjCnalization sharedInstance] localizedString:@"forgot-password" andFittWidth:300 andDefaultVal:nil andComment:nil];
    
    NSString* cars       = [[ObjCnalization sharedInstance] localizedString:@"cars"        andIntVal:32  andFittWidth:200 andDefaultVal:nil andComment:nil];
    NSString* policeCars = [[ObjCnalization sharedInstance] localizedString:@"police-cars" andIntVal:471 andFittWidth:0   andDefaultVal:nil andComment:nil];
    
    
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
