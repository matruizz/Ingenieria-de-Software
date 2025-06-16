!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 'merb 6/14/2025 17:01:57'!
initialize

	self turnOff.
	speed := 0 * kilometer / hour! !


!Automobile methodsFor: 'move' stamp: 'merb 6/16/2025 00:14:29'!
accelerate
	state accelerate.
	"state = #Off ifTrue:[self error: 'Can not accelerate when turned off'].
	state = #On ifTrue:[speed := speed + (10 * kilometer / hour)]."! !

!Automobile methodsFor: 'move' stamp: 'merb 6/16/2025 00:17:34'!
accelerateWhenOff
	self error: 'Can not accelerate when turned off'.! !

!Automobile methodsFor: 'move' stamp: 'merb 6/16/2025 00:17:25'!
accelerateWhenOn
	speed := speed + (10 * kilometer / hour).! !

!Automobile methodsFor: 'move' stamp: 'merb 6/16/2025 00:08:41'!
turnOff
	state := Off powerStateForThis: self.! !

!Automobile methodsFor: 'move' stamp: 'merb 6/16/2025 00:09:12'!
turnOn
	state := On powerStateForThis: self.! !


!classDefinition: #PowerStatus category: #'2.Replace-if-State'!
Object subclass: #PowerStatus
	instanceVariableNames: 'automobile'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!PowerStatus methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:14:59'!
accelerate
	^self subclassResponsibility.! !

!PowerStatus methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:10:14'!
initializePowerStatusForThis: anAutomobile
	automobile := anAutomobile.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PowerStatus class' category: #'2.Replace-if-State'!
PowerStatus class
	instanceVariableNames: ''!

!PowerStatus class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:10:49'!
powerStateForThis: automobile
	
	^self new initializePowerStatusForThis: automobile.
	! !


!classDefinition: #Off category: #'2.Replace-if-State'!
PowerStatus subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Off methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:17:52'!
accelerate
	automobile accelerateWhenOff.! !


!classDefinition: #On category: #'2.Replace-if-State'!
PowerStatus subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!On methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 00:18:07'!
accelerate
	automobile accelerateWhenOn.! !
