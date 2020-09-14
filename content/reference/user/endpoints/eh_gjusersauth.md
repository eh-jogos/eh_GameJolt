---  
title: eh_GJUsersAuth  
author: eh-jogos  
date: 2020-09-14T07:32:33-03:00  
summary:   
---  
**Inherits:** _[Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 Class to Manage Requests to the `users/auth` endpoint.
  
## Properties 
  
| type | property | default value |  
| ---- | -------- | ------------- |  
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | [is_logged_in]({{< ref "/reference/user/endpoints/eh_gjusersauth#is_logged_in" >}}) | Null |  
  
## Methods 
  
| return type | method signature |  
| ----------- | ---------------- |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | **[get_player_username]({{< ref "/reference/user/endpoints/eh_gjusersauth#get_player_username" >}})**() |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | **[get_player_user_token]({{< ref "/reference/user/endpoints/eh_gjusersauth#get_player_user_token" >}})**() |  
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | **[has_player_credentials]({{< ref "/reference/user/endpoints/eh_gjusersauth#has_player_credentials" >}})**() |  
| [null](https://docs.godotengine.org/en/stable/classes/class_null.html) | **[self_login]({{< ref "/reference/user/endpoints/eh_gjusersauth#self_login" >}})**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_user_token) |  
| [null](https://docs.godotengine.org/en/stable/classes/class_null.html) | **[request]({{< ref "/reference/user/endpoints/eh_gjusersauth#request" >}})**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_user_token) |  
  
## Properties Descriptions  
  
### is_logged_in 
- _[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)_ **is_logged_in**  
  
 public variables - order: export > normal var > onready 
  
---------
## Method Descriptions  
  
### get_player_username 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **get_player_username**() 
  
## Public Methods ------------------------
  
---------
### get_player_user_token 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **get_player_user_token**() 
  
  
---------
### has_player_credentials 
- _[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)_ **has_player_credentials**() 
  
  
---------
### self_login 
- _void_ **self_login**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_user_token) 
  
  
---------
### request 
- _void_ **request**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_user_token) 
  
  
---------