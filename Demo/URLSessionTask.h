//
//  URLSessionTask.h
//  Demo
//
//  Created by 李峰 on 2017/9/8.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  自定义请求任务，作为KTURLSessionTask的组件（用于取消，或暂停请求）
 */
@interface URLSessionTask : NSObject
#define URLSessionTaskMake(task) [URLSessionTask taskWithSubTask:task]

+ (instancetype) taskWithSubTask:(NSURLSessionTask*)st;
- (void)cancel;
@end
