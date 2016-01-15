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

-(BOOL)isGameOver:(NSString *)senderLabelText tag:(NSString *)senderTag; {
    if ([senderLabelText isEqualToString:senderTag]) {
        /// 1
        if (![self.buttonOne isEnabled] ){
            if (![self.buttonTwo isEnabled]) {
                if (![self.buttonThree isEnabled]) {
                    return TRUE;
                }
            }
        } else if (![self.buttonFour isEnabled]){
            if (![self.buttonSeven isEnabled]) {
                return TRUE;
            }
        }  else if (![self.buttonFive isEnabled]){
            if (![self.buttonNine isEnabled]) {
                return TRUE;
            }
        }
        
        //2
        if (![self.buttonTwo isEnabled]) {
            if (![self.buttonFive isEnabled]) {
                if (![self.buttonEight isEnabled]) {
                    return TRUE;
                }
            }
        }
        
        return NO;
        
        //3
    } if (![self.buttonThree isEnabled]) {
        if (![self.buttonSix isEnabled]) {
            if (![self.buttonNine isEnabled]) {
                return  TRUE;
            }
        }
        //4
    } if (![self.buttonFour isEnabled]) {
        if (![self.buttonFive isEnabled]) {
            if (![self.buttonSix isEnabled]) {
                return TRUE;
            }
        }
        //7
    } if (![self.buttonSeven isEnabled]) {
        if (![self.buttonEight isEnabled]) {
            if (![self.buttonNine isEnabled]) {
                return true;
            }
        } else if (![self.buttonFive isEnabled]){
            if (![self.buttonThree isEnabled]) {
                return true;
            }
        }
    }
    return NO;
}


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
        
        if ([self isGameOver:self.whichPlayerLabel.text tag:@"X"]) {
            self.whichPlayerLabel.text = [self whoWon:self.whichPlayerLabel.text];
        }
    } else {
        [sender setTitle:@"O" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Your turn!"];
        if ([self isGameOver:self.whichPlayerLabel.text tag:@"0"]){
            self.whichPlayerLabel.text = [self whoWon:self.whichPlayerLabel.text];
        }


    }
    
    }


@end
