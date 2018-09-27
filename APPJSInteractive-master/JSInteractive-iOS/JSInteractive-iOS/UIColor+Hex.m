//
//  UIColor+Hex.m
//  JSInteractive-iOS
//
//  Created by Steven on 2018/9/14.
//  Copyright © 2018年 Spark. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(long)hexColor {
    return [UIColor colorWithHex:hexColor alpha:1];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)alpha {
    float red=((float)((hexColor & 0xFF0000)>>16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
