//
//  SignUpPage.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/3.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "SignUpPage.h"

#import <Parse/Parse.h>

@interface SignUpPage () <UITextFieldDelegate>
{

    UIButton *FBButton ;
    UITextField *userNameText;
    UITextField *passwordText;
    UITextField *emailText;
    UIButton *signUpButton;
}

@end

@implementation SignUpPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self allUi];
    
    
    
}



-(void)allUi
{
    //背景圖片
    UIImageView *backgroundImage = [[UIImageView alloc]init];
    backgroundImage.image = [UIImage imageNamed:@"003"];
    backgroundImage.frame = self.view.frame;
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImage.clipsToBounds = YES;
    [self.view addSubview:backgroundImage];
    
    //特效view
    UIView *effectView = [[UIView alloc]initWithFrame:self.view.frame];
    effectView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    [self.view addSubview:effectView];
    
    //臉書按鈕
    FBButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    FBButton.center = CGPointMake(self.view.frame.size.width/2, 200);
    [FBButton setTitle:@"以Facebook帳戶註冊" forState:normal];
    [FBButton setBackgroundColor:[UIColor colorWithRed:  24/255.0 green:86/255.0 blue:255/255.0 alpha:1]];
    [FBButton setTitleColor:[UIColor whiteColor] forState:normal];
    FBButton.layer.cornerRadius = 5;
   // [self.view addSubview:FBButton];
    
    //使用者名稱textfield
    userNameText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    userNameText.center = CGPointMake(self.view.frame.size.width/2,100 );
    [userNameText setBorderStyle:UITextBorderStyleRoundedRect];
    userNameText.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    userNameText.placeholder = @"使用者名稱";
    userNameText.delegate = self;
    userNameText.textColor = [UIColor whiteColor];
    [self.view addSubview:userNameText];
    
    
    //密碼textField
    passwordText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    passwordText.center = CGPointMake(self.view.frame.size.width/2, 140);
    [passwordText setBorderStyle:UITextBorderStyleRoundedRect];
    passwordText.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    passwordText.layer.cornerRadius = 5;
    passwordText.delegate = self;
    passwordText.textColor = [UIColor whiteColor];
    [self.view addSubview:passwordText];
    
    //email textField
    emailText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    emailText.center = CGPointMake(self.view.frame.size.width/2, 180);
    [emailText setBorderStyle:UITextBorderStyleRoundedRect];
    emailText.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    emailText.layer.cornerRadius = 5;
    emailText.delegate = self;
    emailText.textColor = [UIColor whiteColor];
    [self.view addSubview:emailText];

    
    //註冊按鈕
    signUpButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    signUpButton.center = CGPointMake(self.view.frame.size.width/2, 280);
    signUpButton.backgroundColor = [UIColor redColor];
    [signUpButton setTitle:@"註冊" forState:normal];
    [signUpButton addTarget:self action:@selector(userRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpButton];
    
    
    
    //加個tap 收鍵盤用
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(justYap:)];
//    [self.view addGestureRecognizer:tap];

    
    
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    
}


-(void)userRegister:(UIButton*)signUpButton
{
    PFUser *user = [PFUser user];
    user.username = userNameText.text;
    user.password = passwordText.text;
    user.email = emailText.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if (!error) {
            //The registration was successful, go to the wall
            //[self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
            
            NSLog(@"註冊成功");
            
        } else {
           
            NSLog(@"註冊失敗喔");
        
        
        }
    }];
    
    
    
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
