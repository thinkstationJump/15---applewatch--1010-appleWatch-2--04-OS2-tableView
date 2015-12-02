//
//  InterfaceController.m
//  04-OS2-tableView WatchKit Extension
//
//  Created by xiaomage on 15/10/10.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#warning tableView 是OS1就出现的,在OS2中并没有什么改进/添加方法属性

#import "InterfaceController.h"
#import "XMGCell.h"


@interface InterfaceController()

/*
 - (void)setRowTypes:(NSArray<NSString*> *)rowTypes;                                         // row names. size of array is number of rows
 - (void)setNumberOfRows:(NSInteger)numberOfRows withRowType:(NSString *)rowType; // repeating row name
 
 @property(nonatomic,readonly) NSInteger numberOfRows;
 - (nullable id)rowControllerAtIndex:(NSInteger)index;
 
 - (void)insertRowsAtIndexes:(NSIndexSet *)rows withRowType:(NSString *)rowType;
 - (void)removeRowsAtIndexes:(NSIndexSet *)rows;
 
 - (void)scrollToRowAtIndex:(NSInteger)index;
 */
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *tableVIew;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self.tableVIew setNumberOfRows:5 withRowType:@"xmgcell"];
    
    // tableView有一个只读的属性可以拿到行数
    //NSInteger rowNum = self.tableVIew.numberOfRows;
    for (NSInteger i = 0; i < self.tableVIew.numberOfRows; i++) {
        
        XMGCell *cell = [self.tableVIew rowControllerAtIndex:i];
        
        [cell setCellWithImaName:[NSString stringWithFormat:@"img_0%d.png", i] Text:[NSString stringWithFormat:@"cell-%d", i]];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 首先添加row的时候,需要传2个参数
        // insertRowsAtIndexes:NSIndexSet
        // row的identifier
        [self.tableVIew insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:0]
                                withRowType:@"cell2"];
    });
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

// 此方法是属于WKInterfaceController,不必设置tableView的数据源or代理
// cell选中的时候调用的方法
- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    XMGCell *cell = [table rowControllerAtIndex:rowIndex];
    [cell setCellWithImaName:nil Text:@"cell-didSelectRowAtIndex"];
}

@end



