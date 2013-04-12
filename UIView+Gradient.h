//
//  UIView+Gradient.h
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Gradient)

@property (nonatomic) UIColor         *gradientColor;
@property (nonatomic) CAGradientLayer *gradientLayer;

@end
