//
//  LoginVC.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/2.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()
{
    UIButton *FBButton;
    UITextField *userNameText;
    UITextField *passwordText;
    UILabel *orLabel;
    
    
    
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
    FBButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    FBButton.center = CGPointMake(self.view.frame.size.width/2, 200);
    [FBButton setBackgroundColor:[UIColor blueColor]];
    [FBButton setTitle:@"facebook登入" forState:normal];
    [FBButton setTitleColor:[UIColor whiteColor] forState:normal];
    FBButton.layer.cornerRadius = 5;
    [self.view addSubview:FBButton];
    
    
    //第一個textfield : userName
    userNameText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    userNameText.center = CGPointMake(self.view.frame.size.width/2,300 );
    [userNameText setBorderStyle:UITextBorderStyleRoundedRect];
    userNameText.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    userNameText.placeholder = @"使用者名稱";
    [self.view addSubview:userNameText];
    
    
    //第二個textFiled : 密碼
    passwordText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    passwordText.center = CGPointMake(self.view.frame.size.width/2, 340);
    [passwordText setBorderStyle:UITextBorderStyleRoundedRect];
    passwordText.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    passwordText.layer.cornerRadius = 5;
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
    
    
    //我要加一個tap的gesture
//    UITapGestureRecognizer *tapGest = [UITapGestureRecognizer alloc] initWithTarget:self action:@selector()];
//    
//    
//}



//鍵盤因為textField被點擊開始編輯 而出現 順便執行動畫
- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    

    

    
    
}



- (void)textFieldDidEndEditing:(UITextField *)textField
{


    
    
    
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
