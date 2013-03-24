//
//  UIView+Shadow.h
//  MolodejjTV
//
//  Created by Павел Литвиненко on 18.03.13.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)

@property (nonatomic) CGSize shadowOffset;
@property (nonatomic) CGFloat shadowRadius;
@property (nonatomic) CGFloat shadowOpacity;
@property (nonatomic) UIColor *shadowColor;

@end
