//
//  CLAsyncOperation.h
//  Collections
//
//  Created by Tony Xiao on 7/1/12.
//  Copyright (c) 2012 Collections Labs, Inc. All rights reserved.
//  MIT License
//

#import <Foundation/Foundation.h>

// See http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/NSOperationQueue_class/Reference/Reference.html
// isExecuting | isFinished | isCancelled | State
//      NO           NO            NO       Not yet started
//      YES          NO            NO       Running
//      NO           YES           NO       Finished
//      YES          YES           NO       Impossible (maybe momentary transition)
//      NO           NO            YES      Cancelled, but not started
//      YES          NO            YES      Cancelled, but still running
//      NO           YES           YES      Cancelled, and finished (success unknown, could have finished or aborted)
//      YES          YES           YES      Impossible (maybe momentary transition)

// To use this class, override main but call finish when done
// Also automatically check for isCancelled right before operation begin.
// If cancelled will return immediately without executing main.
@interface CLAsyncOperation : NSOperation

// Call finish when done
- (void)finish;

+ (instancetype)asyncOperationWithBlock:(void(^)(CLAsyncOperation *operation))block;

@end

// To use this class, override mainSignal. Operation will be finished when signal sends complete or error
// If signal sends an error, operation.error will be set.
@interface CLSignalOperation : CLAsyncOperation

@property (nonatomic, strong) NSError *error;

- (RACSignal *)mainSignal;

@end