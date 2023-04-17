### HANGMAN
This is a simple hangman game. At the start of the game a random word is selected from a large collection.
User has 7 attempts to guess random letters and reveal the word. 

#### Runing the game
To run the game on your local machine, clone this git repo and install elixir using the documentation at elixir-lang.org
In terminal navigate to the Text_client folder and run iex -S mix
Then execute TextClient.start()
The prompts will guide your gameplay

### Implementation
The first iteration implementation uses more basic functional programing.
The main feature are small concise function calls that do one thing only. 
For different logic paths , a pattern matching is used on the method signature.
Recursive methods calls is the only way thus far that allow for state to be passed around.

The other important feature is logical division of application on Public (API) Layer and Private ( Business Logic) layer.
Files under lib/impl folders contain the logic they are invoked from the Outer API classes using delegate pattern,
encapsulating the inner workings and implementation specifics with consumers
