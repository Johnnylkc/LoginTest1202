//
//  LandingPage.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/3.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "LandingPage.h"
#import "LoginVC.h"
#import "SignUpPage.h"

@interface LandingPage ()

@end

@implementation LandingPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    [self allUi];

}


-(void)allUi
{
    //讓navi變透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    //讓nav“指示”都變色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];


    //下一頁的返回 不要有字 只要有箭頭
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //這個view的背景圖片
    UIImageView *backgroundImage = [[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImage.image = [UIImage imageNamed:@"002"];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImage.clipsToBounds = YES;
    [self.view addSubview:backgroundImage];
    
    //特效view
    UIView *effectView = [[UIView alloc] init];
    effectView.frame = self.view.frame;
    effectView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    [self.view addSubview:effectView];
    
    //登入按鈕
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 500, 140, 40)];
    [loginButton setTitle:@"登入" forState:normal];
    loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [loginButton setTitleColor:[UIColor whiteColor] forState:normal];
    loginButton.backgroundColor = [UIColor clearColor];
    loginButton.layer.borderWidth = 1;
    loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    loginButton.layer.cornerRadius = 5;
    [loginButton addTarget:self action:@selector(toLoginPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    //註冊按鈕
    UIButton *signinButton = [[UIButton alloc] initWithFrame:CGRectMake(170, 500, 140, 40)];
    [signinButton setTitle:@"註冊" forState:normal];
    [signinButton setTintColor:[UIColor whiteColor]];
    signinButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    signinButton.backgroundColor = [UIColor redColor];
    signinButton.layer.cornerRadius = 5;
    signinButton.clipsToBounds = YES;
    [signinButton addTarget:self action:@selector(toSignUpPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signinButton];
    
    

    
    
}



-(void)toLoginPage:(UIButton*)loginButton
{
    LoginVC *controller = [LoginVC new];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}



-(void)toSignUpPage:(UIButton*)signinButton
{
    
    SignUpPage *controller = [SignUpPage new];
    [self.navigationController pushViewController:controller animated:YES];
    
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
