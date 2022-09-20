Feature: Make a post
Given the user is on home page or user profile page
When the user clicks on post button and fill the text input
And the text field have a maximum of 777 characters
And the user doesn't created more than 4 posts on current day yet
Then the user will see his post on feed