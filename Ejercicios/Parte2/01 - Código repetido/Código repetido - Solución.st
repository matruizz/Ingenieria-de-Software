!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'merb 6/13/2025 14:34:51'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	"|customerBook millisecondsBeforeRunning millisecondsAfterRunning|

	customerBook := CustomerBook new.

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (50 * millisecond)"

	|customerBook|
	customerBook := CustomerBook new.
	self assert: (self operation: [customerBook addCustomerNamed: 'Mateo'] takesLessThanMilliseconds: 50 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'merb 6/13/2025 14:37:25'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	"|customerBook millisecondsBeforeRunning millisecondsAfterRunning paulMcCartney|

	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.

	customerBook addCustomerNamed: paulMcCartney.

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.

	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (100 * millisecond)"

	|customerBook|
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'Mateo'.
	self assert: (self operation: [customerBook removeCustomerNamed: 'Mateo'.]  takesLessThanMilliseconds: 100 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MERB 5/28/2025 01:57:59'!
test03CanNotAddACustomerWithEmptyName 

	|customerBook|

	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]

	"self anOperation: [customerBook  addCustomerNamed: ''.] thatGeneratesError: Error assertions: 
	[ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'merb 6/13/2025 14:40:32'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	"[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook hasCustomerNamed: johnLennon) ]"

	self anOperation: [customerBook removeCustomerNamed: 'Paul McCartney'] thatGeneratesError: NotFound assertions: 
		[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook hasCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'merb 6/13/2025 14:42:13'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	|customerBook paulMcCartney|

	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.

	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.

	"self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers."

	self assertThat: customerBook activeCustomersAre: 0 andSuspendedAre: 1 andCustomerInCustomerBookAre: 1.
	self assert: (customerBook hasCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'merb 6/13/2025 14:42:48'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	"self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers."

	self assertThat: customerBook activeCustomersAre: 0 andSuspendedAre: 0 andCustomerInCustomerBookAre: 0.
	self deny: (customerBook hasCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'merb 6/13/2025 14:44:19'!
test07CanNotSuspendAnInvalidCustomer

	| customerBook johnLennon |

	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	"[ customerBook suspendCustomerNamed: 'George Harrison'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]"

	self anOperation: [ customerBook suspendCustomerNamed: 'George Harrison'] thatGeneratesError: CantSuspend assertions: 
	[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'merb 6/13/2025 14:43:55'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	"[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]"

	self anOperation: [ customerBook suspendCustomerNamed: johnLennon] thatGeneratesError: CantSuspend assertions: 
	[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook hasCustomerNamed: johnLennon) ]! !


!CustomerBookTest methodsFor: 'sinCategoria' stamp: 'MERB 4/27/2025 21:57:28'!
anOperation: aBlockToValue thatGeneratesError: anError assertions: assertions
	[ aBlockToValue value.
	self fail ]
		on: anError 
		do: [ assertions ]! !

!CustomerBookTest methodsFor: 'sinCategoria' stamp: 'MERB 4/27/2025 23:42:39'!
assertThat: aCustomerBook activeCustomersAre: aNumber andSuspendedAre: anotherNumber andCustomerInCustomerBookAre: theCorrectSum
	self assert: aNumber equals: aCustomerBook numberOfActiveCustomers.
	self assert: anotherNumber equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: theCorrectSum equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'sinCategoria' stamp: 'MERB 4/26/2025 12:43:56'!
operation: aBlockToValue takesLessThanMilliseconds: anAmountOfMilliseconds
	| millisecondsBeforeRunning millisecondsAfterRunning |
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aBlockToValue value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning) < (anAmountOfMilliseconds)! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MERB 4/27/2025 17:24:53'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].

	(self hasCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MERB 4/27/2025 17:16:56'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MERB 4/27/2025 17:09:53'!
removeCustomerNamed: aName 
 
"	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal."
	"self removeIfPresent: aName  elseSendSignal: NotFound."
	"self ifPresentIn: active doOperation:  toElement: aName elseSendSignal: NotFound "
	"self removeIfPresentIn: active theElement: aName elseSendSignal: NotFound."
	"self removeIfPresentIn: suspended theElement: aName elseSendSignal: NotFound."
	"self removeIfPresentIn: active theElement: aName.
	self removeIfPresentIn: suspended theElement: aName."
	"active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [NotFound signal.]]"
	self removeIfPresentIn: active theElement: aName ifNotPresentValue: [self removeIfPresentIn: suspended theElement: aName ifNotPresentValue: [^NotFound signal.]].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'MERB 4/27/2025 17:16:16'!
suspendCustomerNamed: aName 
	
	"(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName"
	self removeIfPresentIn: active theElement: aName ifNotPresentValue: [^CantSuspend signal.].
	suspended add: aName.! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'MERB 4/27/2025 17:24:04'!
hasCustomerNamed: aName
	^(active includes: aName) or: (suspended includes: aName).! !

!CustomerBook methodsFor: 'as yet unclassified' stamp: 'MERB 4/27/2025 17:08:07'!
removeIfPresentIn: aCollection theElement: anElement	 ifNotPresentValue: aBlock
	1 to: aCollection size do:
	[ :index |
		anElement = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ anElement
			]
	].
	aBlock value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
