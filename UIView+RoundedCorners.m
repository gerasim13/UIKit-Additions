//
//  UIView+RoundedCorners.m
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import "UIView+RoundedCorners.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (RoundedCorners)
@dynamic cornerRadius;

- (void)setCornerRadius:(CGFloat)radius
{
    self.layer.masksToBounds      = YES;
    self.layer.shouldRasterize    = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.layer.cornerRadius       = radius;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

@end
