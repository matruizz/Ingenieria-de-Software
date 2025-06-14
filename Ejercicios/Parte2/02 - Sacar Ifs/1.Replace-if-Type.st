!classDefinition: #Vehicle category: #'1.Replace-if-Type'!
Object subclass: #Vehicle
	instanceVariableNames: 'type speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Vehicle methodsFor: 'initialization' stamp: 'merb 6/14/2025 01:46:44'!
initialize

	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'merb 6/14/2025 01:35:55'!
accelerate

	^self subclassResponsibility.

	"type = #Helicopter
		ifTrue:[speed := speed + (10 * kilometer / hour).
			altitude := altitude + (5 * meter)].
		
	type = #Motorcycle
		ifTrue:[speed := speed + (20 * kilometer / hour)]."! !


!classDefinition: #Helicopter category: #'1.Replace-if-Type'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/14/2025 01:38:30'!
accelerate

	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/14/2025 01:47:14'!
initialize
	super initialize.
	altitude := 0 * meter.! !


!classDefinition: #Motorcycle category: #'1.Replace-if-Type'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1.Replace-if-Type'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'merb 6/14/2025 01:39:15'!
accelerate

	speed := speed + (20 * kilometer / hour).! !
