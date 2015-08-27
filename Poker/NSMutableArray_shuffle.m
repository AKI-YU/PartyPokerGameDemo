//
//  NSMutablArray_shuffle.m
//  Poker
//
//  Created by AKI on 2015/8/25.
//  Copyright (c) 2015年 AKI. All rights reserved.
//


#import "NSMutableArray_shuffle.h"

@implementation NSMutableArray (Shuffle)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end

