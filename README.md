# Ticket iOS Library #

### What does it do? ###

Ticket enables your app to easily retrieve the entries on Ticket Server.

### Requirements ###

- Ticket Server Credential Information (Username, Password).
- Ticket Server Endpoint.

# Integration #

The following sections will show you how to use the Ticket iOS Library to setup the library.

* Installation
* Setup
* Ticket Retrieval 

### Installation ###

CocoaPods is a dependency manager, which automates and simplifies the process of using 3rd-party libraries like Engage SDK in your projects. You can install it with the following command:

```
gem install cocoapods.
```


**Podfile**

To integrate Ticket iOS into your Xcode project using CocoaPods, specify it in your Podfile: 

```
pod 'TicketService'
```

# Setup #

```
let ticketService = TicketServiceBuilder().build(
            username: "username",
            password: "password",
            baseURL: "https://yourbaseURL.com"
        )
```

# Ticket Retrieval #

To retrieve tickets simply call the method 

```
let dataTask = ticketService.fetchTickets { response in
    print(response.error)
    print(response.tickets)
}
```
