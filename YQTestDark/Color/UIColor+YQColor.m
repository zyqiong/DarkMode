//
//  UIColor+YQColor.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/6.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "UIColor+YQColor.h"

@implementation UIColor (YQColor)

+ (UIColor *)yqMainColor {
    return [self yqcolorWithLightColorStr:@"#01D6B4" darkColorStr:@"#01D6B4"];
}
+ (UIColor *)yqbackColor {
    return [self yqcolorWithLightColorStr:@"#CDCDCD" darkColorStr:@"#4C4C4C"];
}

+ (UIColor *)yqbuttonBackgroundColor {
    return [self yqcolorWithLightColorStr:@"#ffffff" darkColorStr:@"#000000"];
}

+ (UIColor *)yqLineColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor separatorColor];
    } else {
        return [UIColor whiteColor];
    }
}

+ (UIColor *)yqtextColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor labelColor];
    } else {
        return [UIColor whiteColor];
    }
}


+ (UIColor *)yqButtonTextColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor labelColor];
    } else {
        return [UIColor whiteColor];
    }

}

+ (UIColor *)yqcolorWithLightColorStr:(NSString *)lightColorStr darkColorStr:(NSString *)darkColorStr {
    UIColor *light = [UIColor colorWithHexString:lightColorStr];
    UIColor *dark = [UIColor colorWithHexString:darkColorStr];
    return [self yqcolorWithLightColor:light darkColor:dark];
}

+ (UIColor *)yqcolorWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        UIColor *color = [self colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            switch (traitCollection.userInterfaceStyle) {
                case UIUserInterfaceStyleDark:
                    return darkColor ? : lightColor;
                    break;
                
                default:
                    return lightColor;
                    break;
                    
            }
        }];
        return color;
    } else {
        return lightColor;
    }
    
    
    
}

+ (UIColor *) colorWithHexString: (NSString *)color withAlpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *) colorWithHexString: (NSString *)color
{
    return [UIColor colorWithHexString:color withAlpha:1.0];
}

@end
