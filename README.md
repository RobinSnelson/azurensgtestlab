## Azure NSG Test Lab

### Whats the purpose of this Repo

This repo contains an ongoing project that supports testing creation and support of NSG's. it will also support development of an NSG rule management system being developed. I also have one or two NSG tools in mind to develop and would need an environment to develop againts this repo helps with that too.

At the moment the envieonment consists of 3 vnets with subnets, all of the resource subnets have an NSG attached, I simulate a gateway and bastion subnet.

I have placed resource VM's in the subnets and plan to add seperate terraform for other resources that can be added as needed. My thougts on this is to try and make the environment slightlky modular. I know the current code needs to be improved too, but I am tryuing to make its quite flat and simple to follow.

Its not currently ready I feel to fully work, but I am getting there, its a labour of love.

#### Order of deploy

run the terraform in this order youll get what I currently have.

- network
- resources
- all these can be ran together
  - hubcompute
  - resource1compute
  - servicescompute

#### Things to do

add diagram , everyone likes a diagram
add resources
make variables easier to remember
security for the resource vms

#### Updates

21/12/2022 - Tidied up the mark down file, it was bad for a public repo
