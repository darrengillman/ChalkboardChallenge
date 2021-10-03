# Read Me
# Chalkboard Challenge App

## Usage
Developed/Compiled in XCode 13 Beta 5
Developed in Beta 5 as reluctant to install release version of XCode 13 due to other ongoing work 
Target iOS 14.0 and above
Run App in iOS simulator or on device
Click "download data" prompt to fetch from API and display.
Tap any summary item to get to the detail screen

## Next steps if time allowed

1. Complete UI - currently basic UI implemented due to lack of time, especially
   - add initials circle on birthdays listing - code is already in details view, just needed abstracting to a custom UIView, but ran out of time
   - rewrite the basic "no data" cell presented on first load.  Current one if functional but hideous
2. Improved error handling on downloads, including providing user feedback.  Currently just returns no data & logs error


## Assumptions
1. API will return valid data & no null.  So the demo app doesn't have to have optionals scattered throughout the data structure or spend time coding error handling / customer decoders
2. All data is provided in initial API response.  No check of header data for paging etc.

## Approach

1. All code written from scratch other than any of my common extensions, which will be in the Extensions group.  I see no point in demonstrating gluing together lots of third party libraries.

2. All UI will be in code rather than storyboard (I much prefer the control code provides

3. REST API used for the challenge

4. PAW third party app used to examine API response and determine JSON structure

5. Developed using UIKit; although SwiftUI would been ideal for this UI in theory, I wasn't prepared to fight with its occasional glitches under a tight time constraint


## Issues faced in Challenge
 1. XCode threw a fit and lost its reference to info.plist.  Good 10-15 mins lost fixing this. 
 


## Contact Details
Darren Gillman
e: darren@gillman.org.uk
t: 07770 661594
blog (although not updated for a long time!): darrengillman.com
SO profile: https://stackoverflow.com/users/3218273/flanker 
