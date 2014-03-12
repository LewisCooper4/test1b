//
//  Test1bViewController.m
//  Test1b
//
//  Created by Lewis Cooper on 3/9/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "Test1bViewController.h"

#import "CardMatchingGame.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Card.h"

@interface Test1bViewController ()

@end

@implementation Test1bViewController
@synthesize scoreLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // create a new deck and then add the deck to the game
    
    //PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    //game = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:deck];
    
}

- (void)viewDidUnload
{
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)flip:(id)sender
{
    NSInteger index = ((UIButton *)sender).tag;    
    
    // make the background opaque and then set the title to the cards rank and suit    
    [[self.buttons objectAtIndex:index] setBackgroundColor:[UIColor clearColor]];
    
    // tell the game which index was picked for the game to keep track of the score
    [game chooseCardAtIndex:index];
    
    // get the corresponding card that fits with the button pressed
    Card *card = [game returnCard:index];
    
    // set the title of the button to be that of the card that 
    [[self.buttons objectAtIndex:index] setTitle:card.contents];    
    
    // set the score to be the new score
    [scoreLabel setText:[NSString stringWithFormat:@"Score %d", game.score]];    
    
    // check to make sure that all of the buttons that are not chosen are now fliped back
    for (int i = 0; i < 16; i++) {
        
        Card *card = [game returnCard:index];
        
        // if the card should be face down
        if (card.matched == NO && card.chosen == NO) {
            [[self.buttons objectAtIndex:i] setBackground:[UIImage imageNamed:@"KingBackground.png"]];
        }
        
        // if the card is matched then it will be disabled
        else if (card.matched == YES) {
            [[self.buttons objectAtIndex:i] setDisabledBackground:[UIImage imageNamed:@"KingBackground.png"]];
        }
    }
        
}

@end
