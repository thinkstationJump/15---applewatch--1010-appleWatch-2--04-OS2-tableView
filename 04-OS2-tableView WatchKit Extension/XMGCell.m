//
//  XMGCell.m
//  04-OS2-tableView
//
//  Created by xiaomage on 15/10/10.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "XMGCell.h"


@interface XMGCell ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *imageView;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *textLab;

@end

@implementation XMGCell

- (void)setCellWithImaName:(NSString *)imaName Text:(NSString *)text
{
    //[self.imageView setImageData:UIImagePNGRepresentation([UIImage imageNamed:imaName])];
    [self.imageView setImage:[UIImage imageNamed:imaName]];
    //[self.imageView setImageNamed:imaName];
    
    [self.textLab setText:text];
}

@end
