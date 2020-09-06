---  
title: eh_GJUsersFetchRequest  
author: eh-jogos  
date: 2020-09-05T10:11:41-03:00  
summary:   
---  
**Inherits:** _eh_GJBaseRequest > HTTPRequest > Node > Object_  
## Description  
 This class decribes the [Fetch api endpoint](https://gamejolt.com/game-api/doc/users/fetch)
 It's response is modeled in the custom resource of [eh_GJUsersFetchData]

 It is possible to request data for a single user with [fetch_user] or for multiple users with
 [fetch_users]. These methods return the request Error Code, so that you can check
 if for connection errors.

 Each has it's own signal with the response data, so be sure to listen for the corresponding 
 signal.

 If the request fails, the signal [eh_GJBaseRequest.gj_request_failed] will be emitted with an error dict 
 as its parameter.

## Properties Description  

