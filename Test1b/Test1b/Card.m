//
//  Card.m
//  Practice1
//
//  Created by Lewis Cooper on 2/16/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "Card.h"

@implementation Card


- (NSInteger) match:(Card *)card
{
    if ([card.contents isEqualToString:self.contents]) {
        return 1;
    }
    else {
        return 0;
    }
}

@end
