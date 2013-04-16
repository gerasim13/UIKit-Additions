//
//  UIViewController+Blocks.m
//  MolodejjTV
//
//  Created by Павел Литвиненко on 24.03.13.
//
//

#import "UIViewController+Blocks.h"
#import "CUMacros.h"

@implementation UIViewController (Blocks)

- (void)presentModalViewController:(UIViewController*)controller completion:(void (^)(void))block
{
    @autoreleasepool {
        if (IS_IOS6_OR_GREATER) {
            [self presentViewController:controller animated:NO completion:block];
        } else {
            [self presentModalViewController:controller animated:NO];
            // Call block
            if (block)
                block();
        }
    }
}

- (void)dismissModalViewControllerWithCompletionBlock:(void (^)(void))block
{
    @autoreleasepool {
        if (IS_IOS6_OR_GREATER) {
            [self dismissViewControllerAnimated:NO completion:block];
        } else {
            [self dismissModalViewControllerAnimated:NO];
            // Call block
            if (block)
                block();
        }
    }
}

@end
