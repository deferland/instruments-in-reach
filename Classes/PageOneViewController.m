//
// File:	   PageOneViewController.m
//
// Abstract:   The view controller for page one of this sample.
//

#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageSixViewController.h"
#import "Constants.h"

@implementation PageOneViewController

@synthesize notesView, myView, myView2, myView3, instrument, note, clef, progressView, scrollView;

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	//NSLog(@"scrolling started");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate	{
	//NSLog(@"scrolling stopping");
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	//NSLog(@"scrolling done");
}

- (void) selectedNote:(NSString *)noteString instrument:(NSString *)instrumentString {
	//NSLog(@"selectedNote");
	//NSLog(noteString);
	//NSLog(instrumentString);
	
	PageTwoViewController *targetViewController = [[PageTwoViewController alloc] initWithNibName:@"PageTwoViewController" bundle:nil instrument:instrumentString note:noteString];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}

- (void)createToolbarItems
{	
	// match each of the toolbar item's style match the selection in the "UIBarButtonItemStyle" segmented control
	UIBarButtonItemStyle style = UIBarButtonItemStyleBordered;	
	toolbar.barStyle = UIBarStyleBlackOpaque;
	
	// create the system-defined "OK or Done" button
    //UIBarButtonItem *systemItem = [[UIBarButtonItem alloc]
	//							   initWithBarButtonSystemItem:currentSystemItem
	//							   target:self action:@selector(action:)];
	//systemItem.style = style;
	
	// flex item used to separate the left groups items and right grouped items
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																			  target:nil
																			  action:nil];
		
	// create a bordered style button with custom title
	UIBarButtonItem *customItem1 = [[UIBarButtonItem alloc] initWithTitle:@"Home"
																   style:style	// note you can use "UIBarButtonItemStyleDone" to make it blue
																  target:self
																   action:@selector(homeButtonPressed:)];

	// create a bordered style button with custom title
	UIBarButtonItem *customItem2 = [[UIBarButtonItem alloc] initWithTitle:@"About"
																   style:style	// note you can use "UIBarButtonItemStyleDone" to make it blue
																  target:self
																   action:@selector(aboutButtonPressed:)];

	// create a bordered style button with custom title
	UIBarButtonItem *customItem3 = [[UIBarButtonItem alloc] initWithTitle:@"Instruments"
																   style:style	// note you can use "UIBarButtonItemStyleDone" to make it blue
																  target:self
																   action:@selector(setupButtonPressed:)];
	
	customItem1.width = 80;
	customItem2.width = 80;
	customItem3.width = 80;
	
	NSArray *items = [NSArray arrayWithObjects: customItem1, flexItem, customItem2, flexItem, customItem3, nil];
	[toolbar setItems:items animated:NO];
	
	//[systemItem release];
	[flexItem release];
	//[infoItem release];
	[customItem1 release];
	[customItem2 release];
	[customItem3 release];
}
 
- (void) initNotes {
		
	int instrument_min = 0;
	int instrument_max = 0;
	
	NSLog([NSString stringWithFormat:@"initNotes instrument: %@",self.instrument]);
	
	if ([self.instrument isEqualToString:@"Flute"]) {
		instrument_min = 11;
		instrument_max = 60;
	}
	if ([self.instrument isEqualToString:@"Clarinet"]) {
		instrument_min = 0;
		instrument_max = 55;
	}
	if ([self.instrument isEqualToString:@"Oboe"]) {
		instrument_min = 8;
		instrument_max = 50;
	}
	if ([self.instrument isEqualToString:@"Saxophone"]) {
		instrument_min = 8;
		instrument_max = 52;
	}
	if ([self.instrument isEqualToString:@"Trumpet"]) {
		instrument_min = 2;
		instrument_max = 45;
	}
	if ([self.instrument isEqualToString:@"Horn"]) {
		instrument_min = 1;
		instrument_max = 41;
	}
	if ([self.instrument isEqualToString:@"Bassoon"]) {
		instrument_min = 9;
		instrument_max = 56;
	}
	if ([self.instrument isEqualToString:@"Trombone"]) {
		instrument_min = 18;
		instrument_max = 61;
	}
	if ([self.instrument isEqualToString:@"Baritone"]) {
		instrument_min = 18;
		instrument_max = 61;
	}
	if ([self.instrument isEqualToString:@"Tuba"]) {
		instrument_min = 1;
		instrument_max = 44;
	}	
	
	double width = (44 * ((instrument_max - instrument_min)+1))+5;
	
	//NSLog([NSString stringWithFormat: @"notes: %i", (instrument_max - instrument_min)]);		
	//NSLog([NSString stringWithFormat: @"width: %f", width]);
	
	self.clef = @"TC";
	if ([self.instrument isEqualToString:@"Bassoon"]) self.clef = @"BC"; 
	if ([self.instrument isEqualToString:@"Trombone"]) self.clef = @"BC";
	if ([self.instrument isEqualToString:@"Baritone"]) self.clef = @"BC";
	if ([self.instrument isEqualToString:@"Tuba"]) self.clef = @"BC";
	
	int startingNote = 29;
	
	if ([self.clef isEqualToString:@"TC"]) {			
		startingNote = 21;
	} 		
	
	notesView = [[NotesView alloc] initWithFrame:CGRectMake(0.0, 0.0, width, 153.0)];
	notesView.backgroundColor = [UIColor clearColor];
	notesView.instrument = self.instrument;
	notesView.clef = self.clef;
	[notesView initNotes];
	notesView.delegate = self;
	//notesView.hidden = YES;
	notesView.alpha = 0;
	
	// a page is the width of the scroll view
	scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(32.0, 40.0, 288.0, 153.0)];
	scrollView.pagingEnabled = NO;
	//scrollView.clipsToBounds = YES;
	scrollView.contentSize = CGSizeMake(width, 153.0);
	scrollView.showsHorizontalScrollIndicator = YES;
	scrollView.showsVerticalScrollIndicator = YES;
	//scrollView.scrollsToTop = YES;
	scrollView.delegate = self;		
	
	[scrollView addSubview:notesView];
	
	NSLog(@"Getting scroll position prefs");
	CFStringRef prefs = (CFStringRef)CFPreferencesCopyAppValue((CFStringRef)instrument, kCFPreferencesCurrentApplication);
	
	if (prefs) {
		NSString *scrollPrefs = (NSString *)prefs;
		CFRelease(prefs);
		NSLog(scrollPrefs);	

		// scroll to the start note
		//currentX = -44*(self.startingNote-instrument_min);
		[scrollView setContentOffset:CGPointMake([scrollPrefs doubleValue],0.0)];
		//NSLog([NSString stringWithFormat:@"offset: %i",(44*(startingNote-instrument_min))]);
		
	} else {
		
		// scroll to the start note
		//currentX = -44*(self.startingNote-instrument_min);
		[scrollView setContentOffset:CGPointMake((44*(startingNote-instrument_min)),0)];
		//NSLog([NSString stringWithFormat:@"offset: %i",(44*(startingNote-instrument_min))]);
		
	}
	
	
	//create a view for rear blank
	myView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 420.0, 420.0)];
	//create an image view
	UIImageView *myImageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"html/large_blank.png"]] autorelease];
	//add image view to view
	[myView addSubview:myImageView];
	//[self.view sendSubviewToBack:myImageView];
	//add view to window
	//myView.hidden = YES;
	[self.view addSubview:myView];	
	
	[self.view addSubview:scrollView];
	
	//create a view for note clef
	myView2 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 80.0, 32.0, 113.0)];
	//create an image view
	UIImageView *myImageView2 = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[[@"html/clefs/" stringByAppendingString: self.clef] stringByAppendingString:@".gif"]]] autorelease];
	//add image view to view
	[myView2 addSubview:myImageView2];
	//[self.view bringSubviewToFront:myImageView2];
	//add view to window
	myView2.hidden = YES;
	[self.view addSubview:myView2];	
	
	//create a view for top blank
	myView3 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 32.0, 40.0)];
	//create an image view
	UIImageView *myImageView3 = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"html/top_left_blank.gif"]] autorelease];
	//add image view to view
	[myView3 addSubview:myImageView3];
	//[self.view bringSubviewToFront:myImageView3];
	//add view to window
	myView3.hidden = YES;
	[self.view addSubview:myView3];	
	
	progressView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(145, 100, 30.0, 30.0)];
	progressView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
	progressView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
									 UIViewAutoresizingFlexibleRightMargin |
									 UIViewAutoresizingFlexibleTopMargin |
									 UIViewAutoresizingFlexibleBottomMargin);
	
	[self.view bringSubviewToFront:progressView];
	[self.view addSubview:progressView];
	[progressView startAnimating];	
	
	//tap a note to see the instrument fingering
	UILabel *labelS =  [[UILabel alloc] initWithFrame:CGRectMake(0.0, 230.0, 320.0, 25.0)];
	labelS.font = [UIFont systemFontOfSize:16.0];
	labelS.textColor = [UIColor blackColor];
	labelS.backgroundColor = [UIColor clearColor];
	labelS.textAlignment = UITextAlignmentCenter;
	labelS.numberOfLines = 1;
	labelS.text = @"Tap a note to see the instrument fingering";
	[self.view addSubview:labelS];	
	[labelS release];
	
	//switch image
	//myImageView.image = [UIImage imageNamed:@"my_image_two.png"];		
		
	// create the UIToolbar at the bottom of the view controller
	toolbar = [UIToolbar new];
	toolbar.barStyle = UIBarStyleDefault;
	
	// size up the toolbar and set its frame
	
	[toolbar sizeToFit];
	CGFloat toolbarHeight = [toolbar frame].size.height;
	CGRect mainViewBounds = self.view.bounds;
	[toolbar setFrame:CGRectMake(CGRectGetMinX(mainViewBounds),
								 CGRectGetMinY(mainViewBounds) + CGRectGetHeight(mainViewBounds) - (toolbarHeight) + 2.0,
								 CGRectGetWidth(mainViewBounds),
								 toolbarHeight)];
	
	[self.view addSubview:toolbar];
	
	currentSystemItem = UIBarButtonSystemItemDone;
	[self createToolbarItems];		
	
	//[notesView drawNotes];
	
}

- (void)loadView
{
	// add the top-most parent view
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	contentView.backgroundColor = [UIColor blackColor];
	self.view = contentView;
	[contentView release];

}	

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil instrument:(NSString *)instrumentString
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{
		// this will appear as the title in the navigation bar
		self.title = instrumentString;
		self.instrument = instrumentString;

		self.view.autoresizesSubviews = YES;
		
	}
	return self;
}

- (IBAction)homeButtonPressed:(id)sender {
	//NSLog(@"home button pressed");
}

- (IBAction)aboutButtonPressed:(id)sender {
	//NSLog(@"about button pressed");
	PageSixViewController	*modalViewController = [[PageSixViewController alloc] initWithNibName:@"PageSixViewController" bundle:nil];
	[[self navigationController] presentModalViewController:modalViewController animated:YES];
}

- (IBAction)setupButtonPressed:(id)sender {
	//NSLog(@"setup button pressed");
	[[self navigationController] popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//return YES;
}

- (void) releaseNotes
{
	NSLog(@"releaseNotesView");
	
	NSLog(@"Setting scroll prefs");
	NSString *t = [NSString stringWithFormat:@"%f",scrollView.contentOffset.x];
	CFPreferencesSetAppValue((CFStringRef)instrument, (CFStringRef)t, kCFPreferencesCurrentApplication);
	CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);	
	
	if (notesView)
		[notesView release];
	if (myView)
		[myView release];
	if (myView2)
		[myView2 release];
	if (myView3)
		[myView3 release];
	if (note)
		[note release];
	if (clef)
		[clef release];
	if (progressView)
		[progressView release];
	if (scrollView)
		[scrollView release];
	if (toolbar)
		[toolbar release];
}

- (void)dealloc
{
	[self releaseNotes];

	[instrument release];
	
	[super dealloc];
}

// Automatically invoked after -loadView
// This is the preferred override point for doing additional setup after -initWithNibName:bundle:
//
- (void)viewDidLoad
{
	// add our custom add button as the nav bar's custom right view
	//UIBarButtonItem *addButton = [[[UIBarButtonItem alloc]
	//							   initWithTitle:NSLocalizedString(@"AddTitle", @"")
	//							   style:UIBarButtonItemStyleBordered
	//							   target:self
	//							   action:@selector(addAction:)] autorelease];
	//self.navigationItem.rightBarButtonItem = addButton;
	
}

- (void)addAction:(id)sender
{
	// the add button was clicked, handle it here
	//
}

- (void)viewWillAppear:(BOOL)animated
{
	[self initNotes];	
}	

- (void)viewDidAppear:(BOOL)animated
{
	
	[progressView stopAnimating];
	//myView.hidden = NO;
	myView2.hidden = NO;
	myView3.hidden = NO;
	if (!notesView.drawn)
		[notesView drawNotes];
	notesView.alpha = 1;
	
	UIImageView *bannerView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bannerIIR.png"]] autorelease];
	bannerView.frame = CGRectMake(0.0, 314.0, 320.0, 80.0);
	
	[self.view addSubview:bannerView];
	
}

- (void)viewDidDisappear:(BOOL)animated
{
	notesView.alpha = 0;
	
	[self releaseNotes];
}

@end
