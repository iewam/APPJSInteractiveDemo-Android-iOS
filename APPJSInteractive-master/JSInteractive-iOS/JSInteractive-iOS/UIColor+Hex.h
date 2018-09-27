//
//  UIColor+Hex.h
//  JSInteractive-iOS
//
//  Created by Steven on 2018/9/14.
//  Copyright © 2018年 Spark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)alpha;

@end
