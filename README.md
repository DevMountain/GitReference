GitReference
============

A simple iOS app with a single scroll view that shows git cheat sheet.

###Step 1:
- Clone down this project (or create a new single view controller in Xcode)
- Add a scrollView to the main view
- Add a title ("GitReference") to the scrollView

*Note: You may want to give the scrollView a y of 20 so that it doesn't collide with the status bar. And you might want to set a global margin (say 15) so that your text doesn't butt up against the edges of the screen.*

###Step 2:
- Copy the methods over from this gist: https://gist.github.com/jkhowland/135865ad41e9afe86898

###Step 3:
- Track a top value
  - You'll need to track the top of each label as you iterate through the git commands and add to it each time you want to move further down in the scrollView
- Add a for loop to iterate through the dictionaries in the gitCommands method provided
- Create a command label and add it to the view
- Create a reference label and add it to the view just below the command 

###Step 4:
- Make sure to update the scrollView's contentSize to the height of all of the labels combined (including margins)
