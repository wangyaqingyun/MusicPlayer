//
//  DBHandleOpration.h
//  Sqllite3Cdemo
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ClassMateMode;
@interface DBHandleOpration : NSObject


+(instancetype)ShardDBHandle;

 /*
 *插入记录
 */
-(BOOL)insertFisrt:(ClassMateMode *)mode;

 /*
 *修改记录
 */
-(BOOL)updateValueForMode:(ClassMateMode *)mode;
/*
 *查询所有的记录
 */
-(NSMutableArray *)selectAll;
/*
 *根据ID查询记录
 */
-(NSMutableArray *)selectForId:(int)ID;
/*
 *删除一条记录根据ID
 *
 */
-(BOOL)DeleteForId:(int)ID;



@end
