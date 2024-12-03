# json-query : CS316 Coursework 2024

This is the repository for the CS316 coursework for 2024.

This coursework is worth 50% of your mark for the course. The other 50% is from the class test in Week 6 (or the redemption test in Week 9).

## Description

The goal of this coursework project is to construct a small command line Haskell program for querying data stored in [JavaScript Object Notation](https://en.wikipedia.org/wiki/JSON) (JSON). The tool we will make is a simplified version of [jq](https://jqlang.github.io/jq/).

The basic structure of the project has been written for you. To get a basic mark (≤ 10) you need to fill in the missing implementations. This will get you an implementation that can read in JSON files, filter them according to a fixed query, and print out the results.

To get a higher mark, you need to implement some automated testing and extensions to the basic project. See below for details.

## Getting Started

The whole repository is structured as a [Cabal](https://haskell.org/cabal) project in a Git repository. Cabal is the standard tool for managing and building Haskell projects.

Get started by **first** forking the repository on GitLab, and **then** cloning your fork.

**Do not make your fork public**.

The project is structured into library code in [lib](lib/) and the main program in [app/Main.hs](app/Main.hs). There is also space for tests in [test/Main.hs](test/Main.hs). Data files are stored in [data/](data/).

To build the whole project, use the following command when in the
project directory:

```
$ cabal build
```

This will build the project. The first time you do this, it may take some time to download dependencies. If this fails, please contact the module organisers, or ask on Mattermost.

To execute the program, use:

```
$ cabal run json-query -- data/hills.json
```

If you have just started, this will fail with an error reporting that the some function has not yet been implemented. Time to start implementing!

During development, it is often easier to test functions interactively via `ghci`. To load the library definitions in `src` into GHCi use:

```
$ cabal repl
```

(`repl` stands for Read-Eval-Print-Loop.)

When in `cabal repl`, you can access definitions in each module either as `<ModuleName>.<name>` (e.g., `JSONOutput.renderJSON`), or by writing `import <ModuleName>` and then using the names directly. Typing `:r` will reload any files that you have changed.

### Running the test suite

The test suite in the skeleton project only has one test, which always fails. To run it, use the command:

```
$ cabal test
```

You should get (amongst a load of other stuff):

```
Running 1 test suites...
Test suite cs316-coursework2024-test: RUNNING...
### Failure:
test/Main.hs:9
I am an unhappy test, and I can naught but fail
Cases: 1  Tried: 1  Errors: 0  Failures: 1

Test suite cs316-coursework2024-test: FAIL
```

See the [HUnit documentation](https://hackage.haskell.org/package/HUnit-1.6.2.0/docs/Test-HUnit.html) for more information on how to write tests and test suites.

## Expected Functionality

Once the unimplemented functions are implemented, the sample program ought to read in the JSON file `data/hills.json` and list out all the records in that file that have a country field of `"S"` (standing for Scotland). The output should look like:

```
$ cabal run json-query -- data/hills.json
{"Name": "Ben Chonzie", "Country": "S", "Height": 931}
{"Name": "Creagan na Beinne", "Country": "S", "Height": 888}
{"Name": "Creag Uchdag", "Country": "S", "Height": 879}
{"Name": "Auchnafree Hill", "Country": "S", "Height": 789}
{"Name": "Shee of Ardtalnaig [Ciste Buide a' Claidheimh]", "Country": "S", "Height": 759}
{"Name": "Beinn na Gainimh", "Country": "S", "Height": 729}
{"Name": "Meall Buidhe", "Country": "S", "Height": 719}
{"Name": "Creag Ruadh", "Country": "S", "Height": 712}
{"Name": "Meall Dearg", "Country": "S", "Height": 690}
{"Name": "Creag Each", "Country": "S", "Height": 673}
< ... list of hills in Scotland with their heights in metres ...>
```

The query to be run is hard coded in [app/Main.hs](app/Main.hs). To change the query (e.g., to list all the hills and mountains in England), then you need to change the definition of `query` in this file.

Obviously, it would be better if the query was not fixed at compile time and the user was able to enter their own query. See below for extensions you can make to the basic system.

## Project Structure

- [cs316-coursework-2024.cabal](cs316-coursework-2024.cabal) : the description of this project for the [Cabal](https://haskell.org/cabal) build system. If you want to add any additional dependencies to the project then you will need to add them in here.
- [app/](app/)
  - [app/Main.hs](app/Main.hs) : contains the source code for the main `json-query` executable.
- [data/](data/)
  - [data/hills.json](data/hills.json) : the Database of British and Irish Hills (names, countries, and heights only).
- [LICENSE](LICENSE) : the License for this software. Fill in your name, if you wish.
- [README.md](README.md) : This file!
- [lib/](lib/) : The modules making up the main library of code for this project.
  - [lib/JSON.hs](lib/JSON.hs) : definition of the `JSON` datatype, and some functions for working with `JSON` values.
  - [lib/JSONInput.hs](lib/JSONInput.hs) : functions for parsing JSON files, based on the worked example from Week 8. You will not need to edit this for the basic project.
  - [lib/JSONOutput.hs](lib/JSONOutput.hs) : functions for outputing JSON values in JSON format. You will need to edit this file to implement the basic project.
  - [lib/JSONTransformer.hs](lib/JSONTransformer.hs) : functions for filtering and transforming JSOn values. You will need to edit this file to implement the basic project.
  - [lib/ParserCombinators.hs](lib/ParserCombinators.hs) : a library for implementing parsers. You will probably not need to edit this file. See the Week 8 notes for more information on how parsers work.
  - [lib/Result.hs](lib/Result.hs) : a datatype for results that may be either successful or a failure. You will not need to edit this file.
- [test/](test/)
  - [test/Main.hs](test/Main.hs) : file to write tests in. You will have to fill this in to get credit for the tests.

## Marking Scheme

The project is marked out of 50. The marks start being relatively easy to get, and progress to being harder.

- **10 marks** Completion of the missing parts in the implementation, so that the example query works. Specifically these are:

  1. [lib/JSONOutput.hs](lib/JSONOutput.hs): Make the conversion of JSON values to their textual representations work.
     - `escapeChar`, `escapeString`, `quote`, and `renderString` (1 mark)
     - `sqbracket`, `curlybracket`, `concatWith`, and `renderField` (1 mark)
     - The `JsonArray` and `JsonObject` cases in `renderJSON` (1 mark)

  2. [lib/JSON.hs](lib/JSON.hs). Implement the basic operations on JSON values needed for the example query:
     - `isTruthy`, `equal`, and `notEqual` (1 mark)

  3. [lib/JSONTransformer.hs](src/JSONTransformer.hs). Implement the core functionality for analysing and querying JSON values.
     - `constant`, `string`, `integer`, `bool`, and `jnull` (1 mark)
     - `select` (1 mark)
     - `binaryOp` (1 mark)
     - `pipe` (1 mark)
     - `getElements` (1 mark)
     - `getField` (1 mark)

  Each function has a documentation block above it describing the intended functionality.

  To get all ten marks, your code will need to be robust to user input, and reasonably well written and concise.

  Once all of the above have been written, the example query ought to work, and you'll get the output as shown above when you run the whole application on the [hills](data/hills.json) data.

- **5 marks** A test suite. Fill in the file `test/Main.hs` with tests for the functions you have written, so that failing tests are reported appropriately. You can either write a list of tests by hand, or use a unit testing framework like [HUnit](https://hackage.haskell.org/package/HUnit). For more marks, explore property based testing using [QuickCheck](https://hackage.haskell.org/package/QuickCheck).

  You should document your test suite to say what is being tested by each test.

  For advice on how to use these testing frameworks, please ask on Mattermost or in the labs.

- **35 marks** Additional features. You can add any additional features as you see fit to add.

  Here are some suggestions:

  - Better error handling in the `main` function. At the moment, the program crashes if the user does not supply a filename, or if the file does not exist. Can you fix it?

  - Letting the user specify the query on the command line. You will need to write a parser for queries, and work out how to read them from the command line. You will probably need to define a data type for the syntax of whatever query language your parser can handle, and to write an interpreter for it (similar to the interpreter for propositional logic in the Week 03 problems).

  - Doing error checking and reporting during transformer execution. For example, the query defined in `Main` references a field called `Country`. If the field doesn't exist, then it returns no results. Maybe it should return an error instead? *Hint*: Alter the type `Transformer` in the `JSONTransformer` module to be `JSON -> Result [JSON]`, and then fix all the type errors that result. You will have to think carefully about how errors are passed through the different transformers.

  - Additional features for querying and generating JSON:
    - The only comparison operators in the `JSON` module are an equality test and a disequality test. Try adding some more (e.g., `>`, `>=`, `<`, `<=`, for example).
	- Other operations are possible too. For example, string functions, array indexing, regular expressions, arithmetic, enough to make it possible to write complex queries.
    - Allow for construction of JSON values as well as just filtering. See the [`jq` documentation](https://jqlang.github.io/jq/) for how this is done in `jq`. See also the paper by Wallace and Runciman linked to in the `JSONTransformer` module, which makes a similar language for querying XML files.
    - Functions for aggregation. Can you count the number of hills in Wales? Can you find the tallest peak in England? What is the average height of hills in Scotland?
    - JQ has some more advanced features, like variables and functions, and also assignment operators that can be used to alter JSON documents. You could try implementing these kinds of advanced features.

  - Alternative output formats (Comma Separated Values, Tab Separated
    Values, HTML, ...). The ouptut could be pretty printed and coloured like Jq does as well.

  You will marked on:
  - Documentation and User Interface of the additional feature
  - The complexity of the implementation
  - The robustness and good coding style of the additional feature

## Submission

Make sure that your final submission is pushed to your GitLab repository.

You must give **Robert Atkey** and **Guillaume Allais** access to your repository so we can mark it. We need at least **Reporter** access (“Guest” is not enough).

Submit a small **text** file containing a link to your repository on GitLab and any additional information you want to add to describe what you have done. You should also include the following statement: *The code in my GitLab repository is entirely my own work, except where it is from the original project skeleton or has been clearly stated. No code has been copied from classmates. I understand this code will be checked with plagiarism checkers. I give permission for the source code to be inspected on CIS servers.*

Standard late submission and illness rules apply. If you are ill or have other personal circumstances you must certify on Pegasus and request an extension before the deadline using a MyPlace extension request.

## Credits

The database of hills in [data/hills.json](data/hills.json) is a copy of the [Database of British and Irish Hills](http://www.hills-database.co.uk/downloads.html), v17.2, CSV version. The original file is very large, so we have limited it to just the names, countries, and height in metres, and converted it to JSON.
