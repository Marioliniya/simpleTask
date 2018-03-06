//
//  LoginViewController.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "LoginViewController.h"
#import "TextField.h"
#import "GameWorldsViewController.h"
#import "ContentManager.h"
#import "AuthManager.h"
#import "UIAlertController+Showable.h"
#import "SVProgressHUD.h"

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
    
    if ([[AuthManager sharedManager] isLogin]) {
       [self performSegueWithIdentifier:@"Worlds" sender:self];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private methods

- (void)layout{

    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;

}

- (void)showAllertWithTitle:(NSString*)title andMassege:(NSString*)massege{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:massege
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [alert show];
}


- (void)cleanTextFilds{
    
    self.loginTextField.text = @"";
    self.passwordTextField.text = @"";
}

#pragma mark - Actions

- (IBAction)loginButtonTouchUpInside:(UIButton*)sender{
   
    [self login];
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    BOOL yesOrNo = YES;
    
    if(textField.tag == TextFiedTypeLogin){
        
        yesOrNo = [self.loginTextField chekEmailAddress:string];
    }
    
    return yesOrNo;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    self.loginTextField.atChek = YES;
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    GameWorldsViewController* worldsController = [segue destinationViewController];
    
    if ([[segue identifier] isEqualToString:@"GameWorlds"]) {
        
        worldsController.content = [ContentManager shareManager].content;
    }

}

#pragma mark - Sign in

- (void)login{
    
    NSString* login = self.loginTextField.text;
    NSString* password = self.passwordTextField.text;
    
    if (login.length == 0 || password.length == 0 ){
        
        [self showAllertWithTitle:@"Warning" andMassege:@"Please, enter your login and password"];
    }else{
        
        [SVProgressHUD show];
        [self cleanTextFilds];
        [[AuthManager sharedManager] signInWithLogin:login password:password completion:^(BOOL success, NSError *error) {
            if (success) {
                
               [self performSegueWithIdentifier:@"GameWorlds" sender:self];
            }else{
                 [self showAllertWithTitle:@"Error" andMassege:[error localizedDescription]];
            }
        }];
    }
    
}

@end
