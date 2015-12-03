//
//  LandingPage.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/3.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "LandingPage.h"

#import "LoginVC.h"

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
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [button setTitle:@"test" forState:normal];
    [button addTarget:self action:@selector(toNext:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button];
    
    
    
    
    
}





-(void)toNext:(UIButton*)button
{
    LoginVC *controller = [[LoginVC alloc] init];
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
