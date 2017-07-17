//
//  ViewController.m
//  Effective-2.0_消息转发机制
//
//  Created by 刘一峰 on 2017/7/17.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "ViewController.h"
#import "MsgTemp.h"
@interface ViewController ()
@property(nonatomic,strong)MsgTemp * msg;
@end



@implementation ViewController

- (MsgTemp *)msg {
    if (!_msg) {
        _msg = [MsgTemp new];
    }
    return _msg;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}
//调用一个无法解读的消息
- (IBAction)sendMsgClick:(UIButton *)sender {
    NSString * str = [self.msg performSelector:@selector(targetMethod:) withObject:nil];
    NSLog(@"%@",str);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
