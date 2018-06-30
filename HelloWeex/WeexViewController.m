//
//  WeexViewController.m
//  HelloWeex
//
//  Created by chenmf on 2018/6/29.
//  Copyright © 2018年 xiao. All rights reserved.
//

#import "WeexViewController.h"

@interface WeexViewController ()<UIScrollViewDelegate, UIWebViewDelegate>
-(void)initWeex;
@end

@implementation WeexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:NO];
    [self initWeex];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initWeex{
    self.weexSDK.viewController = self;
    self.weexSDK.frame = self.view.frame;
    
    __weak typeof(self) weakSelf = self;
    self.weexSDK.onCreate = ^(UIView *view) {
        [weakSelf.view addSubview:view];
    };
    self.weexSDK.onFailed = ^(NSError *error) {
        //process failure
        NSLog(@"weexSDK onFailed : %@\n", error);
    };
    self.weexSDK.renderFinish = ^ (UIView *view) {
        //process renderFinish
    };
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"js"];
//    [self.weexSDK renderWithURL:url options:nil data:nil];
    
//    NSString *url = @"http://172.16.3.182:8081/dist/index.js";
    NSString *url = [NSString stringWithFormat:@"http://%@:8081/%@", @"172.16.3.182", @"dist/index.js"];
    [self.weexSDK renderWithURL:[NSURL URLWithString:url]];
}

- (WXSDKInstance *)weexSDK {
    if (!_weexSDK) {
        _weexSDK = [WXSDKInstance new];
    }
    return _weexSDK;
}

- (void)dealloc {
    [_weexSDK destroyInstance];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
