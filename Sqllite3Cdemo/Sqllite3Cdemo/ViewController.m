//
//  ViewController.m
//  Sqllite3Cdemo
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "InsertViewController.h"
#import "EditViewController.h"
#import "SelectViewController.h"
#import "DeleteViewController.h"




@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *dataArrDesc;
@end

@implementation ViewController




- (void)viewDidLoad {
    _dataArrDesc=@[@"增加一条记录",@"修改记录",@"查询记录",@"删除记录",@"InsertViewController",@"EditViewController",@"SelectViewController",@"DeleteViewController"];
    
    
    
    UITableView *table=[[UITableView alloc] initWithFrame:self.view.bounds];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *Identifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.textLabel.text=_dataArrDesc[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller=[NSClassFromString(_dataArrDesc[indexPath.row+4]) new];
    controller.title=_dataArrDesc[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
