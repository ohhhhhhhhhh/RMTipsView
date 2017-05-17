//
//  RMTipsView.m
//  RMTipsView
//
//  Created by zy on 2017/4/19.
//  Copyright © 2017年 renwohua. All rights reserved.
//

#define MAS_SHORTHAND

#import "RMTipsView.h"
#import <Masonry.h>

@interface RMTipsView ()

@property (nonatomic,  weak) UIScrollView * tipScrollView;

@property (nonatomic,  weak) UILabel * tipLabel;

@property (nonatomic,  weak) UIImageView * editImageView;

@property (nonatomic,assign) CGFloat tipLabelWidth;

@end

@implementation RMTipsView

+ (instancetype)tipsView:(CGRect)frame{
    
    return [[self alloc] initWithFrame:frame];
}

#pragma mark - helper
- (void)addAnimation{
    
    CGFloat distance = self.tipLabelWidth-CGRectGetWidth(self.tipScrollView.frame);
    
    if (distance <= 0) {
        return;
    }
    CGRect frame = self.tipLabel.frame;
    
    [UIView animateWithDuration:distance/20 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.tipLabel.frame = CGRectMake(-distance, frame.origin.y, frame.size.width, frame.size.height);
        
    } completion:^(BOOL finished) {
        
        self.tipLabel.frame = CGRectMake(0, frame.origin.y, frame.size.width, frame.size.height);
        [self addAnimation];
    }];
}

#pragma mark -set data
-(void)setTipString:(NSString *)tipString{
    
    NSString * tipStr = [NSString stringWithFormat:@"   %@",tipString];
    _tipString = tipStr;
    self.tipLabel.text = tipStr;
    
    self.tipLabelWidth = [tipStr boundingRectWithSize:CGSizeMake(MAXFLOAT,self.tipLabel.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.f]} context:nil].size.width;
    
    CGRect labelRect = self.tipLabel.frame;
    
    if (self.tipLabelWidth > CGRectGetWidth(self.tipScrollView.frame)) {
        
        self.tipScrollView.contentSize = CGSizeMake(self.tipLabelWidth, self.tipScrollView.frame.size.height);
        
        labelRect.size.width = self.tipLabelWidth;
        self.tipLabel.frame = labelRect;
        
        [self addAnimation];
    }else{
        self.tipLabel.frame = CGRectMake(0, labelRect.origin.y, labelRect.size.width, labelRect.size.height);
        [self.layer removeAllAnimations];
    }
}

-(void)setTipTextFont:(CGFloat)tipTextFont{
    
    _tipTextFont = tipTextFont;
    self.tipLabel.font = [UIFont systemFontOfSize:tipTextFont];
}

-(void)setTipTextColor:(UIColor *)tipTextColor{
    
    _tipTextColor = tipTextColor;
    self.tipLabel.textColor = tipTextColor;
}

-(void)setBgColor:(UIColor *)bgColor{
    
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}

-(void)setEditImage:(NSString *)editImage{
    
    _editImage = editImage;
    self.editImageView.image = [UIImage imageNamed:editImage];
}

#pragma mark -make ui
-(UIScrollView *)tipScrollView{
    
    if (!_tipScrollView) {
        
        UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width-44.f, CGRectGetHeight(self.bounds))];
        scroll.scrollEnabled = NO;
        [self addSubview:scroll];
        _tipScrollView = scroll;
    }
    return _tipScrollView;
}

-(UILabel *)tipLabel{
    
    if (!_tipLabel) {
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, (CGRectGetHeight(self.tipScrollView.frame)-16.f)/2.f, CGRectGetWidth(self.tipScrollView.frame), 16.f)];
        // F48808
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14.f];
        label.textAlignment = NSTextAlignmentLeft;
        // FFFCEE
        [self.tipScrollView addSubview:label];
        _tipLabel = label;
    }
    return _tipLabel;
}

-(UIImageView *)editImageView{
    if (!_editImageView) {
        
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.tipScrollView.frame)+8.f, (CGRectGetHeight(self.bounds)-12.f)/2.f, 7.f, 12.f)];
        // tips_x_icon
        // FFFCEE
        imageview.translatesAutoresizingMaskIntoConstraints = NO;
        imageview.backgroundColor = [UIColor grayColor];
        [self addSubview:imageview];
        _editImageView = imageview;
    }
    return _editImageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
