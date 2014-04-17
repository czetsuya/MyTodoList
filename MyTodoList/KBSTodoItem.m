//
//  KBSTodoItem.m
//  MyTodoList
//
//  Created by czetsuya on 4/17/14.
//  Copyright (c) 2014 Kalidad Business Solutions. All rights reserved.
//

#import "KBSTodoItem.h"

@implementation KBSTodoItem

- (void)markAsCompleted
{
    self.completed = !self.completed;
    self.completedDate = [NSDate date];
}

@end
