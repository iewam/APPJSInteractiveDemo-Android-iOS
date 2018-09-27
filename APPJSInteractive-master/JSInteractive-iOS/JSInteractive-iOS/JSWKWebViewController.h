//
//  JSWKWebViewController.h
//  JSInteractive-iOS
//
//  Created by Steven on 2018/9/14.
//  Copyright © 2018年 Spark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface JSWKWebViewController : UIViewController

@property (nonatomic, strong) WKWebView *webView;

- (void)nativeCallJS;
- (void)nativeCallJSWithResponse;

@end
