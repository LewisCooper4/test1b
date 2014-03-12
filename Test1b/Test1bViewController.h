//
//  Test1bViewController.h
//  Test1b
//
//  Created by Lewis Cooper on 3/9/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface Test1bViewController : UIViewController
{
    CardMatchingGame *game;
}

@property (nonatomic) IBOutletCollection(UIButton) NSMutableArray *buttons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
