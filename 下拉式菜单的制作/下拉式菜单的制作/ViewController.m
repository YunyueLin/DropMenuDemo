//
//  ViewController.m
//  下拉式菜单的制作
//
//  Created by Wangguibin on 16/3/23.
//  Copyright © 2016年 DDYS. All rights reserved.
//

#import "ViewController.h"
#import "DOPDropDownMenu.h"
@interface ViewController ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>

@property (nonatomic,strong) DOPDropDownMenu *dropMenu;

@property (nonatomic,strong) NSArray *arr1;
@property (nonatomic,strong) NSArray *arr2;
@property (nonatomic,strong) NSArray *arr3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *arr1=@[@"1",@"2",@"3",@"4"];
    self.arr1 =arr1;

    NSArray *arr2=@[@"中国",@"韩国",@"朝鲜",@"日本"];
    self.arr2 =arr2;

    NSArray *arr3=@[@"北京",@"上海",@"广州",@"深圳"];
    self.arr3 =arr3;

    DOPDropDownMenu *drop= [[DOPDropDownMenu alloc]initWithOrigin:CGPointMake(0, 64) andHeight:100.0f];
    self.dropMenu=drop;
    drop.delegate=self;
    drop.dataSource=self;
    [self.view addSubview:drop];

}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 3;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{

    return 4;
}


- (NSString*)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    switch (indexPath.column) {
        case 0:
            return self.arr1[indexPath.row];
            break;
            case 1:
            return self.arr2[indexPath.row];
        case 2:
            return  self.arr3[indexPath.row];
        default:
            return nil;
            break;
    }
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath {

    NSLog(@"column:%li row:%li", (long)indexPath.column, (long)indexPath.row);
    NSLog(@"%@",[menu titleForRowAtIndexPath:indexPath]);

}


@end
