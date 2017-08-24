//
//  TGFastBtn.m
//  baisibudejie
//
//  Created by targetcloud on 2017/3/7.
//  Copyright © 2017年 targetcloud. All rights reserved.
//

#import "TGFastBtn.h"

@implementation TGFastBtn

-(void)setupUI{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.xmg_y = 0;
    self.imageView.xmg_centerX = self.xmg_width * 0.5;
    //self.imageView.width = 50;
    //self.imageView.height = self.imageView.width;
    self.titleLabel.xmg_y = self.xmg_height - self.titleLabel.xmg_height ;
    [self.titleLabel sizeToFit];
    self.titleLabel.xmg_centerX = self.xmg_width * 0.5;
    
    
   
}

@end
