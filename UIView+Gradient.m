//
//  UIView+Gradient.m
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import "UIView+Gradient.h"
#import "UIView+RoundedCorners.h"
#import "UIView+Border.h"
#import "NSObject+Swizzle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Gradient)
@dynamic gradientColor;
@dynamic gradientLayer;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) withMethod:@selector(layoutSubviews_gradient)];
    });
}

- (void)layoutSubviews_gradient
{
    [self layoutSubviews_gradient];
    [[self gradientLayer] setFrame:self.bounds];
}

- (__autoreleasing CAGradientLayer*)gradientLayer
{
    for (CALayer *layer in [self.layer sublayers]) {
        @autoreleasepool {
            if ([layer isKindOfClass:[CAGradientLayer class]]) {
                return (CAGradientLayer*)layer;
            }
        }
    }
    return nil;
}

- (__autoreleasing UIColor*)gradientColor
{
    __autoreleasing CAGradientLayer *gradient = [self gradientLayer];
    if (gradient) {
        id colorRef = gradient.colors[1];
        __autoreleasing UIColor *color = [UIColor colorWithCGColor:(__bridge CGColorRef)colorRef];
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
        self.layer.needsDisplayOnBoundsChange = YES;
        
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
