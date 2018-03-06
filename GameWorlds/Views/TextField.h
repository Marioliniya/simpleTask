//
//  TextField.h
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TextFiedTypeLogin,
    TextFiedTypePassword
}TextFiedType;

@interface TextField : UITextField

@property (assign, nonatomic) BOOL atChek;

- (BOOL)chekEmailAddress:(NSString *)string;

@end
