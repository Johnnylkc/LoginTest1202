//
//  LoginVC.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/2.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "LoginVC.h"

#import "HomeTVC.h"

#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>

@interface LoginVC () <UITextFieldDelegate>
{
    UIButton *FBButton;
    UITextField *userNameText;
    UITextField *passwordText;
    UILabel *orLabel;
    UIButton *loginButton;
    
    
    
}





@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self allUi];
    

}


-(void)allUi
{
    //背景圖片
    UIImageView *backgroundImage = [[UIImageView alloc] init];
    backgroundImage.frame = self.view.frame;
    backgroundImage.image = [UIImage imageNamed:@"001"];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImage.clipsToBounds = YES;
    [self.view addSubview:backgroundImage];
    
    //FB登入按鈕
    FBButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 250, 30)];
    FBButton.center = CGPointMake(self.view.frame.size.width/2, 200);
    [FBButton setBackgroundColor:[UIColor colorWithRed:24/255.0 green:86/255.0 blue:255/255.0 alpha:1]];
    [FBButton setTitle:@"facebook登入" forState:normal];
    [FBButton setTitleColor:[UIColor whiteColor] forState:normal];
    FBButton.layer.cornerRadius = 5;
    [FBButton addTarget:self action:@selector(ggg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:FBButton];
    
    
    //第一個textfield : userName
    userNameText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    userNameText.center = CGPointMake(self.view.frame.size.width/2,300 );
    [userNameText setBorderStyle:UITextBorderStyleRoundedRect];
    userNameText.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    userNameText.placeholder = @"使用者名稱";
    userNameText.delegate = self;
    userNameText.textColor = [UIColor whiteColor];
    [self.view addSubview:userNameText];
    
    
    //第二個textFiled : 密碼
    passwordText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    passwordText.center = CGPointMake(self.view.frame.size.width/2, 340);
    [passwordText setBorderStyle:UITextBorderStyleRoundedRect];
    passwordText.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    passwordText.layer.cornerRadius = 5;
    passwordText.delegate = self;
    passwordText.textColor = [UIColor whiteColor];
    [self.view addSubview:passwordText];
    
    //textfield placeholder變色
    UIColor *color = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.3];
    userNameText.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"使用者名稱" attributes:@{NSForegroundColorAttributeName: color}];
    
    passwordText.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"密碼" attributes:@{NSForegroundColorAttributeName: color}];
    
    //or Label
    orLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    orLabel.textColor = [UIColor whiteColor];
    orLabel.text = @"或";
    orLabel.font = [UIFont boldSystemFontOfSize:20];
    [orLabel sizeToFit];
    orLabel.center = CGPointMake(self.view.frame.size.width/2, 250);
    [self.view addSubview: orLabel];
    
    //登入按鈕
    loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    loginButton.center = CGPointMake(self.view.frame.size.width/2, 380);
    [loginButton setTitle:@"登入" forState:normal];
    loginButton.backgroundColor = [UIColor blueColor];
    [loginButton setTintColor:[UIColor whiteColor]];
    [loginButton addTarget:self action:@selector(justLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    //我要加一個tap的gesture
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(justTap:)];
    [self.view addGestureRecognizer:tapGest];
    
}




- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
    
   [UIView animateWithDuration:0.3 animations:^{
       FBButton.center = CGPointMake(self.view.frame.size.width/2, 150);
       FBButton.backgroundColor = [UIColor clearColor];
       [FBButton setTitleColor:[UIColor clearColor] forState:normal];
       
       orLabel.center = CGPointMake(self.view.frame.size.width/2, 200);
       orLabel.textColor = [UIColor clearColor];
   
       userNameText.center = CGPointMake(self.view.frame.size.width/2,200 );

       passwordText.center = CGPointMake(self.view.frame.size.width/2, 240);

   
   
   
   }];
    
    NSLog(@"可以輸入使用者名稱了");
    
}




-(void)justTap:(UISwipeGestureRecognizer *)tapGest
{
    
    NSLog(@"可以輸入密碼了");
    
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        FBButton.center = CGPointMake(self.view.frame.size.width/2, 200);
        [FBButton setBackgroundColor:[UIColor colorWithRed:24/255.0 green:86/255.0 blue:255/255.0 alpha:1]];
        [FBButton setTitleColor:[UIColor whiteColor] forState:normal];

        orLabel.center = CGPointMake(self.view.frame.size.width/2, 250);
        orLabel.textColor = [UIColor whiteColor];

        userNameText.center = CGPointMake(self.view.frame.size.width/2,300 );
        passwordText.center = CGPointMake(self.view.frame.size.width/2, 340);

        
    }];
    
    
}


#pragma mark - 登入
////登入功能
-(void)justLogin:(UIButton*)loginButton
{
    [PFUser logInWithUsernameInBackground:userNameText.text password:passwordText.text block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        
        if (user) {
            
            NSLog(@"登入成功的拉拉拉拉拉");
            
            HomeTVC *controller = [[HomeTVC alloc] init];
            
            UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:controller];
            
            [self presentViewController:homeNav animated:NO completion:nil];

            
        }else{
            
            NSLog(@"登入失敗喔");
            
            
        }
        
        
    }];
    
    
}







//要跳出來的controller 的 nav 是在這裡生成的
-(void)ggg:(UIButton*)FBButton
{

    HomeTVC *controller = [[HomeTVC alloc] init];
    
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    [self presentViewController:homeNav animated:NO completion:nil];
    
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
