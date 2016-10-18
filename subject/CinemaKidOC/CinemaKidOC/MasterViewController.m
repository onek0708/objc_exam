//
//  MasterViewController.m
//  CinemaKidOC
//
//  Created by Kyunghwa Cheon on 2016. 4. 26..//  Copyright © 2016년 EarthPeople. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "CinemaCenter.h"
//#import "AsyncImageView.h"

@interface MasterViewController () <NSURLConnectionDelegate, NSURLConnectionDataDelegate, NSURLConnectionDownloadDelegate>
{
    
    
   // dispatch_queue_t thumbnamil_queue;
    
}
//@property NSMutableArray *objects;
@property CinemaCenter *center;
@property NSOperationQueue *thumbnailQueue;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.center = [[CinemaCenter alloc]init];
    
    [self.center requestToServer:^{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
        
    }];
    
    NSLog(@"%@", self.center.result);
    
    //thumbnamil_queue = dispatch_queue_create("thumbnail_queue", NULL);
    
    self.thumbnailQueue = [[NSOperationQueue alloc]init];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
 */

#pragma mark - Segues

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}
*/
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.objects.count;
    
    return self.center.result.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *movieItem = [self.center.result objectAtIndex:indexPath.row];
    cell.textLabel.text = [movieItem valueForKey:@"title"];
    
    NSString *posterCode = [movieItem valueForKey:@"posterCode"];
    NSString *imagePath = [@"http://125.209.197.227/cinemakid/stillcut/load/" stringByAppendingString:posterCode];

//    dispatch_async(thumbnamil_queue, ^{
//        NSData *posterData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imagePath]];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIImage *posterImage = [UIImage imageWithData:posterData];
//            cell.imageView.image = posterImage;
//            [cell setNeedsLayout];
//        });
//    });

    NSBlockOperation *thumbnatilUpdateOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSData *posterData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imagePath]];
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            UIImage *posterImage = [UIImage imageWithData:posterData];
            cell.imageView.image = posterImage;
            [cell setNeedsLayout];
        }];
    }];
    [self.thumbnailQueue addOperation:thumbnatilUpdateOperation];
    
//    AsyncImageView *thumbnailImageView = [[AsyncImageView alloc]initWithFrame:CGRectMake(20,10,40,40)];
//    [thumbnailImageView loadImageFromURL:[NSURL URLWithString:imagePath]];
//    [cell.contentView addSubview:thumbnailImageView];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
 */

@end
