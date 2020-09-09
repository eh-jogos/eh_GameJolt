---  
title: eh_GJBaseRequest  
author: eh-jogos  
date: 2020-09-07T20:45:11-03:00  
summary:   
---  
**Inherits:** _HTTPRequest > Node > Object_  
**Inherited by:** _eh_GJUsersAuthRequest, eh_GJUsersFetchRequest_  

## Description  
 This Class is not to be used directly, rather it is the base class for all of GameJolt's 
 Endpoint Requests. This will contain the base to build urls and manage responses

## Properties Description  

- ### **int** test_int  
| | |  
| - |:-:|  
| _Default_ | ` 1 ` |  

 Test variable to test doc hugo export
  
---------
- ### **String** game_id  
| | |  
| - |:-:|  
| _Default_ | ` "joaozinho" ` |  
| _Getter_ | get_game_id |  

 The game_id in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project Settings
 after enabling the plugin.
  
---------
- ### **String** private_key  
| | |  
| - |:-:|  
| _Setter_ | set_private_key |  

 The game's private_key in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project 
 Settings after enabling the plugin.
  
---------
- ### **String** username  
 The player's username. Will be aquired automatically if the game was downloaded through GameJolt's
 client. Otherwise, will be set by a login screen, but player only needs to login once.
  
---------
- ### **String** user_token  
 The player's game_token. Will be aquired automatically if the game was downloaded through 
 GameJolt's client. Otherwise, will be set by a login screen, but player only needs to login once.
  
---------
