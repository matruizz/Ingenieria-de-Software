!classDefinition: #Falso category: 'ejercicio3'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: 'ejercicio3'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 10:45:29'!
no
	^Verdadero! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'MERB 4/3/2025 09:30:15'!
o: unBooleano
	^unBooleano! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 11:40:00'!
siFalso: unaAccionARealizarUIgnorar
	^unaAccionARealizarUIgnorar value.! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 11:40:06'!
siVerdadero: unaAccionArealizarUIgnorar! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'MERB 4/3/2025 09:29:49'!
y: unBooleano
	^self! !


!classDefinition: #Verdadero category: 'ejercicio3'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: 'ejercicio3'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 10:44:20'!
no
	^Falso.! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 08:46:46'!
o: unBooleano
	^self.! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 11:40:23'!
siFalso: unaAccionARealizarUIgnorar! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 11:40:29'!
siVerdadero: unaAccionARealizarUIgnorar
	^unaAccionARealizarUIgnorar value.! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 08:46:41'!
y: unBooleano
	^unBooleano.! !


!classDefinition: #algebraDeBooleTests category: 'ejercicio3'!
DenotativeObject subclass: #algebraDeBooleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio3'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'algebraDeBooleTests class' category: 'ejercicio3'!
algebraDeBooleTests class
	instanceVariableNames: ''!

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 10:44:59'!
testFalsoNegadoEsVerdadero
	Assert that: Falso no isEqualTo: Verdadero! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/3/2025 09:54:50'!
testFalsoOFalsoEsFalso
	Assert that: (Falso o: Falso) isEqualTo: Falso! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 09:38:23'!
testFalsoSiFalsoAccion
	Assert  that: (Falso siFalso: 'Hola') isEqualTo: 'Hola'.! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 09:37:30'!
testFalsoSiVerdaderoAccion
	Assert  that: (Falso siVerdadero: 'Hola') isEqualTo: nil.! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'merb 6/6/2025 10:45:07'!
testVerdaderoNegadoEsFalso
	Assert that: Verdadero no isEqualTo: Falso! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/3/2025 09:54:01'!
testVerdaderoOFalsoEsVerdadero
	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/3/2025 09:52:29'!
testVerdaderoOVerdaderoEsVerdadero
	Assert that: (Verdadero o: Verdadero) isEqualTo: Verdadero ! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 09:36:45'!
testVerdaderoSiFalsoAccion
	Assert  that: (Verdadero siFalso: 'Hola') isEqualTo: nil.! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/4/2025 09:36:02'!
testVerdaderoSiVerdaderoAccion
	Assert  that: (Verdadero siVerdadero: 'Hola') isEqualTo: 'Hola'.! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/3/2025 09:46:29'!
testVerdaderoYFalsoEsFalso
	Assert that: (Verdadero y: Falso) isEqualTo: Falso! !

!algebraDeBooleTests class methodsFor: 'as yet unclassified' stamp: 'MERB 4/3/2025 09:47:40'!
testsVerdaderoYVerdaderoEsVerdadero
	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero! !
