//
//  ViewController.m
//  TicTacToe
//
//  Created by Andrew Palka on 1/14/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    self.whichPlayerLabel.text = @"Your turn!";
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//-(BOOL)isGameOver:()player1, (NSString *)player2 {
//    if
//}

- (NSString *)whoWon:(NSString *)answer {
    if ([answer isEqualToString:@"Your turn!"]) {
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"You Won"];
        return self.whichPlayerLabel.text;
    } else {
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Computer Won"];
        return self.whichPlayerLabel.text;
    }
}

-(IBAction)onButtonTapped:(UIButton *)sender {
    if ([self.whichPlayerLabel.text isEqualToString:@"Your turn!"]) {
        [sender setTitle:@"X" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Computer's turn!"];
        
        
    } else {
        [sender setTitle:@"O" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Your turn!"];

    }
}


@end
