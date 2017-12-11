//
//  RXViewController.m
//  ObjCnalization
//
//  Created by m1a7 on 12/04/2017.
//  Copyright (c) 2017 m1a7. All rights reserved.
//

#import "RXViewController.h"
#import <ObjCnalization/ObjCnalization.h>

@interface RXViewController ()
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwrodTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordBtn;
@end

@implementation RXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.welcomeLabel.text  = [[I18n sharedInstance] localizedString:@"welcome"];
    self.loginLabel.text    = [[I18n sharedInstance] localizedString:@"login"];
    self.passwordLabel.text = [[I18n sharedInstance] localizedString:@"password"];

    self.loginTextField.placeholder    = [[I18n call] locStr:@"loginTextFieldPlaceHolder"];
    self.passwrodTextField.placeholder = [[I18n call] locStr:@"passwordTextFieldPlaceHolder"];

    [self.loginBtn          setTitle: [[I18n call] locStr:@"loginBtn"]        forState:UIControlStateNormal];
    [self.forgotPasswordBtn setTitle: [[I18n call] locStr:@"forgot-password"] forState:UIControlStateNormal];

}
@end
