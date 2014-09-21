###Domain model:

Design a vending machine in code. The vending machine, once a product is selected and the appropriate amount of money is inserted, should return that product. It should also return change if too much money is provided or ask for more money if there is not enough. The machine should take an initial load of products and change with denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2. There should also be a way of reloading both products and change at a later point. The machine needs to keep track of the products and money that it contains.

###OOD structure:

* The Product object has the following attributes: a name, a price, a code that can be used to select it when using the vending machine, and a quantity, which represents the number of objects of that kind left in the machine.

* A Change object has a type attribute, which stands for the name of the currency (as per the Domain Model), a value attribute, which represents the numeric value of the coin (e.g. £1 has value 100), and a quantity value, that indicates the number of coins of that type present in the machine.

*The User object has a credit attribute, which increases as soon as coins are inserted in the VendingMachine, until the price of the object is reached and it is sold.

* The ChangeHandler is constructed as a Module. This is done to increase the extensibility of the application to other similar cases, since it provides all the methods related to the computation of the change. It contains the modules used to handle money, validate it and compute the change.

* The ProductHandler is constructed as a Module as well (for the same reason of the ChangeHandler), containing all the behaviors that control a Product, including validations, loading in VendingMachine and updating quantity at each sale.

* The Error class uses inheritance to formulate custom error behaviors, such as the input of a wrong product code, wrong change type or unavailability of a certain coin type.

* The VendingMachine contains all the actions related to the interface with the User. It ensures a correct user experience, handling wrong input with exceptions and performing the business logic.

###Application interface screenshot:

![VENDINGMACHINE](https://dl.dropboxusercontent.com/u/9315601/vending.png)

###Technologies used:

* Ruby, Rspec

###Instructions to run both tests and terminal interface application (Ruby and Rspec gem must be installed on the machine):

* To test, enter from command line:
```bash
git clone git@github.com:federicomaffei/vending-machine.git
cd vending-machine
rspec
```

* To run the application on the provided files, enter from command line:
```bash
git clone git@github.com:federicomaffei/vending-machine.git
ruby vendingmachine-rubyapp.rb 
rspec
```

###Code Climate evaluation:

[![Code Climate](https://codeclimate.com/github/federicomaffei/vending-machine/badges/gpa.svg)](https://codeclimate.com/github/federicomaffei/vending-machine)