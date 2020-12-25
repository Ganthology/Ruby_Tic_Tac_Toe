# Tic Tac Toe
## Introduction
This is a project from The Odin Project to display the ability to use the Object Oriented Programming concept in Ruby language. The first project is to design a Tic Tac Toe game using Ruby.
## Features
The project involves 3 classes - Board class, Player class, and Tic Tac Toe class.

The Board class are used to render the board for players to make their marks on it. The methods included are #new_board, #display_board, #place, #valid_coor?, #occupied?, #win? and #tie?. #display_board are used to update the board and show the current board to the players. #valid_coor? and #occupied? are used to check the input from the player before the program proceed with making the marks on the board.

The Player class are used to store the information for each player. It contains 3 instance variables, @name, @sign and @id.

The TicTacToe class are used to initialise the game. An empty @board are created when a TicTacToe object is created. The game starts with getting name and sign from both players, then it proceed with each player taking turns to mark their sign on the board. The coordinate input are checked before passing to the place method. The game ends when the board fulfills the win condition or reached a tie. The program then checks the @current_player and declare the results according to the @current_player.
## What I learned that are useful
1. Creating a nested array that can contains different value, using ```Array.new(n) { Array.new(n) }```
2. Transpose an array using ```array.transpose()```
