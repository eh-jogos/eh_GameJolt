+++
title = "eh_GJUsersAuthRequest"
description = "This class decribes the [Auth api endpoint](https://gamejolt.com/game-api/doc/users/auth).\nIt's response is modeled in the custom resource of [eh_GJUsersAuthData]\n\nIt's a simple class to help with login in the user, but should be the first thing the\ngame does or check for.\n\nIf the request fails, the signal [eh_GJBaseRequest.gj_request_failed] will be emitted with an\nerror dict as its parameter.\ncategory: HTTPRequests"
author = ""
date = "2020-09-01"
+++

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

**Extends:** [eh_GJBaseRequest](../eh_GJBaseRequest) < [HTTPRequest](../HTTPRequest)

## Description

This class decribes the [Auth api endpoint](https://gamejolt.com/game-api/doc/users/auth).
It's response is modeled in the custom resource of [eh_GJUsersAuthData]

It's a simple class to help with login in the user, but should be the first thing the
game does or check for.

If the request fails, the signal [eh_GJBaseRequest.gj_request_failed] will be emitted with an
error dict as its parameter.
category: HTTPRequests

## Method Descriptions

### auth\_user\_credentials

```gdscript
func auth_user_credentials(p_username: String, p_user_token: String) -> int
```

Builds url and send request to the auth Endpoint. Return an int which is the request error code.

## Signals

- signal gj_auth_data_received(eh_gj_users_auth_data): Signal sent with Auth Data response. Sends the [eh_GJUsersAuthData] resource as paremeter.
