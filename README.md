TFKit
====
#A lib for textfield.

## Pod

pod 'TSTFKit',:git=>'https://github.com/StoneStoneStoneWang/TSTFKit.git'

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
    
    phone.placeholder = @"请输入手机号";
    
    phone.leftImage = [UIImage imageNamed:@"手机"];
    
    [secret makeEditType:(TextFieldEditTypePhone)];
    
    phone.backgroundColor = [UIColor blueColor];
    
    phone.bottomLineColor = [UIColor lightGrayColor];
