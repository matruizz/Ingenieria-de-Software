!classDefinition: #CashierTest category: #'IRobot-Enunciado'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!CashierTest methodsFor: 'receiving from empty trailer' stamp: 'merb 6/17/2025 13:02:05'!
test01ShouldNotAcceptEmptyTrailerFromNormalWorkingRobot

	| aRobot aTrailer aCashier |
	
	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aCashier := Cashier new.

	self
		should: [ 
			aCashier receiveOrderFrom: aRobot 
		]
		raise: Error
		withMessageText: Cashier trailerIsEmptyErrorDescription.
! !

!CashierTest methodsFor: 'receiving from empty trailer' stamp: 'merb 6/17/2025 13:02:05'!
test02ShouldNotAcceptEmptyTrailerFromMechanicalFailureRobot

	| aRobot aTrailer aCashier |
	
	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aCashier := Cashier new.

	self
		should: [ 
			aRobot withMechanicalFailure.
			aCashier receiveOrderFrom: aRobot 
		]
		raise: Error
		withMessageText: Cashier trailerIsEmptyErrorDescription.
! !


!CashierTest methodsFor: 'receiving from sensors failure robot' stamp: 'merb 6/17/2025 13:02:05'!
test03ShouldNotAcceptSensorsFailureRobot

	| aRobot aTrailer aCashier |
	
	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aCashier := Cashier new.

	self
		should: [ 
			aRobot withSensorsFailure.
			aCashier receiveOrderFrom: aRobot ]
		raise: Error
		withMessageText: Cashier robotSensorsFailureErrorDescription.
! !


!CashierTest methodsFor: 'receiving from mechanical failure robot' stamp: 'merb 6/17/2025 13:02:05'!
test04ShouldChangeRobotStatusToOutOfOrderWhenMechanicalFailureRobot

	| aRobot aTrailer aCashier |
	
	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aCashier := Cashier new.

	self
		should: [ 
			aRobot take: (ProductA with: 1  and: 1).
			aRobot withMechanicalFailure.
			
			aCashier receiveOrderFrom: aRobot.
			
			aRobot take: (ProductA with: 1 and: 1) ]
		raise: Error
		withMessageText: Robot outOfOrderErrorDescription.

! !


!classDefinition: #ProductTest category: #'IRobot-Enunciado'!
TestCase subclass: #ProductTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 19:37:46'!
test01CanNotCreateProductWithCeroOrLessWeight

	self
		should: [ Product with: 0  and: 100 ]
		raise: Error
		withMessageText: Product invalidWeightErrorDescription 
! !

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 19:37:51'!
test02CanNotCreateProductWithCeroOrLessHeight

	self
		should: [ Product with: 100  and: 0 ]
		raise: Error
		withMessageText: Product invalidHeightErrorDescription 
! !

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:54:48'!
test03CanNotCreateProductWithNoIntegerWeight

	self
		should: [ Product with: 1.5  and: 100 ]
		raise: Error
		withMessageText: Product weightMustBeIntegerErrorDescription 

! !

!ProductTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:55:14'!
test04CanNotCreateProductWithNoIntegerHeight

	self
		should: [ Product with: 100  and: 1.5 ]
		raise: Error
		withMessageText: Product heightMustBeIntegerErrorDescription 

! !


!classDefinition: #RobotTest category: #'IRobot-Enunciado'!
TestCase subclass: #RobotTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!RobotTest methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 11:29:44'!
test01ShouldReceiveAnEmptyTrailer

	| aTrailer |

	aTrailer := Trailer with: 20 and: 100.
	aTrailer carry: (ProductA with: 1  and: 1).
	
	self
		should: [ Robot with: aTrailer ]
		raise: Error
		withMessageText: Robot notEmptyTrailerErrorDescription! !


!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 11:04:57'!
test02ShouldTakeProductsWhenWorkingNormal

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: 1 equals: aTrailer totalProductsAmount! !

!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 11:07:49'!
test03ShouldTakeProductsWhenWorkingWithSensorsFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot withSensorsFailure.
	
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: 1 equals: aTrailer totalProductsAmount! !

!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 11:08:34'!
test04ShouldTakeProductsWhenWorkingWithMechanicalFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot withMechanicalFailure.
	
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: 1 equals: aTrailer totalProductsAmount! !

!RobotTest methodsFor: 'taking products' stamp: 'FRT 5/4/2020 18:26:53'!
test05ShouldNotTakeProductsWhenOutOfOrder

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot outOfOrder.
	
	self
		should: [ aRobot take: (ProductA with: 1  and: 1) ]
		raise: Error
		withMessageText: Robot outOfOrderErrorDescription.
	
	self assert: 0 equals: aTrailer totalProductsAmount! !


!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 12:46:40'!
test06CanCloseOrderWhenWorkingNormal

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).
	
	self assert: (aRobot closeOrderUsing: Cashier new)! !

!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 11:28:16'!
test07CanNotCloseOrderWhenWorkingWithSensorsFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).
	
	aRobot withSensorsFailure.

	self
		should: [ aRobot closeOrderUsing: Cashier new ]
		raise: Error
		withMessageText: Cashier robotSensorsFailureErrorDescription.
 
! !

!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 12:47:10'!
test08CanCloseOrderWhenWorkingWithMechanicalFailures

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).

	aRobot withMechanicalFailure.	
		
	self assert: (aRobot closeOrderUsing: Cashier new).! !

!RobotTest methodsFor: 'closing order' stamp: 'FRT 5/4/2020 18:48:41'!
test09CanNotCloseOrderWhenOutOfOrder

	| aTrailer aRobot |

	aTrailer := Trailer with: 20 and: 100.
	aRobot := Robot with: aTrailer.
	aRobot take: (ProductA with: 1  and: 1).
	
	aRobot outOfOrder.

	self
		should: [ aRobot closeOrderUsing: Cashier new ]
		raise: Error
		withMessageText: Robot outOfOrderErrorDescription.
 
! !


!classDefinition: #TrailerTest category: #'IRobot-Enunciado'!
TestCase subclass: #TrailerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/4/2020 17:29:39'!
test01CanNotCreateTrailerWithCeroOrLessMaxWeight

	self
		should: [ Trailer with: 0  and: 100 ]
		raise: Error
		withMessageText: Trailer invalidWeightCapacityErrorDescription 
! !

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/4/2020 17:30:47'!
test02CanNotCreateTrailerWithCeroOrLessMaxHeight

	self
		should: [ Trailer with: 1  and: 0 ]
		raise: Error
		withMessageText: Trailer invalidHeightCapacityErrorDescription 
! !

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/4/2020 17:41:04'!
test03CanNotCreateTrailerWithNoIntegerMaxWeight

	self
		should: [ Trailer with: 1.5  and: 100 ]
		raise: Error
		withMessageText: Trailer weightCapacityMustBeIntegerErrorDescription 
! !

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/4/2020 17:41:29'!
test04CanNotCreateTrailerWithNoIntegerMaxHeight

	self
		should: [ Trailer with: 100  and: 1.5 ]
		raise: Error
		withMessageText: Trailer heightCapacityMustBeIntegerErrorDescription 
! !

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/4/2020 17:43:36'!
test05ShouldRejectProductAIfWeightExceeded

	| aTrailer |
	aTrailer := Trailer with: 20  and: 100.
	
	self
		should: [ aTrailer carry: (ProductA with: 21 and: 1) ]
		raise: Error
		withMessageText: Trailer maxWeightExceededErrorDescription.
		
	self assert: aTrailer isEmpty.! !

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/4/2020 17:43:28'!
test06ShouldRejectProductBIfWeightExceeded

	| aTrailer |
	aTrailer := Trailer with: 20  and: 100.
	
	self
		should: [ aTrailer carry: (ProductB with: 21 and: 1) ]
		raise: Error
		withMessageText: Trailer maxWeightExceededErrorDescription.
		
	self assert: aTrailer isEmpty.! !

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/5/2020 11:27:50'!
test07ShouldAcceptProductsIfWeightUnderMaxWeightCapacity

	| aTrailer |
	aTrailer := Trailer with: 11  and: 100.
	
	aTrailer carry: (ProductA with: 1 and: 1).
	aTrailer carry: (ProductA with: 2 and: 1).
	aTrailer carry: (ProductB with: 3 and: 1).
	aTrailer carry: (ProductB with: 4 and: 1).
		
	self assert: aTrailer totalProductsAmount equals: 4.
	self assert: aTrailer totalProductsWeight equals: 10.! !

!TrailerTest methodsFor: 'weight capacity' stamp: 'FRT 5/5/2020 11:27:57'!
test08ShouldAcceptProductsIfWeightEqualsMaxWeightCapacity

	| aTrailer |
	aTrailer := Trailer with: 11  and: 100.
	
	aTrailer carry: (ProductA with: 1 and: 1).
	aTrailer carry: (ProductA with: 2 and: 1).
	aTrailer carry: (ProductB with: 3 and: 1).
	aTrailer carry: (ProductB with: 4 and: 1).
	aTrailer carry: (ProductB with: 1 and: 1).
	
	self assert: aTrailer totalProductsAmount equals: 5.
	self assert: aTrailer totalProductsWeight equals: 11.! !


!TrailerTest methodsFor: 'height capacity' stamp: 'FRT 5/5/2020 11:28:03'!
test09ShouldAcceptProductAIgnoringMaxTotalHeightOfBProducts

	| aTrailer heightCapacity exceededHeightCapacity halfExceededHeightCapacity |

	heightCapacity := 100.
	aTrailer := Trailer with: 20  and: heightCapacity.
	
	exceededHeightCapacity := heightCapacity + 2.
	halfExceededHeightCapacity := exceededHeightCapacity / 2.
	
	aTrailer carry: (ProductA with: 10 and: halfExceededHeightCapacity).
	aTrailer carry: (ProductA with: 10 and: halfExceededHeightCapacity).
	
	self assert: aTrailer totalProductsAmount equals: 2.
	self assert: aTrailer totalProductsHeight equals: 0.
	! !

!TrailerTest methodsFor: 'height capacity' stamp: 'FRT 5/5/2020 11:28:07'!
test10ShouldIgnoreAProductsInMaxTotalHeightOfBProducts

	| aTrailer heightCapacity exceededHeightCapacity halfExceededHeightCapacity |

	heightCapacity := 100.
	aTrailer := Trailer with: 20  and: heightCapacity.
	
	exceededHeightCapacity := heightCapacity + 2.
	halfExceededHeightCapacity := exceededHeightCapacity / 2.
	
	aTrailer carry: (ProductA with: 10 and: halfExceededHeightCapacity).
	aTrailer carry: (ProductB with: 10 and: halfExceededHeightCapacity).
	
	self assert: aTrailer totalProductsAmount equals: 2.
	self assert: aTrailer totalProductsHeight equals: halfExceededHeightCapacity.
	! !

!TrailerTest methodsFor: 'height capacity' stamp: 'FRT 5/5/2020 11:28:16'!
test11ShouldRejectProductBExceedingMaxTotalHeightOfBProducts

	| aTrailer heightCapacity exceededHeightCapacity halfExceededHeightCapacity |

	heightCapacity := 100.
	aTrailer := Trailer with: 20  and: heightCapacity.
	
	exceededHeightCapacity := heightCapacity + 2.
	halfExceededHeightCapacity := exceededHeightCapacity / 2.
	
	aTrailer carry: (ProductB with: 10 and: halfExceededHeightCapacity).

	self 
		should: [aTrailer carry: (ProductB with: 10 and: halfExceededHeightCapacity)] 
		raise: Error
		withMessageText: Trailer maxHeightExceededErrorDescription.
	
	self assert: aTrailer totalProductsAmount equals: 1.
	self assert: aTrailer totalProductsHeight equals: halfExceededHeightCapacity.
	! !


!classDefinition: #Cashier category: #'IRobot-Enunciado'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Cashier methodsFor: 'closing buy order' stamp: 'merb 6/18/2025 01:28:12'!
receiveOrderFrom: aRobot
	^aRobot status beforeReceivingCheckStatusOf: aRobot thenDeliverTo: self.

	"aRobot status = #WorkingNormal ifTrue: [ | aTrailer | 
		aTrailer := aRobot trailer.	
		self assertTrailerNotEmpty: aTrailer."
		
		"Comentario: en este punto el cashier realizaría el checkout de los productos."
		
		"^ true
	].

	aRobot status = #SensorsFailure ifTrue: [ 	
		aRobot outOfOrder.
		self signalRobotSensorsFailure
	].
	
	aRobot status = #MechanicalFailure ifTrue: [ | aTrailer |
		aRobot outOfOrder.
		
		aTrailer := aRobot trailer.	
		self assertTrailerNotEmpty: aTrailer."
		
		"Comentario: en este punto el cashier realizaría el checkout de los productos."

		"^ true
	]."
! !

!Cashier methodsFor: 'closing buy order' stamp: 'merb 6/18/2025 00:47:05'!
receiveOrderFromAMecanicalFailureRobot: aRobot
	| aTrailer |
	aRobot outOfOrder.
		
	aTrailer := aRobot trailer.	
	self assertTrailerNotEmpty: aTrailer.

	"Comentario: en este punto el cashier realizaría el checkout de los productos."

	^true.! !

!Cashier methodsFor: 'closing buy order' stamp: 'merb 6/18/2025 00:46:11'!
receiveOrderFromASensorsFailureRobot: aRobot
	aRobot outOfOrder.
	self signalRobotSensorsFailure.! !

!Cashier methodsFor: 'closing buy order' stamp: 'merb 6/18/2025 00:45:03'!
receiveOrderFromAWorkingNormalRobot: aRobot
	| aTrailer | 
	aTrailer := aRobot trailer.	
	self assertTrailerNotEmpty: aTrailer.
		
	"Comentario: en este punto el cashier realizaría el checkout de los productos."
		
	^ true.
! !


!Cashier methodsFor: 'assertions' stamp: 'FRT 5/4/2020 11:17:52'!
assertTrailerNotEmpty: aTrailer
	
	aTrailer isEmpty ifTrue: [self signalTrailerIsEmpty]! !

!Cashier methodsFor: 'assertions' stamp: 'FRT 5/4/2020 11:28:31'!
signalTrailerIsEmpty
	
	self error: self class trailerIsEmptyErrorDescription! !


!Cashier methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:28:03'!
signalRobotSensorsFailure
	
	self error: self class robotSensorsFailureErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'IRobot-Enunciado'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:28:03'!
robotSensorsFailureErrorDescription
	
	^ 'This robot presents sensors failures!!'! !

!Cashier class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:28:31'!
trailerIsEmptyErrorDescription
	
	^ 'This robots trailer is empty!!'! !


!classDefinition: #Product category: #'IRobot-Enunciado'!
Object subclass: #Product
	instanceVariableNames: 'weight height'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Product methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 10:39:55'!
initializeWith: aWeight and: aHeight
	
	weight := aWeight.
	height := aHeight.! !


!Product methodsFor: 'action' stamp: 'FRT 5/4/2020 10:38:22'!
carryBy: aTrailer	
	
	self subclassResponsibility! !


!Product methodsFor: 'testing' stamp: 'FRT 5/4/2020 10:39:06'!
isStackable
	
	self subclassResponsibility! !


!Product methodsFor: 'accessing' stamp: 'FRT 5/4/2020 10:43:30'!
height
	
	^ height! !

!Product methodsFor: 'accessing' stamp: 'FRT 5/4/2020 10:43:24'!
weight
	
	^ weight! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Product class' category: #'IRobot-Enunciado'!
Product class
	instanceVariableNames: ''!

!Product class methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:47:40'!
with: aWeight and: aHeight
	
	aWeight strictlyPositive ifFalse: [ self signalInvalidWeight ].
	aHeight strictlyPositive ifFalse: [ self signalInvalidHeight ].

	aWeight isInteger ifFalse: [ self signalWeightMustBeInteger ].
	aHeight isInteger ifFalse: [ self signalHeightMustBeInteger ].
	
	^ self new initializeWith: aWeight and: aHeight! !


!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:48:22'!
signalHeightMustBeInteger

	self error: self heightMustBeIntegerErrorDescription! !

!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:29:08'!
signalInvalidHeight

	self error: self invalidHeightErrorDescription! !

!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:29:18'!
signalInvalidWeight

	self error: self invalidWeightErrorDescription! !

!Product class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:48:12'!
signalWeightMustBeInteger

	self error: self weightMustBeIntegerErrorDescription! !


!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:16'!
heightMustBeIntegerErrorDescription

	^ 'Height must be integer'! !

!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:29:08'!
invalidHeightErrorDescription

	^ 'Height must be positive'! !

!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:29:18'!
invalidWeightErrorDescription

	^ 'Weight must be positive'! !

!Product class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:08'!
weightMustBeIntegerErrorDescription

	^ 'Weight must be integer'! !


!classDefinition: #ProductA category: #'IRobot-Enunciado'!
Product subclass: #ProductA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!ProductA methodsFor: 'testing' stamp: 'FRT 5/4/2020 10:41:29'!
isStackable

	^ false! !


!ProductA methodsFor: 'action' stamp: 'FRT 5/4/2020 10:41:12'!
carryBy: aTrailer

	aTrailer carryProductA: self! !


!classDefinition: #ProductB category: #'IRobot-Enunciado'!
Product subclass: #ProductB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!ProductB methodsFor: 'testing' stamp: 'FRT 5/4/2020 10:42:28'!
isStackable

	^ true! !


!ProductB methodsFor: 'action' stamp: 'FRT 5/4/2020 10:42:16'!
carryBy: aTrailer

	aTrailer carryProductB: self! !


!classDefinition: #Robot category: #'IRobot-Enunciado'!
Object subclass: #Robot
	instanceVariableNames: 'status trailer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Robot methodsFor: 'actions' stamp: 'merb 6/18/2025 01:27:19'!
closeOrderUsing: aCashier
	"
	status = #WorkingNormal ifTrue: [ ^ aCashier receiveOrder: self ].
	status = #SensorsFailure ifTrue: [ ^ aCashier receiveOrder: self ].
	status = #MechanicalFailure ifTrue: [ ^ aCashier receiveOrder: self ].
	status = #OutOfOrder ifTrue: [ ^ self class signalOutOfOrder ].
	"
	^status thisCashierReceivesOrder: aCashier.! !

!Robot methodsFor: 'actions' stamp: 'merb 6/18/2025 01:28:00'!
deliversOrderTo: aCashier
	^aCashier receiveOrderFrom: self.! !

!Robot methodsFor: 'actions' stamp: 'merb 6/17/2025 12:28:40'!
generateSignalForOutOfOrderStatus
	^ self class signalOutOfOrder.
! !

!Robot methodsFor: 'actions' stamp: 'merb 6/17/2025 12:43:24'!
putProductInTrailer: aProduct
	^ trailer carry: aProduct.! !

!Robot methodsFor: 'actions' stamp: 'merb 6/18/2025 00:25:50'!
take: aProduct
	"
	status = #WorkingNormal ifTrue: [ ^ trailer carry: aProduct ].
	status = #SensorsFailure ifTrue: [ ^ trailer carry: aProduct ].
	status = #MechanicalFailure ifTrue: [ ^ trailer carry: aProduct ].
	status = #OutOfOrder ifTrue: [ ^ self class signalOutOfOrder ].
	"
	status carryOnRobotThisProduct: aProduct.
! !


!Robot methodsFor: 'status' stamp: 'merb 6/17/2025 12:14:48'!
outOfOrder

	status := OutOfOrder createStatusForThis: self.
! !

!Robot methodsFor: 'status' stamp: 'merb 6/17/2025 12:15:00'!
withMechanicalFailure

	status := MechanicalFailure createStatusForThis: self.
! !

!Robot methodsFor: 'status' stamp: 'merb 6/17/2025 12:15:10'!
withSensorsFailure

	status := SensorsFailure createStatusForThis: self.
! !


!Robot methodsFor: 'accessing' stamp: 'FRT 5/4/2020 18:35:21'!
status

	^ status
! !

!Robot methodsFor: 'accessing' stamp: 'FRT 5/3/2020 21:27:04'!
trailer

	^ trailer
! !


!Robot methodsFor: 'initialization' stamp: 'merb 6/17/2025 12:10:05'!
initializeWith: aTrailer

	trailer := aTrailer.
	status := WorkingNormal createStatusForThis: self.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Robot class' category: #'IRobot-Enunciado'!
Robot class
	instanceVariableNames: ''!

!Robot class methodsFor: 'instance creation' stamp: 'FRT 5/3/2020 22:36:52'!
with: aTrailer

	self assertIsEmpty: aTrailer.

	^ self new initializeWith: aTrailer! !


!Robot class methodsFor: 'assertions' stamp: 'FRT 5/3/2020 22:35:35'!
assertIsEmpty: aTrailer

	^ aTrailer isEmpty ifFalse: [ self signalNotEmptyTrailer ]! !

!Robot class methodsFor: 'assertions' stamp: 'FRT 5/4/2020 11:29:32'!
signalNotEmptyTrailer

	self error: self notEmptyTrailerErrorDescription! !

!Robot class methodsFor: 'assertions' stamp: 'FRT 5/4/2020 18:26:04'!
signalOutOfOrder
	
	self error: self outOfOrderErrorDescription! !


!Robot class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:29:32'!
notEmptyTrailerErrorDescription

	^ 'The robot was assigned a non empty trailer'! !

!Robot class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 18:26:32'!
outOfOrderErrorDescription
	
	^ 'Robot out of order :('! !


!classDefinition: #Status category: #'IRobot-Enunciado'!
Object subclass: #Status
	instanceVariableNames: 'machine'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Status methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 00:53:16'!
beforeReceivingCheckStatusOf: aRobot thenDeliverTo: aCashier
	self subclassResponsibility.! !

!Status methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 00:25:49'!
carryOnRobotThisProduct: aProduct.
	^self subclassResponsibility.! !

!Status methodsFor: 'as yet unclassified' stamp: 'merb 6/17/2025 12:31:08'!
initializeStatusForThis: robot
	machine := robot.! !

!Status methodsFor: 'as yet unclassified' stamp: 'merb 6/17/2025 12:55:03'!
thisCashierReceivesOrder: aCashier
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Status class' category: #'IRobot-Enunciado'!
Status class
	instanceVariableNames: ''!

!Status class methodsFor: 'as yet unclassified' stamp: 'merb 6/17/2025 12:11:47'!
createStatusForThis: robot
	^self new initializeStatusForThis: robot.! !


!classDefinition: #MechanicalFailure category: #'IRobot-Enunciado'!
Status subclass: #MechanicalFailure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!MechanicalFailure methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 01:28:36'!
beforeReceivingCheckStatusOf: aRobot thenDeliverTo: aCashier
	^aCashier receiveOrderFromAMecanicalFailureRobot: aRobot.! !

!MechanicalFailure methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 00:25:50'!
carryOnRobotThisProduct: aProduct
	machine putProductInTrailer: aProduct.! !

!MechanicalFailure methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 01:31:53'!
thisCashierReceivesOrder: aCashier
	^machine deliversOrderTo: aCashier.! !


!classDefinition: #OutOfOrder category: #'IRobot-Enunciado'!
Status subclass: #OutOfOrder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!OutOfOrder methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 00:54:19'!
beforeReceivingCheckStatusOf: aRobot thenDeliverTo: aCashier
	! !

!OutOfOrder methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 00:25:50'!
carryOnRobotThisProduct: aProduct
	machine generateSignalForOutOfOrderStatus.! !

!OutOfOrder methodsFor: 'as yet unclassified' stamp: 'merb 6/17/2025 12:58:31'!
thisCashierReceivesOrder: aCashier
	machine generateSignalForOutOfOrderStatus.! !


!classDefinition: #SensorsFailure category: #'IRobot-Enunciado'!
Status subclass: #SensorsFailure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!SensorsFailure methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 01:28:50'!
beforeReceivingCheckStatusOf: aRobot thenDeliverTo: aCashier
	^aCashier receiveOrderFromASensorsFailureRobot: aRobot.! !

!SensorsFailure methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 00:25:50'!
carryOnRobotThisProduct: aProduct
	machine putProductInTrailer: aProduct.! !

!SensorsFailure methodsFor: 'as yet unclassified' stamp: 'merb 6/17/2025 12:57:52'!
thisCashierReceivesOrder: aCashier
	machine deliversOrderTo: aCashier.! !


!classDefinition: #WorkingNormal category: #'IRobot-Enunciado'!
Status subclass: #WorkingNormal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!WorkingNormal methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 01:28:58'!
beforeReceivingCheckStatusOf: aRobot thenDeliverTo: aCashier
	^aCashier receiveOrderFromAWorkingNormalRobot: aRobot.! !

!WorkingNormal methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 00:25:50'!
carryOnRobotThisProduct: aProduct
	machine putProductInTrailer: aProduct.! !

!WorkingNormal methodsFor: 'as yet unclassified' stamp: 'merb 6/18/2025 01:27:52'!
thisCashierReceivesOrder: aCashier
	^machine deliversOrderTo: aCashier.! !


!classDefinition: #Trailer category: #'IRobot-Enunciado'!
Object subclass: #Trailer
	instanceVariableNames: 'weightCapacity heightCapacity container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!

!Trailer methodsFor: 'initialization' stamp: 'FRT 5/3/2020 23:27:42'!
initializeWith: aWeightCapacity and: aHeightCapacity

	weightCapacity := aWeightCapacity.
	heightCapacity := aHeightCapacity.
	
	container := OrderedCollection new.! !


!Trailer methodsFor: 'accessing' stamp: 'FRT 5/3/2020 23:34:36'!
totalProductsAmount
	
	^ container size.! !

!Trailer methodsFor: 'accessing' stamp: 'F 5/14/2020 10:35:03'!
totalProductsHeight
	"Solo importa la altura de los productos apilables"

	| total index |

	total := 0.
	index := 1.
	
	[index <= container size] whileTrue: [ | product |
		product := (container at: index).
		(product isStackable) ifTrue: [ total := total +  product height ].
		index := index + 1.	
	].

	^ total.! !

!Trailer methodsFor: 'accessing' stamp: 'F 5/14/2020 10:34:38'!
totalProductsWeight
	
	| total index |

	total := 0.
	index := 1.
	
	[index <= container size] whileTrue: [
		total := total + (container at: index) weight.
		index := index + 1.	
	].

	^ total.! !


!Trailer methodsFor: 'testing' stamp: 'FRT 5/3/2020 23:33:33'!
isEmpty
	
	^ container isEmpty! !


!Trailer methodsFor: 'action' stamp: 'FRT 5/3/2020 23:35:19'!
carry: aProduct
	
	^ aProduct carryBy: self.! !

!Trailer methodsFor: 'action' stamp: 'FRT 5/4/2020 19:08:17'!
carryProductA: aProduct
	
	self assertWeightAdding: aProduct.
	container add: aProduct.! !

!Trailer methodsFor: 'action' stamp: 'FRT 5/4/2020 19:08:09'!
carryProductB: aProduct

	self assertWeightAdding: aProduct.
	self assertHeightAdding: aProduct.
	
	container add: aProduct.! !


!Trailer methodsFor: 'assertions' stamp: 'FRT 5/5/2020 11:27:29'!
assertHeightAdding: aProduct
	
	(self totalProductsHeight + aProduct height) > heightCapacity ifTrue: [ self signalMaxHeightCapacityExceeded ]! !

!Trailer methodsFor: 'assertions' stamp: 'FRT 5/5/2020 11:27:41'!
assertWeightAdding: aProduct
	
	(self totalProductsWeight + aProduct weight) > weightCapacity ifTrue: [ self signalMaxWeightCapacityExceeded ]! !


!Trailer methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:31'!
signalMaxHeightCapacityExceeded

	self error: self class maxHeightExceededErrorDescription
! !

!Trailer methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:38'!
signalMaxWeightCapacityExceeded

	self error: self class maxWeightExceededErrorDescription
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Trailer class' category: #'IRobot-Enunciado'!
Trailer class
	instanceVariableNames: ''!

!Trailer class methodsFor: 'instance creation' stamp: 'FRT 5/4/2020 17:33:58'!
with: aWeightCapacity and: aHeightCapacity

	aWeightCapacity strictlyPositive ifFalse: [ self signalInvalidWeightCapacity ].
	aHeightCapacity strictlyPositive ifFalse: [ self signalInvalidHeightCapacity ].
	
	aWeightCapacity isInteger ifFalse: [ self signalWeightCapacityMustBeInteger ].
	aHeightCapacity isInteger ifFalse: [ self signalHeightCapacityMustBeInteger ].
		
	^ self new initializeWith: aWeightCapacity and: aHeightCapacity.

! !


!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:37:41'!
signalHeightCapacityMustBeInteger

	self error: self heightCapacityMustBeIntegerErrorDescription
! !

!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:12'!
signalInvalidHeightCapacity

	self error: self invalidHeightCapacityErrorDescription
! !

!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 11:30:21'!
signalInvalidWeightCapacity

	self error: self invalidWeightCapacityErrorDescription
! !

!Trailer class methodsFor: 'exceptions' stamp: 'FRT 5/4/2020 17:37:29'!
signalWeightCapacityMustBeInteger

	self error: self weightCapacityMustBeIntegerErrorDescription
! !


!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:38'!
heightCapacityMustBeIntegerErrorDescription

	^ 'Height capacity must be integer'! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:12'!
invalidHeightCapacityErrorDescription

	^ 'The trailers height capacity must be positive.'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:21'!
invalidWeightCapacityErrorDescription

	^ 'The trailers weight capacity must be positive.'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:31'!
maxHeightExceededErrorDescription

	^ 'Maximum height has been exceeded'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 11:30:38'!
maxWeightExceededErrorDescription

	^ 'Maximum weight has been exceeded'
! !

!Trailer class methodsFor: 'error messages' stamp: 'FRT 5/4/2020 17:49:32'!
weightCapacityMustBeIntegerErrorDescription

	^ 'Weight capacity must be integer'! !


!classDefinition: #EmptyTrailer category: #'IRobot-Enunciado'!
Trailer subclass: #EmptyTrailer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!


!classDefinition: #NotEmptyTrailer category: #'IRobot-Enunciado'!
Trailer subclass: #NotEmptyTrailer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IRobot-Enunciado'!
