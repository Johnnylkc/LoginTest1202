//
//  HomeCell.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/2.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if ( self) {
        
        self.modelImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100  , 100)];
        self.modelImage.contentMode = UIViewContentModeScaleAspectFill;
        self.modelImage.clipsToBounds = YES;
        [self.contentView addSubview:self.modelImage];
    }
    
    
    return self;
}









- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
