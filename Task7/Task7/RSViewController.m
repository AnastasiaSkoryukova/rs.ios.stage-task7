//
//  RSViewController.m
//  Task7
//
//  Created by Анастасия Скорюкова on 03.07.2021.
//

#import "RSViewController.h"

@interface RSViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UITextField *loginTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UIButton *authorizeButton;
@property (strong, nonatomic) UITextField *secureTextField;
@property (strong, nonatomic) UILabel *resultLabel;
@end



@implementation RSViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
    
    
    [self configureTitleLabel];
    [self configureLoginTextField];
    [self configurePasswordTextField];
    [self configureAuthorizeButton];
    [self configureSecureTextfield];
}

- (void) configureTitleLabel {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 36)];
    self.titleLabel.text = @"RSSchool";
    [self.titleLabel setFont: [UIFont systemFontOfSize:36 weight: bold]];
    self.titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: self.titleLabel];
}


- (void) configureLoginTextField {
    self.loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(36, 196, self.view.bounds.size.width - 72, 35)];
    
    self.loginTextField.layer.cornerRadius = 5;
    self.loginTextField.layer.borderColor = [UIColor colorNamed:@"blackCoral"].CGColor;
    self.loginTextField.layer.borderWidth = 1.5;
    
    [self.view addSubview:self.loginTextField];
    self.loginTextField.delegate = self;
    
}


- (void) configurePasswordTextField {
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(36, 266, self.view.bounds.size.width - 72, 35)];
    self.passwordTextField.layer.cornerRadius = 5;
    self.passwordTextField.layer.borderColor = [UIColor colorNamed:@"blackCoral"].CGColor;
    self.passwordTextField.layer.borderWidth = 1.5;
    self.passwordTextField.secureTextEntry = true;
    
    [self.view addSubview:self.passwordTextField];
    self.passwordTextField.delegate = self;
    
}


- (void) configureAuthorizeButton {
    
    self.authorizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.authorizeButton setFrame:CGRectMake(110, 366, 156, 42)];
    
    [self.authorizeButton setImage: [UIImage systemImageNamed:@"person"] forState:UIControlStateNormal];
    [self.authorizeButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    [self.authorizeButton setTitle:@"Authorize" forState:UIControlStateNormal];
    [self.authorizeButton setTitleColor:[UIColor colorNamed:@"littleBoyBlue"] forState:UIControlStateNormal];
    
    self.authorizeButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    self.authorizeButton.layer.borderWidth = 2;
    self.authorizeButton.layer.borderColor = [UIColor colorNamed:@"littleBoyBlue"].CGColor;
    self.authorizeButton.layer.cornerRadius = 10;
    
    [self.authorizeButton addTarget:self
                             action:@selector(saveButtonTapped:)
                   forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.authorizeButton];
}


- (void)saveButtonTapped:(UIButton *)sender {
    if ([sender isHighlighted]) {
        [sender setBackgroundColor:[UIColor colorNamed:@"littleBoyBlueAlpha02"]];
        [sender setTitleColor:[UIColor colorNamed:@"littleBoyBlueAlpha04"] forState:UIControlStateHighlighted];
        [sender setImage: [UIImage systemImageNamed:@"person.fill"] forState:UIControlStateHighlighted];
    }
    
    if ([self.loginTextField.text isEqual: @"username"] && [self.passwordTextField.text isEqual: @"password"]) {
        NSLog(@"Success!");
        [self.loginTextField setEnabled:false];
        [self.passwordTextField setEnabled:false];
        [self.authorizeButton setEnabled:false];
        
        self.passwordTextField.layer.borderColor = [UIColor colorNamed:@"turquoiseGreen"].CGColor;
        
        self.loginTextField.layer.borderColor = [UIColor colorNamed:@"turquoiseGreen"].CGColor;
        self.loginTextField.alpha = 0.5;
        self.passwordTextField.alpha = 0.5;
        self.authorizeButton.alpha = 0.5;
        self.secureTextField.hidden = false;
        
    } else {
        NSLog(@"Failure!");
        
        if (![self.loginTextField.text isEqual: @"username"] && ![self.passwordTextField.text isEqual: @"password"]) {
            self.loginTextField.layer.borderColor = [UIColor colorNamed:@"venetianRed"].CGColor;
            self.passwordTextField.layer.borderColor = [UIColor colorNamed:@"venetianRed"].CGColor;
        } else if (![self.loginTextField.text isEqual: @"username"]) {
            self.loginTextField.layer.borderColor = [UIColor colorNamed:@"venetianRed"].CGColor;
        } else if (![self.passwordTextField.text isEqual: @"password"]) {
            self.passwordTextField.layer.borderColor = [UIColor colorNamed:@"venetianRed"].CGColor;
        }
    }
    
    NSLog(@"Authorize tapped");
}


-(void) configureSecureTextfield {
    
    UIImageSymbolConfiguration *largeConfig = [UIImageSymbolConfiguration configurationWithPointSize:60 weight: UIImageSymbolWeightThin];
    
    self.secureTextField = [[UITextField alloc] initWithFrame:CGRectMake(45, 468, self.view.bounds.size.width - 90, 120)];
    
    
    self.secureTextField.borderStyle = UITextBorderStyleNone;
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [firstButton setImage:[UIImage systemImageNamed:@"1.circle" withConfiguration:largeConfig]  forState:UIControlStateNormal];
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(4, 10, 0, -10)];
    
    [firstButton addTarget:self action:@selector(firstButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    firstButton.frame = CGRectMake(10.0, 30.0, 70.0, 70.0);
    [self.secureTextField addSubview:firstButton];
    
    
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [secondButton setImage:[UIImage systemImageNamed:@"2.circle" withConfiguration:largeConfig]  forState:UIControlStateNormal];
    [secondButton setImageEdgeInsets:UIEdgeInsetsMake(4, 20, 0, -20)];
    
    [secondButton addTarget:self action:@selector(secondButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    secondButton.frame = CGRectMake(80.0, 30.0, 70.0, 70.0);
    [self.secureTextField addSubview:secondButton];
    self.secureTextField.hidden = true;
    
    
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [thirdButton setImage:[UIImage systemImageNamed:@"3.circle" withConfiguration:largeConfig]  forState:UIControlStateNormal];
    [thirdButton setImageEdgeInsets:UIEdgeInsetsMake(4, 20, 0, -20)];
    
    [thirdButton addTarget:self action:@selector(thirdButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    thirdButton.frame = CGRectMake(160.0, 30.0, 70.0, 70.0);
    [self.secureTextField addSubview:thirdButton];
    
    
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 2, 50, 36)];
    
    self.resultLabel.text = @"-";
    self.resultLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    [self.secureTextField addSubview:self.resultLabel];
    
    [self.view addSubview:self.secureTextField];
    self.secureTextField.delegate = self;
}


-(void) firstButtonTapped {
    NSLog(@"First button was tapped");
    
    if ([self.resultLabel.text isEqual: @"-"]) {
        
        self.resultLabel.text = @"1";
        
    } else {
        self.secureTextField.layer.borderColor = [UIColor colorNamed:@"venetianRed"].CGColor;
        self.secureTextField.layer.borderWidth = 2;
        self.secureTextField.layer.cornerRadius = 10;
        self.resultLabel.text = @"-";
    }
}

-(void) secondButtonTapped {
    NSLog(@"Second button was tapped");
    if ([self.resultLabel.text isEqual: @"13"]) {
        self.secureTextField.layer.borderColor = [UIColor colorNamed:@"turquoiseGreen"].CGColor;
        self.secureTextField.layer.borderWidth = 2;
        self.secureTextField.layer.cornerRadius = 10;
        
        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:@"2"];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfuly authorized" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *refreshButton = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:true completion:^{
                [self reloadView];
            }];
        }];
        
        [alert addAction:refreshButton];
        [self presentViewController:alert animated:true completion:nil];
    } else {
        self.secureTextField.layer.borderColor = [UIColor colorNamed:@"venetianRed"].CGColor;
        self.secureTextField.layer.borderWidth = 2;
        self.secureTextField.layer.cornerRadius = 10;
        self.resultLabel.text = @"-";
    }
}

-(void) thirdButtonTapped {
    NSLog(@"Third button was tapped");
    if ([self.resultLabel.text isEqual: @"1"]) {
        
        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:@"3"];
    } else {
        self.secureTextField.layer.borderColor = [UIColor colorNamed:@"venetianRed"].CGColor;
        self.secureTextField.layer.borderWidth = 2;
        self.secureTextField.layer.cornerRadius = 10;
        self.resultLabel.text = @"-";
    }
}

-(void) reloadView {
    UIView *parent = self.view.superview;
    [self.view removeFromSuperview];
    self.view = nil;
    [parent addSubview:self.view];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.loginTextField) {
        
        NSCharacterSet *notAllowedChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
        return [[string stringByTrimmingCharactersInSet:notAllowedChars] isEqualToString:@""];
        
    } else if (textField == self.secureTextField){
        return false;
    } else {
        return true;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.loginTextField) {
        [textField resignFirstResponder];
        
        return true;
    } else {
        [textField resignFirstResponder];
    }
    
    return true;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.secureTextField) {
        [textField resignFirstResponder];
        return false;
    } else {
        return true;
    }
}


@end




