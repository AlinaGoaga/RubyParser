# Parser test

This small app aims to parse a document containing webpages and visitors and display
the visits for each page (unique and non-unique). It's been built with ```ruby 2.5.1```.

Here is an example when using the webserver.log file contained in this repository:

```
***Visits to webpage***
/about/2: 90 views
/contact: 89 views
/index: 82 views
/about: 81 views
/help_page/1: 80 views
/home: 78 views

***Unique visits to webpage***
/help_page/1: 23 unique views
/contact: 23 unique views
/home: 23 unique views
/index: 23 unique views
/about/2: 22 unique views
/about: 21 unique views

```

# How to use and run tests

Before proceeding, please run ```bundle``` to install the dependencies.

Run ```ruby runner.rb name_of_file_to_parse``` in your terminal.
e.g: ```ruby runner.rb webserver.log```

To check the tests, run ```rspec``` in the root directory.

# My approach

- started by setting up the project and added the dependencies I knew I'd need: rspec for testing, pry for debugging, simplecov for testing coverage, rubocop for linting (using the
version provided by Makers)
- refreshed knowledge of parsing in Ruby: loaded the file in irb and used that
environment to work out how I could extract the data in a format that would be easy
to use
- decided on how I wanted to store the data from the file (I decided to use a hash and have the webpage point to the visits)
- started to write code using a TDD approach
- kept the approach simple by having everything in one class to start with and extracted the second class (Parser) later, once it became obvious that Log had too many responsibilities
- the tests are making use of mocking and stubbing to ensure the classes are tested in isolation
- I refactored as I went along to improve readability and maintainability (this included renaming files and variables and restructuring the code)
- it also became apparent that there wouldn't be any need for some of the methods to be accessible from the outside so these were made private (counting and sorting)
- as I built the code, I focused on functionality (the formatting was adjusted once this was achieved)
- I kept on reviewing the tests and decided to add a few smaller ones at the end to make it easier to spot errors should the code break
- the runner gives an easy way for the user to parse the file (ideally I'd like to go back to this and do some more research as to how to test command line instructions)
