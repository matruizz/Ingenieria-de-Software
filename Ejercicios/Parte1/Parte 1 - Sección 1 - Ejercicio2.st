!classDefinition: #bill category: #ejercicio2!
DenotativeObject subclass: #bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'bill class' category: #ejercicio2!
bill class
	instanceVariableNames: 'energia'!

!bill class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 08:38:44'!
caminar: unaCantidadDeKilometros
	energia := energia - unaCantidadDeKilometros - 3.
	^energia.! !

!bill class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 08:35:43'!
comer: unaCantidadDeKilosDeCerebro
	energia := energia + (4 * unaCantidadDeKilosDeCerebro).
	^energia.! !

!bill class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 08:39:09'!
energia
	^energia.! !


!bill class methodsFor: '--** private fileout/in **--' stamp: 'merb 6/6/2025 14:19:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energia := 4.! !

bill initializeAfterFileIn!