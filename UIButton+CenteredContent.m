//
//  UIButton+CenteredContent.m
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import <objc/runtime.h>
#import "UIButton+CenteredContent.h"

static char const * const contentSpacing = "ContentSpacing";

@implementation UIButton (CenteredContent)
@dynamic contentSpacing;

- (void)setContentSpacing:(CGFloat)spacing
{
    if (spacing > 0) {
        // get the size of the elements here for readability
        CGSize imageSize = self.imageView.frame.size;
        CGSize titleSize = self.titleLabel.frame.size;
        // get the height they will take up as a unit
        CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
        // raise the image and push it right to center it
        self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
        // lower the text and push it left to center it
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height),0.0);
    }
    // update layout
    [self performSelector:@selector(layoutSubviews) withObject:nil afterDelay:0.1];
    // store object
    NSNumber *spacingObj = @(spacing);
    objc_setAssociatedObject(self, contentSpacing, spacingObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)contentSpacing
{
    NSNumber *spacingObj = objc_getAssociatedObject(self, contentSpacing);
    if (spacingObj) {
        return [spacingObj floatValue];
    }
    return 0;
}

@end
