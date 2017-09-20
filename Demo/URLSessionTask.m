//
//  URLSessionTask.m
//  Demo
//
//  Created by 李峰 on 2017/9/8.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "URLSessionTask.h"

@interface URLSessionTask()
@property (nonatomic, strong, readwrite) NSURLSessionTask *subTask;
@end

@implementation URLSessionTask

+ (instancetype) taskWithSubTask:(NSURLSessionTask *)st
{
    URLSessionTask *task = [URLSessionTask new];
    task.subTask = st;
    return task;
}

- (void) cancel
{
    //先判断task的状态，然后cancel掉
    if (self.subTask.state == NSURLSessionTaskStateRunning) {
        [self.subTask cancel];
    }
}

@end
