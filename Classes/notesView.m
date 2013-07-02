//
//  NotesView.m
//  instruments-in-reach-v2
//
//  Created by jrtb on 10/8/08.
//  Copyright 2008 jrtb. All rights reserved.
//

#import "NotesView.h"

@implementation NotesView

@synthesize delegate, instrument, clef, firstTouch, lastTouch, touchesMoved, touchesStarted, touchesEnded;
@synthesize startingNote, currentNote, noteNames, notes, instrument_min, instrument_max, currentX, drawn, noteCView, noteC;

- (void)drawNotes {
	
	// jrtb
	
	// hey chris :)
	
	// here is the code that adds the note labels, label boxes and note images to the larger noteView.
	// the noteView scrolls inside a scrollView
	// as you can see below, I'm releasing the labels, boxes and note images after adding them to noteView
	
	NSLog(@"allocing noteView components");

	int loopCount = 0;
	int lastX = 0;
	//for (int i=self.currentNote; i < self.currentNote+6; i++) {
	for (int i=self.instrument_min; i <= self.instrument_max; i++) {
		
		double noteX = currentX+(44.0*loopCount);
		
		// label for note 1
		UILabel *noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(noteX+6.0, 2.0, 44.0, 40.0)];
		[noteLabel setText:[self.noteNames objectAtIndex:i]];
		[noteLabel setTextAlignment:UITextAlignmentCenter];
		noteLabel.font = [UIFont fontWithName:@"Arial" size: 12.0];
		noteLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:noteLabel];
		[noteLabel release];
		
		// box for note 1
		UIView *boxView = [[UIView alloc] initWithFrame:CGRectMake(noteX+12.0, 8.0, 32.0, 28.0)];
		UIImageView *box = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"square.png"]];
		[boxView addSubview:box];
		[self addSubview:boxView];	
		[boxView release];
		[box release];
		
		// image for note 1
		UIView *noteView = [[UIView alloc] initWithFrame:CGRectMake(noteX, 40.0, 44.0, 113.0)];
		UIImageView *note = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat: @"html/%@_notes/%@.gif", self.clef, [self.notes objectAtIndex:i]]]];
		//add image view to view
		[noteView addSubview:note];
		[self addSubview:noteView];	
		[noteView release];
		[note release];
		
		loopCount++;
		lastX = noteX+44;
		
	}
	
	UIView *endView = [[UIView alloc] initWithFrame:CGRectMake(lastX, 40.0, 44.0, 113.0)];
	UIImageView *end = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat: @"html/note_end%@.gif", self.clef]]];
	//add image view to view
	[endView addSubview:end];
	[self addSubview:endView];	
	[endView release];
	[end release];
	
	//currentX = -44*(self.startingNote-instrument_min);
	//self.frame = CGRectMake(currentX, 0.0, 3001.0, 153.0);
	
	self.drawn = YES;
}	

- (void)initNotes {
	//NSLog(@"init notes");

	// starting left position = 32
	// each note is 44 pixels wide
	// note is 153 pixels high total, 40 for name and 113 for image
	
	instrument_min = 0;
	instrument_max = 61;
	currentX = 0;
	
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
	
	if ([self.clef isEqualToString:@"TC"]) {
		
		startingNote = 21;
		
		for (int i = 0; i <= 61; i++) {
			//notes[i] = 'T'+i.toString();
			[self.notes insertObject:[NSString stringWithFormat: @"T%i", i] atIndex:i];
		}
		
		// TC names
		[self.noteNames insertObject:[NSString stringWithString:@"E 3"] atIndex:0];
		[self.noteNames insertObject:[NSString stringWithString:@"F 3"] atIndex:1];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 3"] atIndex:2];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 3"] atIndex:3];
		[self.noteNames insertObject:[NSString stringWithString:@"G 3"] atIndex:4];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 3"] atIndex:5];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 3"] atIndex:6];
		[self.noteNames insertObject:[NSString stringWithString:@"A 3"] atIndex:7];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 3"] atIndex:8];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 3"] atIndex:9];
		[self.noteNames insertObject:[NSString stringWithString:@"B 3"] atIndex:10];
		[self.noteNames insertObject:[NSString stringWithString:@"C 4"] atIndex:11];
		[self.noteNames insertObject:[NSString stringWithString:@"C# 4"] atIndex:12];
		[self.noteNames insertObject:[NSString stringWithString:@"Db 4"] atIndex:13];
		[self.noteNames insertObject:[NSString stringWithString:@"D 4"] atIndex:14];
		[self.noteNames insertObject:[NSString stringWithString:@"D# 4"] atIndex:15];
		[self.noteNames insertObject:[NSString stringWithString:@"Eb 4"] atIndex:16];
		[self.noteNames insertObject:[NSString stringWithString:@"E 4"] atIndex:17];
		[self.noteNames insertObject:[NSString stringWithString:@"F 4"] atIndex:18];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 4"] atIndex:19];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 4"] atIndex:20];
		[self.noteNames insertObject:[NSString stringWithString:@"G 4"] atIndex:21];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 4"] atIndex:22];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 4"] atIndex:23];
		[self.noteNames insertObject:[NSString stringWithString:@"A 4"] atIndex:24];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 4"] atIndex:25];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 4"] atIndex:26];
		[self.noteNames insertObject:[NSString stringWithString:@"B 4"] atIndex:27];
		[self.noteNames insertObject:[NSString stringWithString:@"C 5"] atIndex:28];
		[self.noteNames insertObject:[NSString stringWithString:@"C# 5"] atIndex:29];
		[self.noteNames insertObject:[NSString stringWithString:@"Db 5"] atIndex:30];
		[self.noteNames insertObject:[NSString stringWithString:@"D 5"] atIndex:31];
		[self.noteNames insertObject:[NSString stringWithString:@"D# 5"] atIndex:32];
		[self.noteNames insertObject:[NSString stringWithString:@"Eb 5"] atIndex:33];
		[self.noteNames insertObject:[NSString stringWithString:@"E 5"] atIndex:34];
		[self.noteNames insertObject:[NSString stringWithString:@"F 5"] atIndex:35];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 5"] atIndex:36];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 5"] atIndex:37];
		[self.noteNames insertObject:[NSString stringWithString:@"G 5"] atIndex:38];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 5"] atIndex:39];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 5"] atIndex:40];
		[self.noteNames insertObject:[NSString stringWithString:@"A 5"] atIndex:41];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 5"] atIndex:42];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 5"] atIndex:43];
		[self.noteNames insertObject:[NSString stringWithString:@"B 5"] atIndex:44];
		[self.noteNames insertObject:[NSString stringWithString:@"C 6"] atIndex:45];
		[self.noteNames insertObject:[NSString stringWithString:@"C# 6"] atIndex:46];
		[self.noteNames insertObject:[NSString stringWithString:@"Db 6"] atIndex:47];
		[self.noteNames insertObject:[NSString stringWithString:@"D 6"] atIndex:48];
		[self.noteNames insertObject:[NSString stringWithString:@"D# 6"] atIndex:49];
		[self.noteNames insertObject:[NSString stringWithString:@"Eb 6"] atIndex:50];
		[self.noteNames insertObject:[NSString stringWithString:@"E 6"] atIndex:51];
		[self.noteNames insertObject:[NSString stringWithString:@"F 6"] atIndex:52];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 6"] atIndex:53];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 6"] atIndex:54];
		[self.noteNames insertObject:[NSString stringWithString:@"G 6"] atIndex:55];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 6"] atIndex:56];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 6"] atIndex:57];
		[self.noteNames insertObject:[NSString stringWithString:@"A 6"] atIndex:58];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 6"] atIndex:59];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 6"] atIndex:60];
		
	}
	
	if (self.clef == @"BC") {
		
		startingNote = 29;
		
		for (int i = 0; i <= 61; i++) {
			//notes[i] = 'B'+i.toString();
			[self.notes insertObject:[NSString stringWithFormat: @"B%i", i] atIndex:i];
		}
		
		// BC names
		[self.noteNames insertObject:[NSString stringWithString:@""] atIndex:0];
		[self.noteNames insertObject:[NSString stringWithString:@"E 1"] atIndex:1];
		[self.noteNames insertObject:[NSString stringWithString:@"F 1"] atIndex:2];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 1"] atIndex:3];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 1"] atIndex:4];
		[self.noteNames insertObject:[NSString stringWithString:@"G 1"] atIndex:5];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 1"] atIndex:6];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 1"] atIndex:7];
		[self.noteNames insertObject:[NSString stringWithString:@"A 1"] atIndex:8];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 1"] atIndex:9];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 1"] atIndex:10];
		[self.noteNames insertObject:[NSString stringWithString:@"B 1"] atIndex:11];
		[self.noteNames insertObject:[NSString stringWithString:@"C 2"] atIndex:12];
		[self.noteNames insertObject:[NSString stringWithString:@"C# 2"] atIndex:13];
		[self.noteNames insertObject:[NSString stringWithString:@"Db 2"] atIndex:14];
		[self.noteNames insertObject:[NSString stringWithString:@"D 2"] atIndex:15];
		[self.noteNames insertObject:[NSString stringWithString:@"D# 2"] atIndex:16];
		[self.noteNames insertObject:[NSString stringWithString:@"Eb 2"] atIndex:17];
		[self.noteNames insertObject:[NSString stringWithString:@"E 2"] atIndex:18];
		[self.noteNames insertObject:[NSString stringWithString:@"F 2"] atIndex:19];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 2"] atIndex:20];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 2"] atIndex:21];
		[self.noteNames insertObject:[NSString stringWithString:@"G 2"] atIndex:22];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 2"] atIndex:23];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 2"] atIndex:24];
		[self.noteNames insertObject:[NSString stringWithString:@"A 2"] atIndex:25];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 2"] atIndex:26];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 2"] atIndex:27];
		[self.noteNames insertObject:[NSString stringWithString:@"B 2"] atIndex:28];
		[self.noteNames insertObject:[NSString stringWithString:@"C 3"] atIndex:29];
		[self.noteNames insertObject:[NSString stringWithString:@"C# 3"] atIndex:30];
		[self.noteNames insertObject:[NSString stringWithString:@"Db 3"] atIndex:31];
		[self.noteNames insertObject:[NSString stringWithString:@"D 3"] atIndex:32];
		[self.noteNames insertObject:[NSString stringWithString:@"D# 3"] atIndex:33];
		[self.noteNames insertObject:[NSString stringWithString:@"Eb 3"] atIndex:34];
		[self.noteNames insertObject:[NSString stringWithString:@"E 3"] atIndex:35];
		[self.noteNames insertObject:[NSString stringWithString:@"F 3"] atIndex:36];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 3"] atIndex:37];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 3"] atIndex:38];
		[self.noteNames insertObject:[NSString stringWithString:@"G 3"] atIndex:39];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 3"] atIndex:40];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 3"] atIndex:41];
		[self.noteNames insertObject:[NSString stringWithString:@"A 3"] atIndex:42];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 3"] atIndex:43];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 3"] atIndex:44];
		[self.noteNames insertObject:[NSString stringWithString:@"B 3"] atIndex:45];
		[self.noteNames insertObject:[NSString stringWithString:@"C 4"] atIndex:46];
		[self.noteNames insertObject:[NSString stringWithString:@"C# 4"] atIndex:47];
		[self.noteNames insertObject:[NSString stringWithString:@"Db 4"] atIndex:48];
		[self.noteNames insertObject:[NSString stringWithString:@"D 4"] atIndex:49];
		[self.noteNames insertObject:[NSString stringWithString:@"D# 4"] atIndex:50];
		[self.noteNames insertObject:[NSString stringWithString:@"Eb 4"] atIndex:51];
		[self.noteNames insertObject:[NSString stringWithString:@"E 4"] atIndex:52];
		[self.noteNames insertObject:[NSString stringWithString:@"F 4"] atIndex:53];
		[self.noteNames insertObject:[NSString stringWithString:@"F# 4"] atIndex:54];
		[self.noteNames insertObject:[NSString stringWithString:@"Gb 4"] atIndex:55];
		[self.noteNames insertObject:[NSString stringWithString:@"G 4"] atIndex:56];
		[self.noteNames insertObject:[NSString stringWithString:@"G# 4"] atIndex:57];
		[self.noteNames insertObject:[NSString stringWithString:@"Ab 4"] atIndex:58];
		[self.noteNames insertObject:[NSString stringWithString:@"A 4"] atIndex:59];
		[self.noteNames insertObject:[NSString stringWithString:@"A# 4"] atIndex:60];
		[self.noteNames insertObject:[NSString stringWithString:@"Bb 4"] atIndex:61];
		
	}
	
	//NSLog(@"starting note: %i", startingNote);
	//NSLog([self.notes objectAtIndex:startingNote]);
	//NSLog([self.noteNames objectAtIndex:startingNote]);

	self.currentNote = self.startingNote;
	
}	

- (void)handleTimer {
	//NSLog(@"remove click view");
	[noteCView removeFromSuperview];
}	

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSSet *allTouches = [event allTouches];
	self.lastTouch = [[[touches allObjects] objectAtIndex:([allTouches count]-1)] locationInView:self];
	NSString *noteClicked = [NSString stringWithFormat:@"%i",(int)(((self.lastTouch.x)/44)+instrument_min)];

	int clickPosition = (int)((self.lastTouch.x)/44);
	
	//NSLog([NSString stringWithFormat:@"clickPosition: %i",clickPosition]);
	
	int drawX = (clickPosition*44)+8;
	
	// click image for note
	noteCView = [[UIView alloc] initWithFrame:CGRectMake(drawX, 0.0, 44.0, 153.0)];
	noteC = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"note_click.png"]];
	//add image view to view
	[noteCView addSubview:noteC];
	noteCView.alpha = 0.4;
	[self addSubview:noteCView];	
	[self bringSubviewToFront:noteCView];
	//NSLog(@"adding click image");
	
	NSTimer *timer;
	
	timer = [NSTimer scheduledTimerWithTimeInterval: 0.5
											 target: self
										   selector: @selector(handleTimer)
										   userInfo: nil
											repeats: NO];
	
	[delegate selectedNote:noteClicked instrument:self.instrument];
	
	//[noteClicked release];
	//[allTouches release];
}

/*
- (void)slideLeft {

	NSLog([NSString stringWithFormat:@"currentX: %i",currentX]);
	
	currentX += 44*5;
	
	if (currentX > 0) {
		currentX = 0;
	}

	[self updateNotes];
		
	NSLog([NSString stringWithFormat:@"currentX: %i",currentX]);
	
}

- (void)slideRight {

	NSLog([NSString stringWithFormat:@"currentX: %i",currentX]);

	NSLog([NSString stringWithFormat:@"max: %i",(-44*(instrument_max-instrument_min))+(44*5)]);	
		
	currentX -= 44*5;
	
	if (currentX < (-44*(instrument_max-instrument_min))+(44*6)) {
		currentX = (-44*(instrument_max-instrument_min))+(44*6);
	}
	
	[self updateNotes];
		
	NSLog([NSString stringWithFormat:@"currentX: %i",currentX]);
	
}


- (void)updateNotes {
	NSLog(@"update notes");

	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	self.frame = CGRectMake(currentX, 0.0, 3001.0, 153.0);
	[UIView commitAnimations];

}	



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"touchesBegan");	
	touchesStarted = YES;
	touchesMoved = NO;
	
	if (touchesEnded) {
	
		self.firstTouch = [[[touches allObjects] objectAtIndex:0] locationInView:self];
		//NSLog(@"recording first touch at %f,%f", self.firstTouch.x, self.firstTouch.y);
		touchesEnded = NO;
		
	}
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesMoved");	
	touchesMoved = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"touchesEnded");
    NSSet *allTouches = [event allTouches];
	self.lastTouch = [[[touches allObjects] objectAtIndex:([allTouches count]-1)] locationInView:self];
	//NSLog(@"recording last touch at %f,%f", self.lastTouch.x, self.lastTouch.y);
	
	NSLog(@"started at %f,%f", self.firstTouch.x, self.firstTouch.y);
	if (touchesMoved) {
		NSLog(@"touches moved");
		
		if (self.lastTouch.x > self.firstTouch.x) {
			// scroll left
			NSLog(@"scroll left");
			//[self slideLeft];
		}
		if (self.lastTouch.x < self.firstTouch.x) {
			// scroll right
			NSLog(@"scroll right");
			//[self slideRight];
		}
		
		// play click sound effect
		NSString *soundFile;
		NSURL *soundFileURL;
		
		soundFile = [[NSBundle mainBundle] pathForResource: @"click2" ofType:@"wav" inDirectory: nil];  
		soundFileURL = (NSURL *) CFURLCreateWithFileSystemPath (
																kCFAllocatorDefault,
																(CFStringRef)soundFile,
																kCFURLPOSIXPathStyle,
																FALSE
																);
		
		if ([[NSFileManager defaultManager] fileExistsAtPath: soundFile]) {
			// if not playing, start playing
			if (self.player == nil) {
			
				// before instantiating the playback audio queue object, 
				// set the audio session category
				UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
				AudioSessionSetProperty (
										 kAudioSessionProperty_AudioCategory,
										 sizeof (sessionCategory),
										 &sessionCategory
										 );
			
				AudioPlayer *thePlayer = [[AudioPlayer alloc] initWithURL: soundFileURL];                     
				self.player = thePlayer;
				[thePlayer release];								// decrements the retain count for the thePlayer object
			
				self.player.delegate = self;	// sets up the playback object to receive property change notifications from the playback audio queue object
			
				// activate the audio session immmediately before playback starts
				AudioSessionSetActive (true);
				NSLog (@"sending play message to play object.");
				[self.player play];
			
				// else if playing, stop playing
			} else if (self.player) {
			
				NSLog (@"User tapped Stop to stop playing.");
				[self.player setAudioPlayerShouldStopImmediately: YES];
				NSLog (@"Calling AudioQueueStop from controller object.");
				[self.player stop];
			
				// now that playback has stopped, deactivate the audio session
				AudioSessionSetActive (false);
			}
		}
	
	} else {
		NSLog(@"click through");		
		
		NSLog([NSString stringWithFormat:@"last click: %f",self.lastTouch.x]);
		
		NSString *noteClicked = [NSString stringWithFormat:@"%i",(int)(((self.lastTouch.x)/44)+instrument_min)];
		
		NSLog([NSString stringWithFormat:@"note click: %@",noteClicked]);
		
		[delegate selectedNote:noteClicked instrument:self.instrument];	
	}
	NSLog(@"ended at %f,%f", self.lastTouch.x, self.lastTouch.y);	
	
	touchesStarted = NO;
	touchesMoved = NO;
	touchesEnded = YES;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesCancelled");
}
*/ 

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];

	// Initialization code
	//NSLog(@"init notesView");
	
	self.notes = [[NSMutableArray alloc] init];
	self.noteNames = [[NSMutableArray alloc] init];
	
	touchesStarted = NO;
	touchesMoved = NO;
	touchesEnded = YES;

	self.autoresizesSubviews = NO;
	//self.multipleTouchEnabled = YES;
	
	self.drawn = NO;
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
			
}

- (void)dealloc {

	NSLog(@"releasing noteView components");
	[delegate release];
	[instrument release];
	[clef release];
	[noteNames release];
	[notes release];
	[noteCView release];
	[noteC release];
	
    [super dealloc];
}

@end
