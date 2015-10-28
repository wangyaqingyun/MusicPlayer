//
//  SelectViewController.m
//  Sqllite3Cdemo
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//


#import "SelectViewController.h"
#import "DBHandleOpration.h"
#import "ClassMateMode.h"



@interface SelectViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfID;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation SelectViewController
- (IBAction)selectForid:(id)sender {
    NSMutableArray *arr=[[DBHandleOpration ShardDBHandle] selectForId:_tfID.text.intValue];
    if (arr) {
        _dataArr=arr;
        //刷新tableView
        UITableView *tableview=(UITableView *)[self.view viewWithTag:10];
        [tableview reloadData];
    }
    

}

-(void)selectALL{
    NSMutableArray *arr=[[DBHandleOpration ShardDBHandle] selectAll];
    if (arr) {
        
        _dataArr=arr;
      //  [_dataArr arrayByAddingObjectsFromArray:arr];
        
        //刷新tableView
        UITableView *tableview=(UITableView *)[self.view viewWithTag:10];
        [tableview reloadData];
    }
    
    
    
}


-(void)addsubView{
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(selectALL)];
    self.navigationItem.rightBarButtonItem=item;
    
}



- (void)viewDidLoad {
    _dataArr=[NSMutableArray array];
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 94, self.view.frame.size.width, self.view.frame.size.height-94)];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.tag=10;
    [self.view addSubview:tableView];
    [self addsubView];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     static NSString *Identify=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Identify];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identify];
    }
    ClassMateMode *mode=_dataArr[indexPath.row];
    cell.imageView.image=[UIImage imageWithData:mode.ICON];
    cell.textLabel.text=[NSString stringWithFormat:@"ID:%d     name:%@",mode.ID,mode.NAME];
    cell.detailTextLabel.text=mode.PHONE;
    return cell;

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
