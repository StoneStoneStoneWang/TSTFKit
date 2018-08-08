//
//  ViewController.m
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "ViewController.h"
#import "TSTextField.h"
#import "TFLeftTitleTF.h"
#import "TFLeftImageTF.h"
#import "NSString+Util.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *aa = @"aaaaaaaa@163.com";
    
    NSLog(@"%d",[aa validEmail]);
    
    // Do any additional setup after loading the view, typically from a nib.
    
    TSTextField *tf = [[TSTextField alloc] initWithFrame: CGRectMake(20, 20, self.view.bounds.size.width - 40, 48)];
    
    [self.view addSubview:tf];
    
    tf.bottomLineColor = [UIColor lightGrayColor];
    
    tf.placeholder = @"请输入手机号";
    
    [tf makeEditType:(TextFieldEditTypePhone)];
    
    TFLeftTitleTF *ltf = [[TFLeftTitleTF alloc] initWithFrame: CGRectMake(20, 80, self.view.bounds.size.width - 40, 48)];
    
    [self.view addSubview:ltf];
    
    ltf.placeholder = @"请输入手机号";
    
    ltf.leftTitle = @"手机号";
    
    ltf.bottomLineColor = [UIColor lightGrayColor];
    
    [ltf makeEditType:(TextFieldEditTypePhone)];
    
    TFLeftTitleTF *vcode_4 = [[TFLeftTitleTF alloc] initWithFrame: CGRectMake(20, 130, self.view.bounds.size.width - 40, 48)];
    
    [self.view addSubview:vcode_4];
    
    vcode_4.placeholder = @"请输入验证码";
    
    vcode_4.leftTitle = @"验证码";
    
    vcode_4.bottomLineColor = [UIColor lightGrayColor];
    
    [vcode_4 makeEditType:(TextFieldEditTypeVCode_Length4)];
    
    TFLeftTitleTF *vcode_6 = [[TFLeftTitleTF alloc] initWithFrame: CGRectMake(20, 180, self.view.bounds.size.width - 40, 48)];
    
    [self.view addSubview:vcode_6];
    
    vcode_6.placeholder = @"请输入验证码";
    
    vcode_6.bottomLineColor = [UIColor lightGrayColor];
    
    vcode_6.leftTitle = @"验证码";
    
    [vcode_6 makeEditType:(TextFieldEditTypeVCode_Length6)];
    
    TFLeftTitleTF *price = [[TFLeftTitleTF alloc] initWithFrame: CGRectMake(20, 230, self.view.bounds.size.width - 40, 48)];
    
    [self.view addSubview:price];
    
    price.bottomLineColor = [UIColor lightGrayColor];
    
    price.placeholder = @"请输入支付金额";
    
    price.leftTitle = @"支付";
    
    [price makeEditType:(TextFieldEditTypePriceEdit)];
    
    
    TFLeftTitleTF *secret = [[TFLeftTitleTF alloc] initWithFrame: CGRectMake(20, 280, self.view.bounds.size.width - 40, 48)];
    
    [self.view addSubview:secret];
    
    secret.placeholder = @"请输入6-18位密码";
    
    secret.leftTitle = @"密码";
    
    [secret makeEditType:(TextFieldEditTypeSecret)];
    
    secret.bottomLineColor = [UIColor lightGrayColor];
    
    TFLeftImageTF *phone = [[TFLeftImageTF alloc] initWithFrame: CGRectMake(20, 330, self.view.bounds.size.width - 40, 48)];
    
    [self.view addSubview:phone];
    
    phone.textColor = [UIColor whiteColor];
    
    phone.placeholder = @"请输入手机号";
    
    phone.leftImage = [UIImage imageNamed:@"手机"];
    
    [phone makeEditType:(TextFieldEditTypePhone)];
    
    phone.backgroundColor = [UIColor blueColor];
    
    phone.bottomLineColor = [UIColor lightGrayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:true];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
