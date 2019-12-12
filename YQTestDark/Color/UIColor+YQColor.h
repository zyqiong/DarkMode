//
//  UIColor+YQColor.h
//  YQTestDark
//
//  Created by zyqiong on 2019/12/6.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YQColor)

+ (UIColor *)yqMainColor;
+ (UIColor *)yqbackColor;
+ (UIColor *)yqtextColor;
+ (UIColor *)yqbuttonBackgroundColor;
+ (UIColor *)yqLineColor;
+ (UIColor *)yqButtonTextColor;

+ (UIColor *)yqcolorWithLightColorStr:(NSString *)lightColorStr darkColorStr:(NSString *)darkColorStr;
+ (UIColor *)yqcolorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;
@end

NS_ASSUME_NONNULL_END
