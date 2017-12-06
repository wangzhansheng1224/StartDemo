//
//  LoginViewController.m
//  TabBarController
//
//  Created by 王战胜 on 2017/11/7.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "LoginViewController.h"
#import "UIBarButtonItem+MBCustom.h"

@interface LoginViewController ()
//手机号
@property (nonatomic, strong) UITextField *phoneTextField;
//密码
@property (nonatomic, strong) UITextField *passWordTextField;
//登录按钮
@property (nonatomic, strong) UIButton *loginButton;
//忘记密码
@property (nonatomic, strong) UIButton *forgetPasswordButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //导航栏透明时将原点设置在导航栏下端
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.passWordTextField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.forgetPasswordButton];
    [self layoutPageSubviews];
    // Do any additional setup after loading the view.
}

- (void)setupNav{
    UIBarButtonItem *registerButton = [UIBarButtonItem itmeWithNormalImage:nil high:nil target:self action:@selector(gotoregister) norColor:[UIColor whiteColor] highColor:[UIColor blackColor] title:@"注册账号"];
    self.navigationItem.rightBarButtonItem = registerButton;
    self.navigationItem.title = @"登录";
}

- (void)gotoregister{
    BAKit_ShowAlertWithMsg(@"注册");
}

-(void)layoutPageSubviews{
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(40);
        make.left.mas_equalTo(self.view).offset(30);
        make.right.offset(-30);
        make.height.mas_equalTo(40);
    }];
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneTextField.mas_bottom).offset(10);
        make.left.offset(30);
        make.right.offset(-30);
        make.height.mas_equalTo(40);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordTextField.mas_bottom).offset(30);
        make.left.offset(50);
        make.right.offset(-50);
        make.height.mas_equalTo(40);
    }];
    [self.forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(15);
        make.right.mas_equalTo(self.loginButton.mas_right);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(15);
    }];
}

-(UITextField *)phoneTextField{
    if (!_phoneTextField) {
        UITextField * textField = [[UITextField alloc]init];
        textField.placeholder = @"手机号";
        textField.backgroundColor = [UIColor whiteColor];
        textField.font = [UIFont systemFontOfSize:17];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        _phoneTextField = textField;
    }
    return _phoneTextField;
}
-(UITextField *)passWordTextField{
    if (!_passWordTextField) {
        UITextField * textField = [[UITextField alloc]init];
        textField.placeholder = @"密码";
        textField.backgroundColor = [UIColor whiteColor];
        textField.font = [UIFont systemFontOfSize:17];
        textField.keyboardType = UIKeyboardTypeEmailAddress;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.clearButtonMode = UITextFieldViewModeAlways;
        _passWordTextField = textField;
    }
    return _passWordTextField;
}

-(UIButton *)loginButton{
    if (!_loginButton) {
        UIButton *button = [[UIButton alloc]init];
        button.backgroundColor = COLOR_ORANGE;
        [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"登录" forState:UIControlStateNormal
         ];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        _loginButton = button;
    }
    return _loginButton;
}

- (void)login{
    BAKit_ShowAlertWithMsg(@"登录");
}

-(UIButton *)forgetPasswordButton{
    if (!_forgetPasswordButton) {
        UIButton *button = [[UIButton alloc]init];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"忘记密码" forState:UIControlStateNormal
         ];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _forgetPasswordButton = button;
    }
    return _forgetPasswordButton;
}
- (void)forgetPassword{
    BAKit_ShowAlertWithMsg(@"忘记密码");
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
