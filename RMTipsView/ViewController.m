//
//  ViewController.m
//  RMTipsView
//
//  Created by zy on 2017/4/19.
//  Copyright © 2017年 renwohua. All rights reserved.
//

#import "ViewController.h"
#import "RMTipsView.h"

@interface ViewController ()

@property (nonatomic,  weak) RMTipsView * tipView;

@property (nonatomic,assign) int i;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.i = 1;
    
    self.tipView.bgColor = [UIColor yellowColor];
    self.tipView.tipString = @"加大环境大会发布啊是大喊大叫回复啊 u 回答是健康的那款设备弧度啊巨大的u 的年纪啊麦当娜时代";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.i%2 == 0) {
        self.tipView.tipString = @"加大环境大会发布啊是大喊大叫回复啊 u 回答是健康的那款设备弧度啊巨大的u 的年纪啊麦当娜时代";
        self.i++;
    }else{
        self.tipView.tipString = @"山东科技示范户空间啊方便啊当娜时";
        self.i++;
    }
    
}

-(RMTipsView *)tipView{
    
    if (!_tipView) {
        
        RMTipsView * view = [RMTipsView tipsView:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
        [self.view addSubview:view];
        _tipView = view;
    }
    return _tipView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
