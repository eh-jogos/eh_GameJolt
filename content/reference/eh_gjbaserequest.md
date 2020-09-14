---  
title: eh_GJBaseRequest  
author: eh-jogos  
date: 2020-09-14T07:32:33-03:00  
summary:   
---  
**Inherits:** _[HTTPRequest](https://docs.godotengine.org/en/stable/classes/class_httprequest.html) > [Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
**Inherited by:** _[eh_GJUsersAuthRequest]({{< ref "/reference/user/requests/eh_gjusersauthrequest" >}}), [eh_GJUsersFetchRequest]({{< ref "/reference/user/requests/eh_gjusersfetchrequest" >}})_  
  
## Description  
 This Class is not to be used directly, rather it is the base class for all of GameJolt's 
 Endpoint Requests. This will contain the base to build urls and manage responses
  
## Properties 
  
| type | property | default value |  
| ---- | -------- | ------------- |  
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [test_int]({{< ref "/reference/eh_gjbaserequest#test_int" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [game_id]({{< ref "/reference/eh_gjbaserequest#game_id" >}}) | joaozinho |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [private_key]({{< ref "/reference/eh_gjbaserequest#private_key" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [username]({{< ref "/reference/eh_gjbaserequest#username" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [user_token]({{< ref "/reference/eh_gjbaserequest#user_token" >}}) | Null |  
  
## Methods 
  
| return type | method signature |  
| ----------- | ---------------- |  
| [null](https://docs.godotengine.org/en/stable/classes/class_null.html) | **[set_private_key]({{< ref "/reference/eh_gjbaserequest#set_private_key" >}})**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) value) |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | **[get_game_id]({{< ref "/reference/eh_gjbaserequest#get_game_id" >}})**() |  
  
## Properties Descriptions  
  
### test_int 
- _[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)_ **test_int**  
  
 Test variable to test doc hugo export
  
---------
### game_id 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **game_id**  
  
| | |  
| - |:-:|  
| _Default_ | ` "joaozinho" ` |  
| _Getter_ | get_game_id |  

 The game_id in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project Settings
 after enabling the plugin.
  
---------
### private_key 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **private_key**  
  
| | |  
| - |:-:|  
| _Setter_ | set_private_key |  

 The game's private_key in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project 
 Settings after enabling the plugin.
  
---------
### username 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **username**  
  
 The player's username. Will be aquired automatically if the game was downloaded through GameJolt's
 client. Otherwise, will be set by a login screen, but player only needs to login once.
  
---------
### user_token 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **user_token**  
  
 The player's game_token. Will be aquired automatically if the game was downloaded through 
 GameJolt's client. Otherwise, will be set by a login screen, but player only needs to login once.
  
---------
## Method Descriptions  
  
### set_private_key 
- _void_ **set_private_key**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) value) 
  
  
---------
### get_game_id 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **get_game_id**() 
  
  
---------
