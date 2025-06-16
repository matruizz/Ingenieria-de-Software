!classDefinition: #PowerState category: #'3.Replace-if-Type+State'!
Object subclass: #PowerState
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!PowerState methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:56:48'!
accelerate
	^self subclassResponsibility.! !

!PowerState methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:10:30'!
thisPowerStatusIsFor: thisAutomobile
	vehicle := thisAutomobile.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PowerState class' category: #'3.Replace-if-Type+State'!
PowerState class
	instanceVariableNames: ''!

!PowerState class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:55:00'!
initializePowerStateForThis: vehicle
	^self new thisPowerStatusIsFor: vehicle.! !


!classDefinition: #Off category: #'3.Replace-if-Type+State'!
PowerState subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Off methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:57:31'!
accelerate
	vehicle accelerateWhenOff.! !


!classDefinition: #On category: #'3.Replace-if-Type+State'!
PowerState subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!On methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:03:47'!
accelerate
	vehicle accelerateWhenOn.! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'merb 6/16/2025 01:16:44'!
initialize
	self turnOff.
	speed := 0 * kilometer / hour.! !

!Vehicle methodsFor: 'initialization' stamp: 'merb 6/16/2025 01:12:15'!
initializeWithType: typeToTake

	self turnOff.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'merb 6/16/2025 01:04:19'!
accelerate
	state accelerate.! !

!Vehicle methodsFor: 'move' stamp: 'merb 6/16/2025 00:58:31'!
accelerateWhenOff
	self error: self canNotAccelerateErrorMessage.! !

!Vehicle methodsFor: 'move' stamp: 'merb 6/16/2025 01:00:44'!
accelerateWhenOn
	 ^self subclassResponsibility.! !


!Vehicle methodsFor: 'on/off' stamp: 'merb 6/16/2025 00:54:04'!
turnOff

	state := Off initializePowerStateForThis: self.! !

!Vehicle methodsFor: 'on/off' stamp: 'merb 6/16/2025 01:31:34'!
turnOn

	state := On initializePowerStateForThis: self.! !


!Vehicle methodsFor: 'error messages' stamp: 'merb 6/16/2025 01:05:27'!
canNotAccelerateErrorMessage
	^self subclassResponsibility.! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:01:29'!
accelerateWhenOn
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:07:01'!
canNotAccelerateErrorMessage
	^'Can not fly when turned off'.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:18:50'!
initialize
	super initialize.
	altitude := 0 * meter.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:13:09'!
initializeWithType: typeToTake
	type := typeToTake.
	altitude := 0 * meter! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:01:55'!
accelerateWhenOn
		speed := speed + (20 * kilometer / hour).! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 01:07:35'!
canNotAccelerateErrorMessage
	^'Can not run when turned off'.! !
