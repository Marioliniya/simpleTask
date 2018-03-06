//
//  AuthManager.h
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthManager : NSObject

@property (strong, readonly, nonatomic) NSString* login;
@property (strong, readonly, nonatomic) NSString* password;

+ (AuthManager*)sharedManager;

- (void)signInWithLogin:(NSString*)login password:(NSString*)password completion:(void(^)(BOOL success, NSError* error))completion;

- (BOOL)isLogin;

- (void)logOut;

@end
