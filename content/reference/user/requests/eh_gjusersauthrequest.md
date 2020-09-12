---  
title: eh_GJUsersAuthRequest  
author: eh-jogos  
date: 2020-09-12T08:29:27-03:00  
summary:   
---  
**Inherits:** _[eh_GJBaseRequest]({{< ref "/reference/eh_gjbaserequest" >}}) > [HTTPRequest](https://docs.godotengine.org/en/stable/classes/class_httprequest.html) > [Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 This class decribes the [Auth api endpoint](https://gamejolt.com/game-api/doc/users/auth).
 It's response is modeled in the custom resource of [eh_GJUsersAuthData]({{< ref "/reference/user/responsedata/eh_gjusersauthdata" >}})

 It's a simple class to help with login in the user, but should be the first thing the 
 game does or check for. 

 If the request fails, the signal [gj_request_failed]({{< ref "/reference/eh_gjbaserequest#gj_request_failed" >}}) will be emitted with an 
 error dict as its parameter.

## Properties Description  

