//
//  UIViewController+Blocks.h
//  MolodejjTV
//
//  Created by Павел Литвиненко on 24.03.13.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (Blocks)

- (void)presentModalViewController:(UIViewController*)controller completion:(void (^)(void))block;
- (void)dismissModalViewControllerWithCompletionBlock:(void (^)(void))block;

@end
