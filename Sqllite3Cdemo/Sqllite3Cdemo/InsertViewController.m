//
//  InsertViewController.m
//  Sqllite3Cdemo
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "InsertViewController.h"
#import "ClassMateMode.h"
#import "DBHandleOpration.h"

@interface InsertViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfID;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation InsertViewController



-(void)SaveValue{
    
    
    
    ClassMateMode *mode=[[ClassMateMode alloc] initWith:_tfName.text Id:_tfID.text.intValue phoneFor:_tfPhone.text icon:UIImageJPEGRepresentation(_iconImage.image, 1)];
    //执行插入操作
    
    if ([[DBHandleOpration ShardDBHandle] insertFisrt:mode]) {
        NSLog(@"=====chenggon");
    };
    
    
    

}

-(void)addsubView{

    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(SaveValue)];
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
