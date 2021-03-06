//
//  UIView+Border.m
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import "UIView+Border.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Border)
@dynamic borderWidth;
@dynamic borderColor;

- (void)setBorderWidth:(CGFloat)width
{
    self.layer.borderWidth = width;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor*)color
{
    if (color) {
        self.layer.masksToBounds   = YES;
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        self.layer.borderColor = [color CGColor];
    }
}

- (__autoreleasing UIColor*)borderColor
{
    __autoreleasing UIColor *color = [UIColor colorWithCGColor:self.layer.borderColor];
    return color;
}

@end
