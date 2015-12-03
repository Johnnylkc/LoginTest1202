//
//  HomeTVC.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/2.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeTVC.h"
#import "HomeCell.h"


#import <Parse/Parse.h>
@interface HomeTVC ()
{
    NSMutableArray *locoDataArray;
    NSMutableDictionary *getDataDic;
    
    
}

@end

@implementation HomeTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"HomeCell"];
    
    [self parseDownload];
    
    self.tableView.rowHeight = 100;
    
    
}


-(void)parseDownload
{
    
    locoDataArray = [[NSMutableArray alloc]init];
    getDataDic = [[NSMutableDictionary alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"aboutModel"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       
        for (PFObject *allObjects in objects) {
            
            PFObject *order = allObjects[@"order"];
            PFObject *name = allObjects[@"name"];
            PFObject *age  = allObjects[@"age"];
            PFFile *modelPhoto = allObjects[@"image"];
            
            [modelPhoto getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
                
                if (error == nil) {
                    UIImage *image = [UIImage imageWithData:data];
                    
                    getDataDic = [@{@"order":order , @"name":name , @"age":age , @"image":image}mutableCopy];
                    
                    [locoDataArray addObject:getDataDic];
                    
                    NSLog(@"%@" , locoDataArray);
                }
                
                [self.tableView reloadData];
                
            }];
            
        }
        
    }];
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return locoDataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    NSDictionary *dicForCell = locoDataArray[indexPath.row];
    
    cell.modelImage.image = dicForCell[@"image"];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
