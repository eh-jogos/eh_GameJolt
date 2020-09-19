---  
title: eh_GJBaseRequest  
author: eh-jogos  
date: 2020-09-18T08:00:15-03:00  
summary:   
---  
**Inherits:** _[HTTPRequest](https://docs.godotengine.org/en/stable/classes/class_httprequest.html) > [Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
**Inherited by:** _[eh_GJUsersAuthRequest]({{< ref "/reference/user/requests/eh_gjusersauthrequest" >}}), [eh_GJUsersFetchRequest]({{< ref "/reference/user/requests/eh_gjusersfetchrequest" >}})_  
  
## Description  
 This Class is not to be used directly, rather it is the base class for all of GameJolt's 
 Endpoint Requests. This contains the base to build urls and manage responses
  
## Properties 
  
| type | property | default value |  
| ---- | -------- | ------------- |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [game_id]({{< ref "/reference/eh_gjbaserequest#game_id" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [private_key]({{< ref "/reference/eh_gjbaserequest#private_key" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [username]({{< ref "/reference/eh_gjbaserequest#username" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [user_token]({{< ref "/reference/eh_gjbaserequest#user_token" >}}) | Null |  
  
## Signals  
  
- **gj_request_failed**(error_dict) 
  
 Signal sent when requests fail. Sends an dictionary with details about the error.
  
---------
  
## Constants  
  
- **GAME_CREDENTIALS = res://addons/eh_jogos_game_jolt_api/gj_game_credentials.res** --- Path where game credentials are saved as a binary file custom resource. 
- **API_GAME_ID_PARAMETER = ?game_id=** --- Game Parameter string that will be added to all request urls. 
- **API_VERSION = v1_2** --- API version to use. Will be added to base url to build request urls. 
- **API_URL = https://api.gamejolt.com/api/game/** --- Base url for api calls. 
- **USER_CREDENTIALS_PATH = res://addons/eh_jogos_game_jolt_api/gj_user_credentials.res** --- Path where user credentials are saved as a binary file custom resource. 
  
## Properties Descriptions  
  
### game_id 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **game_id**  
  
 The game_id in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project Settings
 after enabling the plugin.
  
---------
### private_key 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **private_key**  
  
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
