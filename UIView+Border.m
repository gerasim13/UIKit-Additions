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
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [color CGColor];
    }
}

- (UIColor*)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

@end
