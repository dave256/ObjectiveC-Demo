//
//  ViewController.m
//  ObjectiveC-Demo
//
//  Created by David M Reed on 2/3/15.
//  Copyright (c) 2015 David M Reed. All rights reserved.
//

#import "DataModel.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// use brackets to make private section
{
    __weak IBOutlet UITextField *firstNameTextField;
    __weak IBOutlet UITextField *lastNameTextField;

    __weak IBOutlet UILabel *helloLabel;
    DataModel *person;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // create our data model instance

    // either method would work
    //person = [DataModel dataModelForMe];
    person = [[DataModel alloc] initWithFirstName:@"David" lastName:@"Reed" age:42];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    firstNameTextField.text = person.firstName;
    // use old syntax (properties have a setter method that is same name as class but camelCase prefixed with set)
    [lastNameTextField setText:person.lastName];
}

- (IBAction)helloButtonPressed:(id)sender {
    // use old syntax (properties have a getter method that is same name as class)
    person.firstName = firstNameTextField.text;
    [person setLastName:[lastNameTextField text]];

    // use property syntax here
    // this %@ formatter is for classes and causes the class' description instance method to be called
    helloLabel.text = [NSString stringWithFormat:@"Hello %@", person];
}

@end
