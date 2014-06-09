//
//  CHResultsViewController.m
//  CampHero
//
//  Created by Brian Flaherty on 6/9/14.
//  Copyright (c) 2014 CampHero LLC. All rights reserved.
//

#import "CHResultsViewController.h"
#import "CHCampsiteViewController.h"
#import "CHSearchStore.h"
#import "CHReserveOnlineViewController.h"
#import "CHCampsiteMapViewController.h"


@interface CHResultsViewController ()

@end

@implementation CHResultsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @""; // Hide the navbar back button's title
    self.restorationIdentifier = @"Results";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Get current filtered campsites
    //NSArray *results = [[CHSearchStore sharedStore] campsites];
    NSArray *results = [[CHSearchStore sharedStore] filteredCampsites];
    if (results.count > 0) {
        self.campsites = nil;
        self.campsites = [[NSMutableArray alloc] initWithArray:results];
    }
    
    // Reload table data
    [self.tableView reloadData];
    // Set nav bar
    UINavigationItem *navItem = self.navigationItem;
    navItem.title = @"Matching results";
    //navItem.title = [NSString stringWithFormat:@"Near %@", [[CHSearchStore sharedStore] locationName] ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// Set number of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

// Set number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (self.campsites.count > 0) {
        return self.campsites.count;
    } else {
        return 1;
    }
    
}

// Set section titles
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *titleString = [[NSString alloc] initWithFormat:@"Found %d campsites", self.campsites.count];
    return NSLocalizedString(titleString, titleString);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.campsites.count > 0) {
        // Configure the cell...
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == Nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier ];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        //add data to the cells
        cell.textLabel.text = self.campsites[indexPath.row][@"properties"][@"title"];
        NSString *rawPhoneNumber = [NSString stringWithFormat:@"%@", self.campsites[indexPath.row][@"properties"][@"phone"]];
        if (![self.campsites[indexPath.row][@"properties"][@"phone"] isKindOfClass:[NSNull class]])
        {
            cell.detailTextLabel.text = [[CHSearchStore sharedStore] formatPhoneNumber:rawPhoneNumber];
        } else {
            cell.detailTextLabel.text = @"No phone";
        }
        // Use the appropriate image for campsite type
        if ( [self.campsites[indexPath.row][@"properties"][@"tribes"][0] isEqualToNumber:@1] ) {
            cell.imageView.image = [UIImage imageNamed:@"Rustic"];
        } else if ( [self.campsites[indexPath.row][@"properties"][@"tribes"][0] isEqualToNumber:@2] ) {
            cell.imageView.image = [UIImage imageNamed:@"RV"];
        } else if ([self.campsites[indexPath.row][@"properties"][@"tribes"][0] isEqualToNumber:@3]) {
            cell.imageView.image = [UIImage imageNamed:@"Backcountry"];
        } else if ([self.campsites[indexPath.row][@"properties"][@"tribes"][0] isEqualToNumber:@5]) {
            cell.imageView.image = [UIImage imageNamed:@"Horse"];
        } else {
            cell.imageView.image = [UIImage imageNamed:@"All"];
        }
        
        return cell;
        
    } else {
        // Configure the cell...
        static NSString *CellIdentifier = @"NoCampsitesCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == Nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier ];
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.textLabel.text = @"No campsites found";
        cell.detailTextLabel.text = @"Bummer. Try another search.";
        cell.imageView.image = [UIImage imageNamed:@"Sadness"];
        
        return cell;
    }
}

// When a row is selected, push the corresponding campsite's detail view to the top of the view stack
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cvc = [[CHCampsiteViewController alloc] init];
    self.cvc.campsite = self.campsites[indexPath.row];
    //self.cvc.rovc = [[CHReserveOnlineViewController alloc] init];
    //self.cvc.cmvc = [[CHCampsiteMapViewController alloc] init];
    [self.navigationController pushViewController:self.cvc animated:YES];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 
 */

@end

