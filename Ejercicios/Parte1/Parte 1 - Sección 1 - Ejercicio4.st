!classDefinition: #I category: #ejercicio4!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #ejercicio4!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 11:24:21'!
next
	^II.! !

!I class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 11:46:59'!
previous
	^self error: self noPreviousForOneInNaturalNumbers.! !


!I class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 11:28:50'!
* aMultiplier
	^aMultiplier.! !

!I class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 11:51:10'!
+ anAdder
	^anAdder next.! !

!I class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 13:52:04'!
- aSustrahend
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 12:36:31'!
/ aDividend
	^ aDividend vecesDivididoEntre: self.! !


!I class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 13:55:42'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'.! !

!I class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 13:51:33'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Numeros negativos no soportados'.! !

!I class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 11:54:42'!
inNaturalsCantSustractAnEqualOrBiggerNumber
	^'In naturals cant sustract an equal or bigger number.'.! !

!I class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 11:54:37'!
noPreviousForOneInNaturalNumbers
	^'No previous for one in natural numbers.'.! !


!I class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 13:39:32'!
divideWithDividendGreaterEqualThanDivisor: aDividend and: aDivisor
	"Caso 'Equal' del GreaterEqual"
	^self! !

!I class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 13:20:07'!
multiplyByBiggerThanOne: aNumberBiggerThanOne
	^aNumberBiggerThanOne.! !

!I class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 13:07:49'!
substractFrom: aNaturalNumber
	^aNaturalNumber previous.! !

!I class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 12:36:31'!
vecesDivididoEntre: aDividend
	^aDividend.! !


!classDefinition: #II category: #ejercicio4!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #ejercicio4!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 13:11:09'!
* aMultiplier
	^aMultiplier multiplyByBiggerThanOne: self.! !

!II class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 12:54:34'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!II class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 12:55:19'!
- aSustrahend
	^aSustrahend substractFrom: self.! !

!II class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 13:27:12'!
/ aDividend
	^ aDividend vecesDivididoEntre: self.! !


!II class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 12:51:51'!
next
	next ifNil: [
		next := self cloneNamed: self name, 'I'.
		next previous: self.
		].
	^next.! !

!II class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 13:58:24'!
previous
	^previous.! !


!II class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 13:29:44'!
divideWithDividendGreaterEqualThanDivisor: aDividend and: aDivisor
	^[(aDividend - aDivisor) / aDivisor + I
		] on:Error do: [I]
 
	! !

!II class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 13:36:22'!
multiplyByBiggerThanOne: aNaturalNumberBiggerThanOne
	^aNaturalNumberBiggerThanOne + (self previous * aNaturalNumberBiggerThanOne)! !

!II class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 12:45:47'!
previous: aNumber
	previous := aNumber.! !

!II class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 13:23:36'!
substractFrom: aNaturalNumber
	^aNaturalNumber previous - self previous.! !

!II class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 13:54:51'!
vecesDivididoEntre: aDividend
	^ [(aDividend + I - self) divideWithDividendGreaterEqualThanDivisor:  aDividend and: self		] 
		on: Error 
		do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !


!II class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 13:30:57'!
canNotDivideByBiggerNumberErrorDescription
	^'Can not divide by a bigger number'.! !

!II class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 14:02:40'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'.! !


!II class methodsFor: 'clone removing' stamp: 'merb 6/6/2025 13:46:53'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'merb 6/6/2025 14:19:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: #ejercicio4!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #ejercicio4!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
* aMultiplier
	^aMultiplier multiplyByBiggerThanOne: self.! !

!III class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!III class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
- aSustrahend
	^aSustrahend substractFrom: self.! !

!III class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
/ aDividend
	^ aDividend vecesDivididoEntre: self.! !


!III class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 14:05:10'!
next
	next ifNil: [
		next := self cloneNamed: self name, 'I'.
		next previous: self.
		].
	^next.! !

!III class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 14:05:10'!
previous
	^previous.! !


!III class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
divideWithDividendGreaterEqualThanDivisor: aDividend and: aDivisor
	^[(aDividend - aDivisor) / aDivisor + I
		] on:Error do: [I]
 
	! !

!III class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
multiplyByBiggerThanOne: aNaturalNumberBiggerThanOne
	^aNaturalNumberBiggerThanOne + (self previous * aNaturalNumberBiggerThanOne)! !

!III class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
previous: aNumber
	previous := aNumber.! !

!III class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
substractFrom: aNaturalNumber
	^aNaturalNumber previous - self previous.! !

!III class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
vecesDivididoEntre: aDividend
	^ [(aDividend + I - self) divideWithDividendGreaterEqualThanDivisor:  aDividend and: self		] 
		on: Error 
		do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !


!III class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 14:05:10'!
canNotDivideByBiggerNumberErrorDescription
	^'Can not divide by a bigger number'.! !

!III class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 14:05:10'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'.! !


!III class methodsFor: 'clone removing' stamp: 'merb 6/6/2025 14:05:10'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!III class methodsFor: '--** private fileout/in **--' stamp: 'merb 6/6/2025 14:19:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: #ejercicio4!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ejercicio4'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #ejercicio4!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
* aMultiplier
	^aMultiplier multiplyByBiggerThanOne: self.! !

!IIII class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIII class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
- aSustrahend
	^aSustrahend substractFrom: self.! !

!IIII class methodsFor: 'arithmetic operations' stamp: 'merb 6/6/2025 14:05:10'!
/ aDividend
	^ aDividend vecesDivididoEntre: self.! !


!IIII class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 14:05:10'!
next
	next ifNil: [
		next := self cloneNamed: self name, 'I'.
		next previous: self.
		].
	^next.! !

!IIII class methodsFor: 'next & previous' stamp: 'merb 6/6/2025 14:05:10'!
previous
	^previous.! !


!IIII class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
divideWithDividendGreaterEqualThanDivisor: aDividend and: aDivisor
	^[(aDividend - aDivisor) / aDivisor + I
		] on:Error do: [I]
 
	! !

!IIII class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
multiplyByBiggerThanOne: aNaturalNumberBiggerThanOne
	^aNaturalNumberBiggerThanOne + (self previous * aNaturalNumberBiggerThanOne)! !

!IIII class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
previous: aNumber
	previous := aNumber.! !

!IIII class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
substractFrom: aNaturalNumber
	^aNaturalNumber previous - self previous.! !

!IIII class methodsFor: 'private auxiliary operations' stamp: 'merb 6/6/2025 14:05:10'!
vecesDivididoEntre: aDividend
	^ [(aDividend + I - self) divideWithDividendGreaterEqualThanDivisor:  aDividend and: self		] 
		on: Error 
		do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !


!IIII class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 14:05:10'!
canNotDivideByBiggerNumberErrorDescription
	^'Can not divide by a bigger number'.! !

!IIII class methodsFor: 'error descriptions' stamp: 'merb 6/6/2025 14:05:10'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'.! !


!IIII class methodsFor: 'clone removing' stamp: 'merb 6/6/2025 14:05:10'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!IIII class methodsFor: '--** private fileout/in **--' stamp: 'merb 6/6/2025 14:19:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!