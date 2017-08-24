//
//  TGPublishV.m
//  baisibudejie
//
//  Created by targetcloud on 2017/5/20.
//  Copyright © 2017年 targetcloud. All rights reserved.
//

#import "TGPublishV.h"
#import "TGFastBtn.h"

#import <POP.h>

static CGFloat const AnimationDelay = 0.1;
static CGFloat const SpringFactor = 10;
CGFloat const TagMargin = 5;
CGFloat const Margin = 10;

@implementation TGPublishV

- (void)awakeFromNib {
    [super awakeFromNib];
    RootV.userInteractionEnabled = NO;
    self.userInteractionEnabled = NO;
    NSArray *titles = @[@"发车型",@"发图片",@"发段子",@"发声音",@"发链接",@"音乐相册"];
    NSArray *images = @[@"publish-text",@"publish-picture",@"publish-offline",@"publish-audio",@"publish-link",@"publish-review"];
    CGFloat buttonW = 72;
    CGFloat buttonH = buttonW + 30;
    NSInteger maxCols = 3;
    CGFloat buttonStratX = 2 * Margin;
    //间隔
    CGFloat buttonXMargin = (ScreenWidth - 2 * buttonStratX - maxCols * buttonW) / (maxCols - 1);
    //
    CGFloat buttonYMargin = Marin + 3;
    CGFloat buttonStratY = (ScreenHeight - 2 * buttonH) * 0.5;
    for (NSInteger i = 0 ; i < titles.count; i++) {
        TGFastBtn *button = [TGFastBtn buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        NSInteger row = i / maxCols;
        NSInteger col = i % maxCols;
        CGFloat buttonX = buttonStratX + col * (buttonW + buttonXMargin);
        CGFloat buttonEndY = buttonStratY + row * (buttonH + buttonYMargin);
        CGFloat buttonBeginY = buttonEndY - ScreenHeight;
        [self addSubview:button];
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.springSpeed = SpringFactor;
        anim.springBounciness = SpringFactor;
        anim.beginTime = CACurrentMediaTime() + AnimationDelay * i;
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonBeginY, buttonW, buttonH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonEndY, buttonW, buttonH)];
        [button pop_addAnimation:anim forKey:nil];
    }
    //精彩填满生活
    UIImageView *titleImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    titleImageV.xmg_y = ScreenHeight * 0.15 - ScreenHeight;
    [self addSubview:titleImageV];
    
    CGFloat centerX = ScreenWidth * 0.5;
    CGFloat titleStartY = titleImageV.xmg_y;
    CGFloat titleEndY = ScreenHeight * 0.15;
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    [titleImageV pop_addAnimation:anim forKey:nil];
    anim.springSpeed = SpringFactor;
    anim.springBounciness = SpringFactor;
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(centerX, titleStartY)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, titleEndY)];
    anim.beginTime = CACurrentMediaTime() + images.count * AnimationDelay;
    
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        RootV.userInteractionEnabled = YES;
        self.userInteractionEnabled = YES;
    }];
    
}

- (IBAction)cancel:(id)sender {
    
    [self cancelWithCompletionBlock:nil];
    
    
}

- (void)cancelWithCompletionBlock:(void(^)())completionBlock{
    RootV.userInteractionEnabled = NO;
    self.userInteractionEnabled = NO;
    NSInteger beginI = 2;
    for (NSInteger i = beginI; i < self.subviews.count; i++) {
        UIView *currentView = self.subviews[i];
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        CGFloat endY = currentView.xmg_y + ScreenHeight;
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(currentView.xmg_centerX, endY)];
        anim.beginTime = CACurrentMediaTime() + (i - beginI) * AnimationDelay;
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [currentView pop_addAnimation:anim forKey:nil];
        if (i == self.subviews.count - 1) {
            [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
                RootV.userInteractionEnabled =YES;
                self.userInteractionEnabled = YES;
                [self removeFromSuperview];
                !completionBlock ? : completionBlock();
            }];
        }
    }
}

- (void)btnClick:(TGFastBtn *)button{
    [self cancelWithCompletionBlock:^{
       
        if (button.tag == 2){
//            TGPostWordVC *postWordVc = [[TGPostWordVC alloc] init];
//            TGNavigationVC *nav = [[TGNavigationVC alloc]initWithRootViewController:postWordVc];
//            UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
//            [root presentViewController:nav animated:YES completion:nil];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   // [self cancelWithCompletionBlock:nil];
}

@end
