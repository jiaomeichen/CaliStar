//
//  LoginViewController.m
//  CaliStar
//
//  Created by user on 2017/8/21.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginModel.h"
#import "TabBarViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)UITextField *userNameTF;
@property (nonatomic,strong)UITextField *passwordTF;
@property (nonatomic,strong)NSString *desKey;
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@property (strong, nonatomic) AFHTTPSessionManager *manager2;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation LoginViewController

/**懒加载*/
- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (AFHTTPSessionManager *)manager2
{
    if (!_manager2) {
        _manager2 = [AFHTTPSessionManager manager];
    }
    return _manager2;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat heightMargin = ScreenHeight *0.35;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(ScreenWidth, 400+heightMargin);
    [self.view addSubview:scrollView];
    
    UIImageView *logoImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"开利星空Logo"]];
    logoImg.frame = myRect(92, 60, 191,130);
    logoImg.layer.cornerRadius = 7;
    logoImg.clipsToBounds = YES;
    [scrollView addSubview:logoImg];
    
    
    self.userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(50, heightMargin, ScreenWidth-90, 35)];
    UIImageView *userNameImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_icon_people_pre"]];
    _userNameTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" 请输入手机号" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    //_userNameTF.clearButtonMode = UITextFieldViewModeAlways;
    _userNameTF.keyboardType = UIKeyboardTypeNumberPad;
    userNameImg.contentMode = UIViewContentModeCenter;
    _userNameTF.leftView = userNameImg;
    _userNameTF.leftViewMode = UITextFieldViewModeAlways;
   
    //
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 44)];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *comfirmBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(keyboardDismiss:)];
    toolBar.items = @[flexSpace,comfirmBtn];
    _userNameTF.inputAccessoryView = toolBar;
    _userNameTF.delegate = self;
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 34, 375-80, 1)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.userNameTF addSubview:line1];
    [scrollView addSubview:_userNameTF];
    
    
    self.passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(50, heightMargin+45, ScreenWidth-90, 35)];
    self.passwordTF.secureTextEntry = YES;
    _passwordTF.inputAccessoryView = toolBar;
    UIImageView *passwordImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_icon_Password_pre"]];
    _passwordTF.leftView = passwordImg;
    _passwordTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" 请输入密码" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    //_passwordTF.clearButtonMode = UITextFieldViewModeAlways;
    _passwordTF.leftViewMode = UITextFieldViewModeAlways;
    _passwordTF.delegate = self;
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, 34, 295, 0.7)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.passwordTF addSubview:line2];
    [scrollView addSubview:_passwordTF];
    
    self.userNameTF.text = @"liujian@calichina.cn";
    self.passwordTF.text = @"1365car";

    //登录
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setFrame:CGRectMake(40, heightMargin+120, ScreenWidth-80, 45)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 22.5;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[self createImageWithColor:HWColor(234, 86, 100)] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundImage:[self createImageWithColor:HWColor(183, 31, 48)] forState:UIControlStateHighlighted];
    loginBtn.clipsToBounds = YES;
    [scrollView addSubview:loginBtn];
    //注册
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setFrame:CGRectMake(40, heightMargin+180, ScreenWidth-80, 45)];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    registBtn.layer.cornerRadius = 22.5;
    registBtn.layer.borderColor = HWColor(234, 86, 100).CGColor;
    registBtn.layer.borderWidth = 1;
    [registBtn setTitleColor:HWColor(150, 150, 150) forState:UIControlStateNormal];
    [registBtn setBackgroundImage:[self createImageWithColor:HWColor(243, 243, 243)] forState:UIControlStateHighlighted];
    registBtn.clipsToBounds = YES;
    //[registBtn addTarget:self action:@selector(intoRegist:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:registBtn];
    
    //忘记密码
    UIButton *forgetPasswordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [forgetPasswordBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [forgetPasswordBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    //[forgetPasswordBtn addTarget:self action:@selector(forgetPassEvEnt:) forControlEvents:UIControlEventTouchUpInside];
    [forgetPasswordBtn setFrame:CGRectMake(ScreenWidth-100, heightMargin+240, 70, 13)];
    [scrollView addSubview:forgetPasswordBtn];
    
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y + textField.frame.size.height + 216 +50);
    if (offset <= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = offset;
            self.view.frame = frame;
        }];
    }
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
    }];
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)loginBtn{

    //发送请求
    [self postLoad];
    YYLog(@"点击了");
}

-(void)postLoad{
   
    [self setupPost];
    [self setupKeyWindow];
}

//- (void)setFirstPost{
//    //网络请求
//    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [self.manager POST:@"http://192.168.1.215:8080/wp-login.php" parameters:@{@"log":_userNameTF.text,@"pwd":_passwordTF.text}progress:^(NSProgress * _Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString * html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
////        NSDictionary *redic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
////        NSArray *dictArray=redic[@"content"];
//        YYLog(@"----%@",html);
//        if ([html containsString:@""]) {
//            
//            //定时器
//        }
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        YYLog(@"++++++%@",error);
//    }];
//}

- (void)setupPost{
   
//    self.manager2.requestSerializer = [AFHTTPRequestSerializer serializer];
//    self.manager2.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [self.manager2 POST:@"http://192.168.1.215:8080/wp-content/themes/calistar/app/login.php" parameters:@{@"log":_userNameTF.text,@"pwd":_passwordTF.text} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//      NSString *token  = [responseObject objectForKey:@"path"];
//        NSMutableArray *redic= [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        _dataArray = [[NSMutableArray alloc]init];
////        for (int i =0; i<redic.count; i++) {
////            
////        }
////        for (NSMutableDictionary *dic in redic) {
////            YYLog(@"%@",dic);
////        }
////        YYLog(@"---%@",token);
//        
//        [self.navigationController pushViewController:[[TabBarViewController alloc]init] animated:YES];
//        
//} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    
//}];
    
    //网络请求
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
   [self.manager POST:@"http://192.168.1.215:8080/wp-content/themes/calistar/app/login.php" parameters:@{@"log":_userNameTF.text,@"pwd":_passwordTF.text} progress:^(NSProgress * _Nonnull uploadProgress) {
   } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
       
      
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
   }];
}
-(void)setupKeyWindow
{
[UIApplication sharedApplication].keyWindow.rootViewController = [[TabBarViewController alloc]init];
    YYLog(@"safdghjklk;kjhgf");
}
//- (void)intoRegist:(id)sender
//{
//    RegisterViewController *registVC = [[RegisterViewController alloc]init];
//    [self.navigationController pushViewController:registVC animated:YES];
//}




#pragma mark -- 忘记密码跳转
//-(void)forgetPassEvEnt:(UIButton *)sender
//{
//    ForgetViewController *pass = [[ForgetViewController alloc]init];
//    [self.navigationController pushViewController:pass animated:YES];
//    // self.navigationController.navigationBar.hidden=NO;
//}


#pragma mark --取消登录
- (void)passLogin:(id)sender
{
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"token"];
    [self dismissViewControllerAnimated:YES completion:^{
        
        [self.parentViewController.tabBarController setSelectedIndex:0];
    }];
}

- (void)keyboardDismiss:(id)sender
{
    [self.view endEditing:YES];
}
- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
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
