//
//  RMTipsView.h
//  RMTipsView
//
//  Created by zy on 2017/4/19.
//  Copyright © 2017年 renwohua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMTipsView : UIView

// 右侧 退出图片
@property (nonatomic,  copy) NSString * editImage;
// 背景颜色
@property (nonatomic,strong) UIColor * bgColor;

// 提示 内容
@property (nonatomic,  copy) NSString * tipString;
// 提示 文字颜色
@property (nonatomic,strong) UIColor * tipTextColor;
// 提示 文字大小
@property (nonatomic,assign) CGFloat tipTextFont;

+ (instancetype)tipsView:(CGRect)frame;

@end
