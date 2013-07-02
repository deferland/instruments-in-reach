//
// File:	   PageTwoViewController.m
//
// Abstract:   The view controller for page two of this sample.

#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageSixViewController.h"
#import "Constants.h"

@implementation PageTwoViewController

@synthesize webView, instrument, note, clef, noteNames;

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

- (IBAction)homeButtonPressed:(id)sender {
	//NSLog(@"home button pressed");
	[[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)aboutButtonPressed:(id)sender {
	//NSLog(@"about button pressed");
	PageSixViewController	*modalViewController = [[PageSixViewController alloc] initWithNibName:@"PageSixViewController" bundle:nil];
	[[self navigationController] presentModalViewController:modalViewController animated:YES];
}

- (IBAction)setupButtonPressed:(id)sender {
	//NSLog(@"setup button pressed");
	[[self navigationController] popToRootViewControllerAnimated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil instrument:(NSString *)instrumentString note:(NSString *)noteString
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{

		self.noteNames = [[NSMutableArray alloc] init];

		self.instrument = instrumentString;
		self.note = noteString;
				
		self.clef = @"TC";
		if ([self.instrument isEqualToString:@"Bassoon"]) self.clef = @"BC"; 
		if ([self.instrument isEqualToString:@"Trombone"]) self.clef = @"BC";
		if ([self.instrument isEqualToString:@"Baritone"]) self.clef = @"BC";
		if ([self.instrument isEqualToString:@"Tuba"]) self.clef = @"BC";
		
		NSLog([NSString stringWithFormat:@"PageTwoViewConstoller clef: %@",self.clef]);
		
		if (self.clef == @"TC") {
			
			// TC names
			[noteNames insertObject:[NSString stringWithString:@"E 3"] atIndex:0];
			[noteNames insertObject:[NSString stringWithString:@"F 3"] atIndex:1];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 3"] atIndex:2];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 3"] atIndex:3];
			[noteNames insertObject:[NSString stringWithString:@"G 3"] atIndex:4];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 3"] atIndex:5];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 3"] atIndex:6];
			[noteNames insertObject:[NSString stringWithString:@"A 3"] atIndex:7];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 3"] atIndex:8];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 3"] atIndex:9];
			[noteNames insertObject:[NSString stringWithString:@"B 3"] atIndex:10];
			[noteNames insertObject:[NSString stringWithString:@"C 4"] atIndex:11];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 4"] atIndex:12];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 4"] atIndex:13];
			[noteNames insertObject:[NSString stringWithString:@"D 4"] atIndex:14];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 4"] atIndex:15];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 4"] atIndex:16];
			[noteNames insertObject:[NSString stringWithString:@"E 4"] atIndex:17];
			[noteNames insertObject:[NSString stringWithString:@"F 4"] atIndex:18];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 4"] atIndex:19];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 4"] atIndex:20];
			[noteNames insertObject:[NSString stringWithString:@"G 4"] atIndex:21];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 4"] atIndex:22];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 4"] atIndex:23];
			[noteNames insertObject:[NSString stringWithString:@"A 4"] atIndex:24];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 4"] atIndex:25];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 4"] atIndex:26];
			[noteNames insertObject:[NSString stringWithString:@"B 4"] atIndex:27];
			[noteNames insertObject:[NSString stringWithString:@"C 5"] atIndex:28];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 5"] atIndex:29];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 5"] atIndex:30];
			[noteNames insertObject:[NSString stringWithString:@"D 5"] atIndex:31];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 5"] atIndex:32];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 5"] atIndex:33];
			[noteNames insertObject:[NSString stringWithString:@"E 5"] atIndex:34];
			[noteNames insertObject:[NSString stringWithString:@"F 5"] atIndex:35];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 5"] atIndex:36];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 5"] atIndex:37];
			[noteNames insertObject:[NSString stringWithString:@"G 5"] atIndex:38];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 5"] atIndex:39];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 5"] atIndex:40];
			[noteNames insertObject:[NSString stringWithString:@"A 5"] atIndex:41];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 5"] atIndex:42];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 5"] atIndex:43];
			[noteNames insertObject:[NSString stringWithString:@"B 5"] atIndex:44];
			[noteNames insertObject:[NSString stringWithString:@"C 6"] atIndex:45];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 6"] atIndex:46];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 6"] atIndex:47];
			[noteNames insertObject:[NSString stringWithString:@"D 6"] atIndex:48];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 6"] atIndex:49];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 6"] atIndex:50];
			[noteNames insertObject:[NSString stringWithString:@"E 6"] atIndex:51];
			[noteNames insertObject:[NSString stringWithString:@"F 6"] atIndex:52];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 6"] atIndex:53];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 6"] atIndex:54];
			[noteNames insertObject:[NSString stringWithString:@"G 6"] atIndex:55];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 6"] atIndex:56];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 6"] atIndex:57];
			[noteNames insertObject:[NSString stringWithString:@"A 6"] atIndex:58];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 6"] atIndex:59];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 6"] atIndex:60];
		
		}
		
		if (self.clef == @"BC") {
			
			// BC names
			[noteNames insertObject:[NSString stringWithString:@""] atIndex:0];
			[noteNames insertObject:[NSString stringWithString:@"E 1"] atIndex:1];
			[noteNames insertObject:[NSString stringWithString:@"F 1"] atIndex:2];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 1"] atIndex:3];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 1"] atIndex:4];
			[noteNames insertObject:[NSString stringWithString:@"G 1"] atIndex:5];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 1"] atIndex:6];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 1"] atIndex:7];
			[noteNames insertObject:[NSString stringWithString:@"A 1"] atIndex:8];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 1"] atIndex:9];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 1"] atIndex:10];
			[noteNames insertObject:[NSString stringWithString:@"B 1"] atIndex:11];
			[noteNames insertObject:[NSString stringWithString:@"C 2"] atIndex:12];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 2"] atIndex:13];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 2"] atIndex:14];
			[noteNames insertObject:[NSString stringWithString:@"D 2"] atIndex:15];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 2"] atIndex:16];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 2"] atIndex:17];
			[noteNames insertObject:[NSString stringWithString:@"E 2"] atIndex:18];
			[noteNames insertObject:[NSString stringWithString:@"F 2"] atIndex:19];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 2"] atIndex:20];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 2"] atIndex:21];
			[noteNames insertObject:[NSString stringWithString:@"G 2"] atIndex:22];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 2"] atIndex:23];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 2"] atIndex:24];
			[noteNames insertObject:[NSString stringWithString:@"A 2"] atIndex:25];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 2"] atIndex:26];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 2"] atIndex:27];
			[noteNames insertObject:[NSString stringWithString:@"B 2"] atIndex:28];
			[noteNames insertObject:[NSString stringWithString:@"C 3"] atIndex:29];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 3"] atIndex:30];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 3"] atIndex:31];
			[noteNames insertObject:[NSString stringWithString:@"D 3"] atIndex:32];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 3"] atIndex:33];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 3"] atIndex:34];
			[noteNames insertObject:[NSString stringWithString:@"E 3"] atIndex:35];
			[noteNames insertObject:[NSString stringWithString:@"F 3"] atIndex:36];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 3"] atIndex:37];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 3"] atIndex:38];
			[noteNames insertObject:[NSString stringWithString:@"G 3"] atIndex:39];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 3"] atIndex:40];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 3"] atIndex:41];
			[noteNames insertObject:[NSString stringWithString:@"A 3"] atIndex:42];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 3"] atIndex:43];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 3"] atIndex:44];
			[noteNames insertObject:[NSString stringWithString:@"B 3"] atIndex:45];
			[noteNames insertObject:[NSString stringWithString:@"C 4"] atIndex:46];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 4"] atIndex:47];
			[noteNames insertObject:[NSString stringWithString:@"C# / Db 4"] atIndex:48];
			[noteNames insertObject:[NSString stringWithString:@"D 4"] atIndex:49];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 4"] atIndex:50];
			[noteNames insertObject:[NSString stringWithString:@"D# / Eb 4"] atIndex:51];
			[noteNames insertObject:[NSString stringWithString:@"E 4"] atIndex:52];
			[noteNames insertObject:[NSString stringWithString:@"F 4"] atIndex:53];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 4"] atIndex:54];
			[noteNames insertObject:[NSString stringWithString:@"F# / Gb 4"] atIndex:55];
			[noteNames insertObject:[NSString stringWithString:@"G 4"] atIndex:56];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 4"] atIndex:57];
			[noteNames insertObject:[NSString stringWithString:@"G# / Ab 4"] atIndex:58];
			[noteNames insertObject:[NSString stringWithString:@"A 4"] atIndex:59];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 4"] atIndex:60];
			[noteNames insertObject:[NSString stringWithString:@"A# / Bb 4"] atIndex:61];

		}
		
		// this will appear as the title in the navigation bar
		self.title = [noteNames objectAtIndex:[noteString intValue]];
		
		// important for view orientation rotation
		//webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);	
		self.view.autoresizesSubviews = YES;
		
		webView = [[UIWebView alloc] initWithFrame: CGRectMake(0, 0, 320, 480)];
		//[webView setDelegate:self];
				
		[self.view addSubview:webView];
				
		//NSLog(@"starting to load");
		[self loadURL:@"index"];
		
		// create the UIToolbar at the bottom of the view controller
		toolbar = [UIToolbar new];
		toolbar.barStyle = UIBarStyleDefault;
		
		// size up the toolbar and set its frame
		[toolbar sizeToFit];
		CGFloat toolbarHeight = [toolbar frame].size.height;
		CGRect mainViewBounds = self.view.bounds;
		[toolbar setFrame:CGRectMake(CGRectGetMinX(mainViewBounds),
									 CGRectGetMinY(mainViewBounds) + CGRectGetHeight(mainViewBounds) - ((toolbarHeight * 2.0)-20) + 2.0,
									 CGRectGetWidth(mainViewBounds),
									 toolbarHeight)];
		
		[self.view addSubview:toolbar];
		
		currentSystemItem = UIBarButtonSystemItemDone;
		[self createToolbarItems];
		
	}
	return self;
}

- (void)loadURL:(NSString *)urlToLoad {
	//NSLog(@"loadInstrument");		
	NSString *htmPath = [[NSBundle mainBundle] pathForResource:@"screen3.html" ofType:nil inDirectory: @"html"];
	NSString *fileURLString = [[NSURL fileURLWithPath:htmPath] absoluteString];
	NSString *params = [@"?instrument=" stringByAppendingString:self.instrument];
	params = [params stringByAppendingString:@"&s="];
	params = [params stringByAppendingString:self.note];
	//NSLog([fileURLString stringByAppendingString:params]);
	NSURL *fileURL = [NSURL URLWithString:[fileURLString stringByAppendingString:params]];
	[webView loadRequest:[NSURLRequest requestWithURL:fileURL]];		
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//return YES;
}

- (void)dealloc
{
	[webView release];
	[instrument release];
	[note release];
	[clef release];
	[noteNames release];
	
	[super dealloc];
}

// Automatically invoked after -loadView
// This is the preferred override point for doing additional setup after -initWithNibName:bundle:
//
- (void)viewDidLoad
{
	// add our custom image button as the nav bar's custom right view
	//UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"email.png"]
	//								style:UIBarButtonItemStyleBordered target:self action:@selector(action:)];
	//self.navigationItem.rightBarButtonItem = addButton;
	//[addButton release];
}

- (void)action:(id)sender
{
	// the custom icon button was clicked, handle it here
	//
}

- (void)viewDidAppear:(BOOL)animated
{
	// do something here as our view re-appears
}

@end
