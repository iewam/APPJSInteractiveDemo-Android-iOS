//
//  JSWKWebViewController.m
//  JSInteractive-iOS
//
//  Created by Steven on 2018/9/14.
//  Copyright © 2018年 Spark. All rights reserved.
//

#import "JSWKWebViewController.h"
#import <Masonry.h>
#import "UIColor+Hex.h"

@interface JSWKWebViewController ()

@end

@implementation JSWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHex:0xf7f7f7];
    
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.webView];
    [self setupNativeButtons];
}

- (void)setupNativeButtons {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectZero];
    bgView.backgroundColor = [UIColor colorWithHex:0xFF0000 alpha:0.2];
    [self.view addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(0);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(200);
    }];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"原声区域";
    label.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    label.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(15);
        make.top.equalTo(bgView).offset(15);
    }];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectZero];
    [btn1 setTitle:@"nativeCallJS" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(nativeCallJS) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitleColor:[UIColor colorWithHex:0x275fce] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:btn1];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label);
        make.top.equalTo(label.mas_bottom).offset(20);
    }];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectZero];
    [btn2 setTitle:@"nativeCallJSWithResponse" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(nativeCallJSWithResponse) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitleColor:[UIColor colorWithHex:0x275fce] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:btn2];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn1);
        make.top.equalTo(btn1.mas_bottom).offset(20);
    }];
    
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(bgView.mas_top);
    }];
}

- (void)nativeCallJS {};
- (void)nativeCallJSWithResponse {};


- (WKWebView *)webView {
    if (_webView == nil) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:[WKWebViewConfiguration new]];
    }
    return _webView;
}

@end
