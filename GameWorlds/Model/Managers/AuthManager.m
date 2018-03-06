//
//  AuthManager.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "AuthManager.h"
#import "RequestManager.h"
#import "ContentManager.h"

static NSString* kSettingsLogin = @"login";
static NSString* kSettingsPassword = @"password";

@interface AuthManager ()

@end


@implementation AuthManager

@synthesize login = _login;
@synthesize password = _password;

#pragma mark - Inicializaton

+ (AuthManager*)sharedManager{
    
    static AuthManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AuthManager new];
    });
    return manager;
}

#pragma mark - Public

- (void)signInWithLogin:(NSString*)login
               password:(NSString*)password
             completion:(void(^)(BOOL success, NSError* error))completion{
    

    [[RequestManager sharedManager] getGameWorldsWithLogin:login password:password onCompletion:^(BOOL success, NSArray *worlds, NSError *error) {
        
        if (success) {
            [ContentManager shareManager].content = worlds;
            self.login = login;
            self.password = password;
        }

        if (completion) {
            completion(success, error);
        }
    }];
    
}

- (BOOL)isLogin{
    
    BOOL result = NO;
    if (self.login.length != 0 && self.password.length != 0) {
        return YES;
    }
    return result;
}

- (void)logOut{
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kSettingsLogin];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kSettingsPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
#pragma mark - Private

#pragma mark - Setter

- (void)setLogin:(NSString *)newLogin{
    
    _login = newLogin;
    
    [[NSUserDefaults standardUserDefaults] setObject:_login forKey:kSettingsLogin];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setPassword:(NSString *)newPassword{
    
    _password = newPassword;
    [[NSUserDefaults standardUserDefaults] setObject:_password forKey:kSettingsPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

#pragma mark - Getter

- (NSString*)login{

    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* login = [userDefaults objectForKey:kSettingsLogin];
    return login;
}

- (NSString*)password{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSString* password = [userDefaults objectForKey:kSettingsPassword];
    return password;
}

@end
