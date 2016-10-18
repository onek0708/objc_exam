//
//  NewNoteViewController.m
//  Note
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "NewNoteViewController.h"
#import "NoteListViewController.h"

@interface NewNoteViewController ()
- (IBAction)newNoteCancel:(id)sender;
- (IBAction)newNoteCreate:(id)sender;

@end

@implementation NewNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NoteListViewController *destinationViewController = segue.destinationViewController;
    
    // Note List 로 값 전달
    

}


- (IBAction)newNoteCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)newNoteCreate:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
