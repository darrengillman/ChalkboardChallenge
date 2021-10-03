# Read Me
# Chalkboard Challenge App

## Usage
Compile in XCode 13
Actually developed in Beta 5 as unwilling to install release version of XCode due to other ongoing work 
Target iOS 14.0 and above
Run App
Click "download data" prompt to fetch from API and display.
Tap any summary item to get to the detail screen

## Next steps / Incomplete items

1. Complete UI - currently basic UI implemented due to lack of time
2. Improved error handling on downloads


## Assumptions
1. API will return valid data & no null.  So the demo app doesn't have to have optionals scattered throughout the data structure or spend time coding error handling / customer decoders

## Approach

1. All code written from scratch other than any of my common extensions, which will be in the Extensions group.  I see no point in demonstrating gluing together lots of third party libraries.

2. All UI will be in code rather than storyboard (I much prefer the control code provides

3. REST API used for the challenge

4. PAW third party app used to examine API response and determine JSON structure

5. All data is provided in initial API response.  No check of header data for paging etc.

Start 09:00 Oct 3


## Issues faced in Challenge
 1. XCode threw a fit and lost its reference to info.plist.  Good 10+ mins lost fixing this. 
