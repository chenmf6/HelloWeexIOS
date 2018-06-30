//
//  WeexViewController.h
//  HelloWeex
//
//  Created by chenmf on 2018/6/29.
//  Copyright © 2018年 xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeexSDK.h"

@interface WeexViewController : UIViewController

//WXSDKInstance 属性
@property (strong, nonatomic)WXSDKInstance  *weexSDK;
// weex 视图
@property(nonatomic, strong)UIView *weexView;
// URL属性(用于指定加载js的URL, 一般申明在接口中)
@property (nonatomic, strong) NSURL *url;
@end
