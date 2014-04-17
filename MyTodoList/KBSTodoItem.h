//
//  KBSTodoItem.h
//  MyTodoList
//
//  Created by czetsuya on 4/17/14.
//  Copyright (c) 2014 Kalidad Business Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KBSTodoItem : NSObject

@property NSString *name;
@property BOOL completed;
@property (readonly) NSDate *created;
@property NSDate *completedDate;

- (void)markAsCompleted;

@end
