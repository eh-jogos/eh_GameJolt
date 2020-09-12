---  
title: eh_GJBaseRequest  
author: eh-jogos  
date: 2020-09-12T08:29:27-03:00  
summary:   
---  
**Inherits:** _[HTTPRequest](https://docs.godotengine.org/en/stable/classes/class_httprequest.html) > [Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
**Inherited by:** _[eh_GJUsersAuthRequest]({{< ref "/reference/user/requests/eh_gjusersauthrequest" >}}), [eh_GJUsersFetchRequest]({{< ref "/reference/user/requests/eh_gjusersfetchrequest" >}})_  

## Description  
 This Class is not to be used directly, rather it is the base class for all of GameJolt's 
 Endpoint Requests. This will contain the base to build urls and manage responses

## Properties Description  

- ### _int_ test_int  
| | |  
| - |:-:|  
| _Default_ | ` 1 ` |  

 Test variable to test doc hugo export
  
---------
- ### _String_ game_id  
| | |  
| - |:-:|  
| _Default_ | ` "joaozinho" ` |  
| _Getter_ | get_game_id |  

 The game_id in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project Settings
 after enabling the plugin.
  
---------
- ### _String_ private_key  
| | |  
| - |:-:|  
| _Setter_ | set_private_key |  

 The game's private_key in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project 
 Settings after enabling the plugin.
  
---------
- ### _String_ username  
 The player's username. Will be aquired automatically if the game was downloaded through GameJolt's
 client. Otherwise, will be set by a login screen, but player only needs to login once.
  
---------
- ### _String_ user_token  
 The player's game_token. Will be aquired automatically if the game was downloaded through 
 GameJolt's client. Otherwise, will be set by a login screen, but player only needs to login once.
  
---------
