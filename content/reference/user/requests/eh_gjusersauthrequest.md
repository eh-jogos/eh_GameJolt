---  
title: eh_GJUsersAuthRequest  
author: eh-jogos  
date: 2020-09-28T09:02:35-03:00  
weight: 1  
---  
**Inherits:** _[eh_GJBaseRequest]({{< ref "/reference/eh_gjbaserequest" >}}) > [HTTPRequest](https://docs.godotengine.org/en/stable/classes/class_httprequest.html) > [Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 This class decribes the [Auth api endpoint](https://gamejolt.com/game-api/doc/users/auth).
 It's response is modeled in the custom resource of [eh_GJUsersAuthData]({{< ref "/reference/user/responsedata/eh_gjusersauthdata" >}}).

 It's a simple class to help with login in the user, but should be the first thing the 
 game does or check for. 

 If the request fails, the signal [gj_request_failed]({{< ref "/reference/eh_gjbaserequest#gj_request_failed" >}}) will be emitted with an 
 error dict as its parameter.
  
  
## Methods 
  
| return type | method signature |  
| ----------- | ---------------- |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | **[auth_user_credentials]({{< ref "/reference/user/requests/eh_gjusersauthrequest#auth_user_credentials" >}})**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_user_token) |  
  
## Signals  
  
- **gj_auth_data_received**(eh_gj_users_auth_data) 
  
 Signal sent with Auth Data response. Sends the [eh_GJUsersAuthData]({{< ref "/reference/user/responsedata/eh_gjusersauthdata" >}}) resource as paremeter.
  
---------
  
## Constants  
  
- **URL_ENDPOINT = /users/auth/** --- Address for this endpoint. 
## Method Descriptions  
  
### auth_user_credentials 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **auth_user_credentials**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_user_token) 
  
 Builds url and send request to the auth Endpoint. Return an int which is the request error code.
  
---------
