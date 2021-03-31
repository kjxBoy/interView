//
//  ViewController.m
//  01. ObserverRef
//
//  Created by yiche on 2021/3/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建Observer
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            switch (activity) {
                case kCFRunLoopEntry: {
                    CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                    NSLog(@"kCFRunLoopEntry - %@", mode);
                    CFRelease(mode);
                    break;
                }
                    
                case kCFRunLoopExit: {
                    CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                    NSLog(@"kCFRunLoopExit - %@", mode);
                    CFRelease(mode);
                    break;
                }
                    
                default:
                    break;
            }
        });
    // kCFRunLoopCommonModes默认包括kCFRunLoopDefaultMode、UITrackingRunLoopMode
    // 添加Observer到RunLoop中
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    // 释放
    CFRelease(observer);
}


@end
