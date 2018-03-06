//
//  UIAlertController+Showable.h
//  Map
//
//  Created by Admin on 12/12/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Showable)

- (void)show;
- (void)presentAnimated:(BOOL)animated
             completion:(void (^)(void))completion;
- (void)presentFromController:(UIViewController *)viewController
                     animated:(BOOL)animated
                   completion:(void (^)(void))completion;

@end
