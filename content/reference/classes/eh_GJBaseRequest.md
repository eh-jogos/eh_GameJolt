+++
title = "eh_GJBaseRequest"
description = "This Class is not to be used directly, rather it is the base class for all of GameJolt's\nEndpoint Requests. This will contain the base to build urls and manage responses"
author = ""
date = "2020-09-01"
+++

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

**Extends:** [HTTPRequest](../HTTPRequest)

## Description

This Class is not to be used directly, rather it is the base class for all of GameJolt's
Endpoint Requests. This will contain the base to build urls and manage responses

## Property Descriptions

### game\_id

```gdscript
var game_id: String
```

The game_id in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project Settings
after enabling the plugin.

### private\_key

```gdscript
var private_key: String
```

The game's private_key in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project
Settings after enabling the plugin.

### username

```gdscript
var username: String
```

The player's username. Will be aquired automatically if the game was downloaded through GameJolt's
client. Otherwise, will be set by a login screen, but player only needs to login once.

### user\_token

```gdscript
var user_token: String
```

The player's game_token. Will be aquired automatically if the game was downloaded through
GameJolt's client. Otherwise, will be set by a login screen, but player only needs to login once.

## Signals

- signal gj_request_failed(error_dict): Signal sent when requests fail. Sends an dictionary with details about the error.
