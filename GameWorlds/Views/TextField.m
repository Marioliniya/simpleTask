//
//  TextField.m
//  GameWorlds
//
//  Created by Admin on 3/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "TextField.h"
#import "Utils.h"

@implementation TextField

#pragma mark - Inicialization

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.atChek = YES;
    }
    return self;
}

#pragma mark - Chek email address format

- (BOOL)chekEmailAddress:(NSString *)string{
    
    BOOL result = YES;
    
    NSMutableString* badSymbols = [[NSMutableString alloc] initWithString:@"^|/!#$%*&()?~`=+';,:{}[]"];
    NSCharacterSet* validationSet = [NSCharacterSet characterSetWithCharactersInString:badSymbols];
    NSArray* components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if (components.count >1){
        result = NO;
    }
    
    if (self.text.length == 0 && [string isEqualToString:@"@"]){
        result = NO;
    }
    else if ([string isEqualToString:@"@"] && self.atChek){
        self.atChek = NO;
    }
    else if([string isEqualToString:@"@"] && !self.atChek){
        result = NO;
    }
    
    if (self.text.length > maxEmailAddressLengs){
        result = NO;
    }
    
    return result;
}

@end
