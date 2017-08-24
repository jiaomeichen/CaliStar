//
//  BaseViewController.m
//  CaliFM
//
//  Created by user on 2017/8/10.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setNavigationItamTitle:(NSString *)title size:(CGFloat)size textColor:(UIColor *)color{

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
    titleLabel.text = title;
    titleLabel.textColor = color;
    titleLabel.font = [UIFont systemFontOfSize:size];
    self.navigationItem.titleView = titleLabel;
    
}
- (void)setNavigationItamLeftButton:(NSString *)image selectedImage:(NSString *)selectedImage  action:(nonnull SEL)action {
   
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:(@selector(action)) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
