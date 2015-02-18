#ifdef _STEREO_VISION_
/*=========================================================================
  Program:   OsiriX

  Copyright (c) OsiriX Team
  All rights reserved.
  Distributed under GNU - LGPL
  
  See http://www.osirix-viewer.com/copyright.html for details.

     This software is distributed WITHOUT ANY WARRANTY; without even
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.
 ---------------------------------------------------------------------------
 
 This file is part of the Horos Project.
 
 Current contributors to the project include Alex Bettarini and Danny Weissman.
 
 Horos is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation,  version 3 of the License.
 
 Horos is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with Horos.  If not, see <http://www.gnu.org/licenses/>.

 

 
 ---------------------------------------------------------------------------
 
 This file is part of the Horos Project.
 
 Current contributors to the project include Alex Bettarini and Danny Weissman.
 
 Horos is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation,  version 3 of the License.
 
 Horos is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with Horos.  If not, see <http://www.gnu.org/licenses/>.

=========================================================================*/

#import "VTKStereoSRView.h"
#import "VTKViewOSIRIX.h"
#import "DCMView.h"
#import "DCMCursor.h"
#import "Notifications.h"
#import "SRView.h"

#define id Id
#include "vtkRenderer.h"
#include "vtkCocoaRenderWindow.h"
#include "vtkCocoaRenderWindowInteractor.h"
#include "vtkCommand.h"
#include "vtkCamera.h"
#include "vtkInteractorStyleTrackballCamera.h"
#undef id



@implementation VTKStereoSRView

-(id)initWithFrame:(NSRect)frame: (SRView*) aSRView;
{
	if (self = [super initWithFrame:frame])
	{
		
		NSTrackingArea *cursorTracking = [[[NSTrackingArea alloc] initWithRect: [self visibleRect] options: (NSTrackingCursorUpdate | NSTrackingInVisibleRect | NSTrackingMouseEnteredAndExited | NSTrackingActiveInKeyWindow) owner: self userInfo: nil] autorelease];
		
		superSRView = aSRView;
		[self addTrackingArea: cursorTracking];


	//	aRenderer = [self renderer];
	//	cursor = nil;
	//	currentTool = t3DRotate;
	//	[self setCursorForView: currentTool];
	
	}
	return self;
}

- (void)windowWillClose:(NSNotification *)notification
{
	if( [notification object] == [self window])
	{
		[[self window] setAcceptsMouseMovedEvents: NO];
		
		[[NSNotificationCenter defaultCenter] removeObserver: self];
	}
}

- (void) dealloc
{
	superSRView = nil;
	[superSRView release];
	/*	
	[cursor release];
	[_mouseDownTimer invalidate];
	[_mouseDownTimer release];*/
	
	[super dealloc];
}

#pragma mark-
#pragma mark Cursors

//cursor methods

- (void)mouseEntered:(NSEvent *)theEvent
{
	[superSRView mouseEntered:theEvent];
}

- (void)mouseExited:(NSEvent *)theEvent
{
	[superSRView mouseExited:theEvent];
}

-(void)cursorUpdate:(NSEvent *)theEvent
{
    [superSRView cursorUpdate:theEvent];
}


- (void)mouseDown:(NSEvent *)theEvent
{
	[superSRView mouseDown:theEvent];
}

- (void)rightMouseDown:(NSEvent *)theEvent
{	
	[superSRView rightMouseDown:theEvent];
}

- (void)mouseDragged:(NSEvent *)theEvent{
	
	[superSRView mouseDragged:theEvent];
}

- (void)rightMouseDragged:(NSEvent *)theEvent{
	[superSRView rightMouseDragged:theEvent];
}


- (void)otherMouseDown:(NSEvent *)theEvent
{
	[superSRView otherMouseDown:theEvent];
}


- (void)mouseUp:(NSEvent *)theEvent{
	[superSRView mouseUp:theEvent];
}

- (void)rightMouseUp:(NSEvent *)theEvent{
	[superSRView rightMouseUp:theEvent];
	
}


- (void) keyDown:(NSEvent *)event
{
	[superSRView keyDown:event];
}



@end

#endif