//
//  UIView+Gradient.m
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import "UIView+Gradient.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Gradient)
@dynamic gradientColor;
@dynamic gradientLayer;

- (CAGradientLayer*)gradientLayer
{
    for (CALayer *layer in [self.layer sublayers]) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            CAGradientLayer *gradient = (CAGradientLayer*)layer;
            return gradient;
        }
    }
    return nil;
}

- (UIColor*)gradientColor
{
    CAGradientLayer *gradient = [self gradientLayer];
    if (gradient) {
        id colorRef = (gradient.colors)[1];
        UIColor *color = [UIColor colorWithCGColor:(__bridge CGColorRef)(colorRef)];
        if (color) {
            return color;
        }
    }
    return nil;
}

- (void)setGradientColor:(UIColor*)color
{
    if (color) {
        self.layer.masksToBounds   = YES;
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        CAGradientLayer *gradient = [self gradientLayer];
        if (!gradient) {
            gradient = [CAGradientLayer layer];
        }
        
        gradient.frame = self.bounds;
        gradient.colors = @[(id)[self.backgroundColor CGColor], (id)[color CGColor]];
        [self.layer insertSublayer:gradient atIndex:0];
    }
}

@end
