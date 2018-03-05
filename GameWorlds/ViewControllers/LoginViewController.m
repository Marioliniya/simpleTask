//
//  LoginViewController.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "LoginViewController.h"
#import "TextField.h"

@interface LoginViewController ()  <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView* backgroundImageView;

@property (weak, nonatomic) IBOutlet TextField* loginTextField;
@property (weak, nonatomic) IBOutlet TextField* passwordTextField;

@end

@implementation LoginViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)layout{
    
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
}

#pragma mark - Actions

- (IBAction)loginButtonTouchUpInside:(UIButton*)sender{
    
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.tag == TextFiedTypeLogin) {
        [self.passwordTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
