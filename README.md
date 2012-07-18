Morning Pages
=============

[![Build Status](https://secure.travis-ci.org/chrismdp/morning-pages.png?branch=master)](http://travis-ci.org/chrismdp/morning-pages)

I've long been fascinated by the morning pages habit of writing three pages (or about 750 words) of whatever comes into your head each day - it's like taking a mental showers and helps to clear your head, ready for the day. There are great sites out there like http://750words.com, but I live on the command line and like to keep my words on my own computer.

When installed, type `morning-pages` to open your `$EDITOR` with the file for today. Type away and quit your editor, and you'll get stats on how many words you've typed today.

Use `-d <folder>` to change the default words folder (currently `~/words`).

## Plans

In future, I hope to post words stats up to a central server so we can track leaderboards and badges. Don't worry, we'll never post your actual words.

## Contributing

We work on pull requests. If you have an idea for something you'd like to contribute, here's how to do it:

1. Create a local branch, and commit a failing spec that describes what you want to implement.
2. Push the branch, go on Github and create a pull request from the head of the branch.
3. Start the conversation: ping the mailing list and get some people to pair with you on designing the code. Iterate in the pull request, adding more specs, making them pass and refactoring until everyone is happy.
4. Remember to regularly rebase your branch from master in case there are upstream changes to pull in.
5. Get someone else to merge your pull request, that way you know your code makes sense to at least one other person.
6. Go and have a nice cup of tea to celebrate.
