//
//  CardMatchingGame.h
//  Test1b
//
//  Created by Lewis Cooper on 3/9/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject
{
    NSMutableArray *cards;
    Card *flippedCard;
    NSInteger flipIndex;
}



@property (readwrite) NSInteger score;

- (id) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;

- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card *) returnCard:(NSUInteger)index;

@end
