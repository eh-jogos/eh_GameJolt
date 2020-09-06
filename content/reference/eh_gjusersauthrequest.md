---  
title: eh_GJUsersAuthRequest  
author: eh-jogos  
date: 2020-09-05T10:11:41-03:00  
summary:   
---  
**Inherits:** _eh_GJBaseRequest > HTTPRequest > Node > Object_  
## Description  
 This class decribes the [Auth api endpoint](https://gamejolt.com/game-api/doc/users/auth).
 It's response is modeled in the custom resource of [eh_GJUsersAuthData]

 It's a simple class to help with login in the user, but should be the first thing the 
 game does or check for. 

 If the request fails, the signal [eh_GJBaseRequest.gj_request_failed] will be emitted with an 
 error dict as its parameter.
 category: HTTPRequests

## Properties Description  

