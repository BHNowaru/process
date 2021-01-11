# Todo

---

* Bridge ComputerCraft with OpenComputers
  * Requires:
    * Pimped out relay
    * Pimped out OpenComputer
    * Pimped out ComputerCraft Computer
    * Ender Modem
    * An adapter
  * Process:
    * ComputerCraft can connect to Relays and send/recieve messages to and from them
    * OpenComputers can also connect to Relays and send/recieve messages to and from them
    * Knowing this, I can create a link between them.
  * Test:
    * Create a generic link between the two blocks. ComputerCraft should be able to
    take events from OpenComputers, and OpenComputers should be able to take events
    from ComputerCraft.
  * In-the-flesh use:
    For every computer that connects to the ComputerCraft "server", assign them a UUID through OpenComputers.
    This should allow us to ratelimit people who make too many requests to the server within a givin time period (40s.)
  * Why?:
    ComputerCraft is required over OpenComputers to handle requests. It's the middleman because
    OpenComputers cannot handle cross-dimensional requests, let alone requests that are further
    that about 40 blocks away without using a server or a linking card, which is less than ideal
    since I would have to make a new computer for each requesting computer.

    Overall, it would be a better idea to simply use OpenComputers' Ender Modem and forward it's
    complex requests over to the OpenComputers, not only are they cheaper, but.. they're.. cheaper.
    Lol.

* Make `process` it's own command line program
  * Requires:
    * A pimped out OpenComputer.
  * Process:
    * Using a While loop should hold up the command line until the user manually terminates the script or types "exit."
    * Usage of `io.read` can allow the user to type in input.
    * Alongside of it's own command program, it can be excecuted standalone, however, this can only allow the "request" function.
  * Test:
    * Make a mini adventure game. Not too difficult--in theory, at least.
  * In-the-flesh use:
    * As if it were an actual command line program, users will be able to type a command such as "`process gold_ore 64 pulverize smelt`",
    which will execute through Applied Energistics import/export buses. However, due to there being no security with these
    appliances, people will be able to siphon materials from other people.
  * Why?:
    Programs running in the background without a method to terminate is icky. No thank you.

---

## Why write all of this?

A good "why" would be so I don't forget what I'm supposed to be doing, and with a documented end goal, I won't forget what I'm doing.

