//
// File:	   MainViewController.m
//
// Abstract:   The application's main view controller (front page).

#import "MainViewController.h"

#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageSixViewController.h"

#import "MyCustomCell.h"
#import "Constants.h"	// contains the dictionary keys

enum PageIndices
{
	kPageOneIndex	= 0,
	kPageTwoIndex	= 1,
	kPageThreeIndex = 2,
	kPageFourIndex	= 3,
	kPageFiveIndex	= 4,
	kPageSixIndex	= 5,
	kPageSevenIndex	= 6,
	kPageEightIndex	= 7,
	kPageNineIndex	= 8,
	kPageTenIndex	= 9
};

@implementation MainViewController

@synthesize menuList, myTableView;

//to do list: add loading screen to pageoneview while notes loads, add title bar above instrument picker

- (void)awakeFromNib
{
	// make the title of this page the same as the title of this app
	//self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
	self.title = @"Instruments";
		
	// set style programatically instead of by choice
	[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	//[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
	//self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
	
	self.menuList = [[NSMutableArray alloc] init];
	
	// We will lazily create our view controllers as the user requests them (at a later time),
	// but for now we will encase each title an explanation text into a NSDictionary and add it to a mutable array.
	// This dictionary will be used by our table view data source to populate the text in each cell.
	//
	// When it comes time to create the corresponding view controller we will replace each NSDictionary.
	//
	// If you want to add more pages, simply call "addObject" on "menuList"
	// with an additional NSDictionary.  Note we use NSLocalizedString to load a localized version of its title.
	//
	//
	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageOneTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageOneExplain", @""), kExplainKey,
						 nil]];
	
	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageTwoTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageTwoExplain", @""), kExplainKey,
						 nil]];
	
	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageThreeTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageThreeExplain", @""), kExplainKey,
						 nil]];
	
	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageFourTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageFourExplain", @""), kExplainKey,
						 nil]];
	
	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageFiveTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageFiveExplain", @""), kExplainKey,
						 nil]];

	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageSixTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageSixExplain", @""), kExplainKey,
						 nil]];

	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageSevenTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageSevenExplain", @""), kExplainKey,
						 nil]];

	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageEightTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageEightExplain", @""), kExplainKey,
						 nil]];

	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageNineTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageNineExplain", @""), kExplainKey,
						 nil]];

	[menuList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						 NSLocalizedString(@"PageTenTitle", @""), kTitleKey,
						 NSLocalizedString(@"PageTenExplain", @""), kExplainKey,
						 nil]];
	
	modalViewController = [[PageSixViewController alloc] initWithNibName:@"PageSixViewController" bundle:nil];
	
	UIImageView *bannerView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bannerIIR.png"]] autorelease];
	bannerView.frame = CGRectMake(0.0, 0.0, 320.0, 80.0);
	//[self.view addSubview:bannerView];	
	
	self.myTableView.tableHeaderView = bannerView;
	
	//[[self myTableView] tableHeaderView] = bannerView;
	
	//self.myTableView. = CGRectMake(0.0, 80.0, 320.0, 400.0);
	
	//[[[self navigationController] view] frame] = CGRectMake(0.0, 80.0, 320.0, 400.0);
	
	// add our custom button to show our modal view controller
	UIButton* modalViewButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
	[modalViewButton addTarget:self action:@selector(modalViewAction:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *modalButton = [[UIBarButtonItem alloc] initWithCustomView:modalViewButton];
	self.navigationItem.rightBarButtonItem = modalButton;
	[modalViewButton release];
	
	[myTableView reloadData];
	
	NSLog(@"Getting prefs");
	CFStringRef prefs = (CFStringRef)CFPreferencesCopyAppValue(CFSTR("instrument"), kCFPreferencesCurrentApplication);
		
	if (prefs) {
		NSString *localInstrument = (NSString *)prefs;
		CFRelease(prefs);
		NSLog(localInstrument);	
		PageOneViewController *targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument:localInstrument];
		[[self navigationController] pushViewController:targetViewController animated:NO];
		
	} else {
		
		// splash!
				
	}

}

- (void)dealloc
{
    [myTableView release];
	[menuList release];
	[modalViewController release];
	
	[super dealloc];
}

// user clicked the "i" button, present page six as modal UIViewController
- (IBAction)modalViewAction:(id)sender
{
	// present page six as a modal child or overlay view
	[[self navigationController] presentModalViewController:modalViewController animated:YES];
}

#pragma mark UIViewController delegates

- (void)viewWillAppear:(BOOL)animated
{
	NSIndexPath *tableSelection = [myTableView indexPathForSelectedRow];
	[myTableView deselectRowAtIndexPath:tableSelection animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
	// do something here as our view re-appears
}


#pragma mark UITableView delegates

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	PageOneViewController *targetViewController = [[menuList objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	if (targetViewController == nil)
	{
		// the view controller has not been created yet, create it and set it to our menuList array
		
		// create a new dictionary with the new view controller
		//
		NSMutableDictionary *newItemDict = [NSMutableDictionary dictionaryWithCapacity:3];
		[newItemDict addEntriesFromDictionary: [menuList objectAtIndex: indexPath.row]];	// copy the title and explain strings
		
		// which view controller do we create?
		switch (indexPath.row)
		{
			case kPageOneIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Flute"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Flute"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageTwoIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Clarinet"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Clarinet"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageThreeIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Oboe"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Oboe"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageFourIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Bassoon"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Bassoon"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageFiveIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Saxophone"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Saxophone"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageSixIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Trumpet"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Trumpet"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageSevenIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Horn"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Horn"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageEightIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Trombone"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Trombone"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageNineIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Baritone"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Baritone"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
			case kPageTenIndex:
			{
				targetViewController = [[PageOneViewController alloc] initWithNibName:@"PageOneViewController" bundle:nil instrument: @"Tuba"];
				NSLog(@"Setting prefs");
				CFPreferencesSetAppValue(CFSTR("instrument"), CFSTR("Tuba"), kCFPreferencesCurrentApplication);
				CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
				break;
			}
				
		}

		// add the new view controller to the dictionary and then to the 'menuList' array
		[newItemDict setObject:targetViewController forKey:kViewControllerKey];
		[menuList replaceObjectAtIndex:	indexPath.row withObject: newItemDict];
		[targetViewController release];
		
		// load the view controll back in to push it
		targetViewController = [[menuList objectAtIndex: indexPath.row] objectForKey:kViewControllerKey];
	}
	
	// present the rest of the pages normally
	[[self navigationController] pushViewController:targetViewController animated:YES];
}


#pragma mark UITableView datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	MyCustomCell *cell = (MyCustomCell*)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil)
	{
		cell = [[[MyCustomCell alloc] initWithFrame:CGRectZero reuseIdentifier:kCellIdentifier] autorelease];
	}

	// get the view controller's info dictionary based on the indexPath's row
	cell.dataDictionary = [menuList objectAtIndex:indexPath.row];
	
	return cell;
}

@end

