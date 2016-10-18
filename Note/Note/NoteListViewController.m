//
//  NoteListViewController.m
//  Note
//
//  Created by Kyunghwa Cheon on 2016. 4. 28..
//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "NoteListViewController.h"

@interface NoteListViewController ()

@end

@implementation NoteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (NSArray *)documentFileList {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSMutableArray *fileList = [NSMutableArray alloc] initWIthArray: [manager contentsOfDirectoryAtPath:localDocumentsDirectoryURL().path error:nil];
    
    NSMutableArray *documentAttributeArray = [NSMutableArray new];
    
    for (NSString *fileName in fileList) {
        NSString *filePath [localDocumentsDirectoryURL().path stringByAppendingPathComponent:fileName];
        NSDictionary *fileAttribute = [manager attributesOfItemAtPath:filePath error:nil];
        
        NSDate *fileModDate = (NSDate *)[fileAttribute objectForKey:NSFileModificationDate];
        
        NSDictionary *fileAttributeDict = [NSDictionary dictionaryWithObjectsAndKeys:fileName, @"FileName", fileModDate, @"FileModDate", nil];
        [documentAttributeArray addObject:fileAttributeDict];
    }
                                
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}



-(IBAction) toNoteList:(UIStoryboardSegue *)segue {
    
    NSString *identifier = segue.identifier;
    
    if ([identifier isEqualToString:@"createNote"]) {
        
    }
    
}

- (NSInteger) numberOfSelectionsInTable:(UITableView *)talbleView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

@end
