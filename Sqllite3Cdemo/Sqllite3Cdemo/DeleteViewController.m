//
//  DeleteViewController.m
//  Sqllite3Cdemo
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "DeleteViewController.h"
#import "DBHandleOpration.h"


@interface DeleteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfID;

@end

@implementation DeleteViewController


-(void)deleteID{
    if ([[DBHandleOpration ShardDBHandle] DeleteForId:_tfID.text.intValue]){
        NSString *message=[NSString stringWithFormat:@"ID:%@记录删除完成",_tfID.text];
        UIAlertView *alter=[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alter show];
    };
}


-(void)addsubView{
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteID)];
    self.navigationItem.rightBarButtonItem=item;
    
}


- (void)viewDidLoad {
    [self addsubView];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
