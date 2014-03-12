//
//  CardMatchingGame.m
//  Test1b
//
//  Created by Lewis Cooper on 3/9/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "CardMatchingGame.h"

#import "Deck.h"
#import "Card.h"

@implementation CardMatchingGame



- (id) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            
            int check = -1;
            Card *newCard;
            
            while (check != 0) {
                newCard = [deck drawRandomCard];
                
                // if there are no cards then it cannot be a duplicate
                if ([cards count] == 0) {
                    check = 0;
                }
                
                // if the new card is already in the game try again
                else if ([newCard match:cards] == 1) {
                    check = -1;
                }
                
                // if the new card is really new then add the card
                else {
                    check = 0;
                }
            }
            
            [cards addObject:newCard];
        }
    }
    
    return self;
    
    
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
    // get the card that was just selected
    Card *cardFlipped = [cards objectAtIndex:index];
    
    // check to make sure the card is not already matched
    if (cardFlipped.matched == YES) {
        //do nothing pretend like it did not happen
    }
    
    // check to see if there is already a card flipped over
    else if (flippedCard == nil) {
        
        // subtract 1 for every card flipped
        self.score--;
        
        // set the card picked so it can be checked against
        [cardFlipped setChosen:YES];
        flipIndex = index;        
    }
    
    // they are flipping over a card that was face up
    else if (flipIndex == index) {
        [cardFlipped setChosen:NO];
        flipIndex = -1;
    }
    
    // otherwise check the card getting flipped over against the already flipped over one
    else {
        
        // subtract 1 for every card flipped
        self.score--;
        
        // get the suit and rank of the card
        char suit = [cardFlipped.contents characterAtIndex:0];
        char rank = [cardFlipped.contents characterAtIndex:1];
        char suit2 = [flippedCard.contents characterAtIndex:0];
        char rank2 = [flippedCard.contents characterAtIndex:1];
        
        if (suit == suit2) {
            // if the two cards have the same suit then add 4 points
            self.score += 4;
            [cardFlipped setMatched:YES];
            [flippedCard setMatched:YES];
        }
        else if (rank == rank2) {
            // if the two cards have the same rank then add 16 points
            self.score += 16;
            [cardFlipped setMatched:YES];
            [flippedCard setMatched:YES];
        }
        else {
            // if there is no match then take off the penalty of -2 points
            self.score -= 2;
        }
        
        // there should no longer be a card flipped over
        flippedCard = nil;
        // make the flipped card not chosen
        [flippedCard setChosen:NO];
        
    }    
}

- (Card *) returnCard:(NSUInteger)index
{
    return [cards objectAtIndex:index];
}



@end
