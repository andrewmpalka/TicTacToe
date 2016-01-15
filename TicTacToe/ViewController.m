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

-(BOOL)isGameOver:(NSString *)tag {
    /// 1
    if ([self.buttonOne.titleLabel.text isEqualToString:tag] ){
        if ([self.buttonTwo.titleLabel.text isEqualToString:tag]) {
            if ([self.buttonThree.titleLabel.text isEqualToString:tag]) {
                return TRUE;
            }
        }
        else if ([self.buttonFour.titleLabel.text isEqualToString:tag]){
            if ([self.buttonSeven.titleLabel.text isEqualToString:tag]) {
                return TRUE;
            }
            else if ([self.buttonFive.titleLabel.text isEqualToString:tag]){
                if ([self.buttonNine.titleLabel.text isEqualToString:tag]) {
                    return TRUE;
                }
            }
        }
        //2
    } else if ([self.buttonTwo.titleLabel.text isEqualToString:tag]) {
        if ( [self.buttonFive.titleLabel.text isEqualToString:tag]) {
            if ( [self.buttonEight.titleLabel.text isEqualToString:tag]) {
                return TRUE;
            }
        }
    //3
} else if ([self.buttonThree.titleLabel.text isEqualToString:tag]) {
    if ( [self.buttonSix.titleLabel.text isEqualToString:tag]) {
        if ( [self.buttonNine.titleLabel.text isEqualToString:tag]) {
            return  TRUE;
        }
    }

    //4
} else if ( [self.buttonFour.titleLabel.text isEqualToString:tag]) {
    if ( [self.buttonFive.titleLabel.text isEqualToString:tag]) {
        if ( [self.buttonSix.titleLabel.text isEqualToString:tag]) {
            return TRUE;
        }
    }
    //7
} else if ( [self.buttonSeven.titleLabel.text isEqualToString:tag]) {
    if ( [self.buttonEight.titleLabel.text isEqualToString:tag]) {
        if ( [self.buttonNine.titleLabel.text isEqualToString:tag]) {
            return true;
        }
    } else if ( [self.buttonFive.titleLabel.text isEqualToString:tag]){
        if ( [self.buttonThree.titleLabel.text isEqualToString:tag]) {
            return true;
        }
    }
}
return NO;
}

- (void)whoWon:(NSString *)answer {
    if ([answer isEqualToString:@"X"]){
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"You Won"];
        } else {
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Computer Won"];
    }
}

-(IBAction)onButtonTapped:(UIButton *)sender {
    if ([self.whichPlayerLabel.text isEqualToString:@"Your turn!"]) {
        [sender setTitle:@"X" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Computer's turn!"];
        
        if ([self isGameOver:sender.titleLabel.text]) {
            [self whoWon:sender.titleLabel.text];
        }
    } else {
        [sender setTitle:@"O" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Your turn!"];
        
        if ([self isGameOver:sender.titleLabel.text]){
         [self whoWon:sender.titleLabel.text];
        }


    }
    
    }


@end
