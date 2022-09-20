Feature: Quote a post
Given the user is on home page
When the user clicks on quote icon in a post
And the post is from another user
And the user doesn't created more than 4 posts on current day yet
Then the user will see his quote-post on feed