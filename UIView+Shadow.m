//
//  UIView+Shadow.m
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import "UIView+Shadow.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Shadow)
@dynamic shadowOffset;
@dynamic shadowRadius;
@dynamic shadowOpacity;
@dynamic shadowColor;

- (void)setShadowOffset:(CGSize)offset
{
    self.layer.shadowOffset = offset;
}

- (CGSize)shadowOffset
{
    return self.layer.shadowOffset;
}

- (void)setShadowRadius:(CGFloat)radius
{
    self.layer.shadowRadius = radius;
}

-(CGFloat)shadowRadius
{
    return self.layer.shadowRadius;
}

- (void)setShadowOpacity:(CGFloat)opacity
{
    self.layer.shadowOpacity = opacity;
}

- (CGFloat)shadowOpacity
{
    return self.layer.shadowOpacity;
}

- (void)setShadowColor:(UIColor*)color
{
    self.layer.masksToBounds   = NO;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.layer.shadowColor = [color CGColor];
}

- (__autoreleasing UIColor*)shadowColor
{
    __autoreleasing UIColor *color = [UIColor colorWithCGColor:self.layer.shadowColor];
    return color;
}

@end
