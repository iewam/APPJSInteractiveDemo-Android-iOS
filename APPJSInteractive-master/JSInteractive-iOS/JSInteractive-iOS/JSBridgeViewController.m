//
//  JSBridgeViewController.m
//  JSInteractive-iOS
//
//  Created by Steven on 2018/9/14.
//  Copyright © 2018年 Spark. All rights reserved.
//

#import "JSBridgeViewController.h"
#import <WebViewJavascriptBridge.h>
#import "NSDictionary+Json.h"

#define kMainWidth [UIScreen mainScreen].bounds.size.width
#define kMainHeight [UIScreen mainScreen].bounds.size.height

@interface JSBridgeViewController ()

@property (nonatomic, strong) WebViewJavascriptBridge *bridge;

@end

@implementation JSBridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JSBridge";
    
    [self setupJsBridge];
    
    // 加载测试用的HTML页面
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"jsbridge" ofType:@"html"]];
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.50:8080/we_chat/views/invite_user.html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}


- (void)nativeCallJS {
//    [self.bridge callHandler:<#(NSString *)#>]
//    [self.bridge callHandler:<#(NSString *)#> data:<#(id)#>]
    [self.bridge callHandler:@"showQRCodePage" data:@"native call js" responseCallback:nil];
}

//- (void)nativeCallJSWithResponse {
//    [self.bridge callHandler:@"nativeCallJSWithResponse" data:@"native call js with response" responseCallback:^(id responseData) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"显示jsbridge返回值" message:responseData delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
//        [alert show];
//    }];
//}

- (void)setupJsBridge {
    if (self.bridge) return;
    
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    
    [self.bridge registerHandler:@"share" handler:^(id data, WVJBResponseCallback responseCallback) {
        // 这里Response的回调可以传id类型数据，但是为了保持Android、iOS的统一，全部使用json字符串作为返回数据
        NSDictionary *response = @{@"error": @(0), @"message": @"", @"data": @{@"os": @"ios"}};
        responseCallback([response jsonString]);
        
        NSLog(@"---- share ----");
    }];
    
//    [self.bridge registerHandler:@"login" handler:^(id data, WVJBResponseCallback responseCallback) {
//        if (data == nil || ![data isKindOfClass:[NSDictionary class]]) {
//            NSDictionary *response = @{@"error": @(-1), @"message": @"调用参数有误"};
//            responseCallback([response jsonString]);
//            return;
//        }
//
//        NSString *account = data[@"account"];
//        NSString *passwd = data[@"password"];
//        NSDictionary *response = @{@"error": @(0), @"message": @"登录成功", @"data" : [NSString stringWithFormat:@"执行登录操作，账号为：%@、密码为：@%@", account, passwd]};
//        responseCallback([response jsonString]);
//    }];
}


@end
