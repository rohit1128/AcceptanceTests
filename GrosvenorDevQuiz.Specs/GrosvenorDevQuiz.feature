Feature: GrosvenorDevQuiz
	In order to prove that the cooking ticket
	console application works the following 
	acceptance tests must pass 

Scenario: Given an order is made with valid dish selections the order should process correctly without error
	Given the following input
	| Input         |
	| morning,1,2,3 |
	When the server takes the order 
	Then the output should be the following
	| Output              |
	| eggs, toast, coffee |

Scenario: Given an order is made where the dish selections are made a in random order, the output should still be in the correct order of entree,side, drink and dessert
	Given the following input
	| Input           |
	| morning,2,1,3 |
	When the server takes the order 
	Then the output is in the following particular order
	| Output            |
	| eggs, toast, coffee |

Scenario: Given an order for dessert in the morning,  the output should error out
	Given the following input
	| Input           |
	| morning,1,2,3,4 |
	When the server takes the order 
	Then the output should be the following
	| Output                     |
	| eggs, toast, coffee, error |


Scenario: Given an order that only contains and invalid dish selection should give an error
	Given the following input
	| Input      |
	| morning, 5 |
	When the server takes the order 
	Then the order should give an error
	And the output should be the following
	| Output |
	| error  |

Scenario: Given an order is made that contains both valid and invalid dish selections the order should process selections correctly up to the error
	Given the following input
	| Input           |
	| night, 1,2,15,3 |
	When the server takes the order 
	Then the order should give an error
	And the following should be the output
	|Output|
	|steak, potato, error|


Scenario: Given any order at a particular time of day, only dishes that can be served at that time
	Given the following input
	| Input       |
	| night,1,2,3 |
	When the server takes the order 
	Then the output should not contain any breakfast items 
	And the following should be the output
	| Output            |
	| steak, potato, wine | 


Scenario: Given an order containing case insentive input, the order should process without error
	Given the following input
	| Input         |
	| Morning,1,3,2 |
	When the server takes the order
	Then the output should not contain an error
	And the following should be the output
	|Output|
	|eggs, toast, coffee|


Scenario: Given multiple orders for a dish that can be ordered at most one time, then an error should be output
	Given the following input
	| Input           |
	| night,1,1,2,3,5 |
	When the server takes the order
	Then the output should contain an error
	And the following should be the output
	| Output       |
	| steak, error |
	 
	 

Scenario: Given an order for multiple cups of coffee in the morning, the order should process without error
	Given the following input
	| Input           |
	| morning,1,2,3,3,3 |
	When the server takes the order
	Then the output should not contain an error
	And the output should be the following
	| Output                  |
	| eggs, toast, coffee(x3) |

	
Scenario: Given an order multiple orders of potatoes at night, the order should process without error
	Given the following input
	| Input         |
	| night,1,2,2,4 |
	When the server takes the order
	Then the output should not contain an error
	And the output should be the following
	| Output                  |
	| steak, potato(x2), cake |

Scenario: Given an order delimited by another character other than a comma, the order should contain an error
	Given the following input
	| Input       |
	| night,1;2 |
	When the server takes the order
	Then the output should contain an error
	And the output should be the following
	| Output |
	| error  |
	
Scenario: Given an order is input that uses another time of day besides morning or night, the order should not output
	Given the following input
	| Input       |
	| evening,1,2 |
	When the server takes the order
	Then the output should be the following
	| Output |
	|        |