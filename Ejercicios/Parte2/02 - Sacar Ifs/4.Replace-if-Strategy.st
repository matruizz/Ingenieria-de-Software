!classDefinition: #VehicleTests category: #'4.Replace-if-Strategy'!
TestCase subclass: #VehicleTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 19:08:46'!
test01LandVehicleCannotAccelerateWhileTurnedOff

	| landVehicle |
	
	"landVehicle := Vehicle electricMotorcycle."
	landVehicle := Motorcycle withEngineType: Electric inThe: City.

	self should: [ landVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not run when turned off'.
		self assert: (landVehicle speedAt: (0 * kilometer / hour)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 19:10:15'!
test02AirVehicleCannotAccelerateWhileTurnedOff

	| airVehicle |
	
	"airVehicle := Vehicle helicopter."
	airVehicle := Helicopter withEngineType: JetFueled inThe: Skies.

	self should: [ airVehicle accelerate ] 
	raise: Error 
	withExceptionDo: [ :error | error messageText = 'Can not fly when turned off'.
		self assert: (airVehicle speedAt: (0 * kilometer / hour)).
		self assert: (airVehicle altitudeAt: (0 * meter)) ]
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 19:25:36'!
test03ElectricVehicleAccelerateAsIntended

	| electricVehicle |
	
	"electricVehicle := Vehicle electricMotorcycle."
	electricVehicle := Motorcycle withEngineType: Electric inThe: City.
	
	electricVehicle turnOn.
	self assert: (electricVehicle speedAt: 0 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 10 * kilometer / hour).
	
	electricVehicle accelerate.
	self assert: (electricVehicle speedAt: 40 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 20:03:23'!
test04GasolineVehicleAccelerateAsIntended

	| gasolineVehicle |
	
	"gasolineVehicle := Vehicle gasolineMotorcycle."
	gasolineVehicle := Motorcycle withEngineType: Gasoline inThe: City.
	
	gasolineVehicle turnOn.
	self assert: (gasolineVehicle speedAt: 0 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 10 * kilometer / hour).
	
	gasolineVehicle accelerate.
	self assert: (gasolineVehicle speedAt: 20 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 20:04:02'!
test05JetFueledVehicleAccelerateAsIntended

	| jetFueledVehicle |
	
	"jetFueledVehicle := Vehicle helicopter."
	jetFueledVehicle := Helicopter withEngineType: JetFueled inThe: Skies. 
	
	jetFueledVehicle turnOn.
	self assert: (jetFueledVehicle speedAt: 0 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 1 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 5 * kilometer / hour).
	
	jetFueledVehicle accelerate.
	self assert: (jetFueledVehicle speedAt: 41 * kilometer / hour)
	
	
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 20:07:09'!
test06AirVehicleGoesUpAsItAcceleratesAsExpected

	| airVehicle |
	
	"airVehicle := Vehicle helicopter."
	airVehicle := Helicopter withEngineType: JetFueled inThe: Skies. 
	
	airVehicle turnOn.
	self assert: (airVehicle altitudeAt: 0 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 5 * meter).
	
	airVehicle accelerate.
	self assert: (airVehicle altitudeAt: 10 * meter)
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 20:08:03'!
test07SpeedLimiterForCityLimitsSpeedAt70Kmh

	| cityVehicle |
	
	"cityVehicle := Vehicle electricMotorcycle."
	cityVehicle := Motorcycle withEngineType: Electric inThe: City.
	
	cityVehicle turnOn.
	self assert: (cityVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ cityVehicle accelerate ].
	
	self assert: (cityVehicle speedAt: 70 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 21:02:59'!
test08SpeedLimiterForOpenRoadLimitsSpeedAt130Kmh

	| openRoadVehicle |
	
	"openRoadVehicle := Vehicle gasolineMotorcycle."
	openRoadVehicle := Motorcycle withEngineType: Gasoline inThe: OpenRoad.
	
	openRoadVehicle turnOn.
	self assert: (openRoadVehicle speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ openRoadVehicle accelerate ].
	
	self assert: (openRoadVehicle speedAt: 130 * kilometer / hour)
	
	
	! !

!VehicleTests methodsFor: 'testing' stamp: 'merb 6/16/2025 21:03:25'!
test09SpeedLimiterForAirTrafficLimitsSpeedAt500Kmh

	| vehicleInAir |
	
	"vehicleInAir := Vehicle helicopter."
	vehicleInAir := Helicopter withEngineType: JetFueled inThe: Skies.

	vehicleInAir turnOn.
	self assert: (vehicleInAir speedAt: 0 * kilometer / hour).
	
	20 timesRepeat: [ vehicleInAir accelerate ].
	
	self assert: (vehicleInAir speedAt: 500 * kilometer / hour)
	
	
	! !


!classDefinition: #DisplacementZone category: #'4.Replace-if-Strategy'!
Object subclass: #DisplacementZone
	instanceVariableNames: 'vehicle'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!DisplacementZone methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:50:18'!
initialize
	! !

!DisplacementZone methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:54:43'!
initializeDisplacementZoneWith: aVehicle
	vehicle := aVehicle.
	! !

!DisplacementZone methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:46:30'!
isSpeedLimitBeingBrokenBy: aVehicle movingAt: aSpeed
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DisplacementZone class' category: #'4.Replace-if-Strategy'!
DisplacementZone class
	instanceVariableNames: ''!

!DisplacementZone class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:57:09'!
displacementZoneWith: aVehicle
	^self new initializeDisplacementZoneWith: aVehicle. ! !


!classDefinition: #City category: #'4.Replace-if-Strategy'!
DisplacementZone subclass: #City
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!City methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:36:53'!
isSpeedLimitBeingBrokenBy: aVehicle movingAt: aSpeed
	aSpeed > (70 * kilometer / hour) ifTrue: [ aVehicle reduceSpeedToCitySpeedLimit].! !


!classDefinition: #OpenRoad category: #'4.Replace-if-Strategy'!
DisplacementZone subclass: #OpenRoad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!OpenRoad methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:41:43'!
isSpeedLimitBeingBrokenBy: aVehicle movingAt: aSpeed
	aSpeed > (130 * kilometer / hour) ifTrue: [ aVehicle reduceSpeedToOpenRoadSpeedLimit].! !


!classDefinition: #Skies category: #'4.Replace-if-Strategy'!
DisplacementZone subclass: #Skies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Skies methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:42:31'!
isSpeedLimitBeingBrokenBy: aVehicle movingAt: aSpeed
	aSpeed > (500 * kilometer / hour) ifTrue: [ aVehicle reduceSpeedToSkiesSpeedLimit].
	! !


!classDefinition: #EngineType category: #'4.Replace-if-Strategy'!
Object subclass: #EngineType
	instanceVariableNames: 'device state speed engineType where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!EngineType methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 16:02:55'!
acceletate
	^self subclassResponsibility.! !

!EngineType methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:44:17'!
thisEngineIsForThis: vehicle
	device := vehicle! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EngineType class' category: #'4.Replace-if-Strategy'!
EngineType class
	instanceVariableNames: 'Device'!

!EngineType class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:26:07'!
createEngineForThis: vehicle
	^self subclassResponsibility.! !


!classDefinition: #Electric category: #'4.Replace-if-Strategy'!
EngineType subclass: #Electric
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Electric methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 16:04:45'!
accelerate
	device accelerateWithElectricEngine.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Electric class' category: #'4.Replace-if-Strategy'!
Electric class
	instanceVariableNames: ''!

!Electric class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:42:28'!
createEngineForThis: vehicle
	^self new thisEngineIsForThis: vehicle.! !


!classDefinition: #Gasoline category: #'4.Replace-if-Strategy'!
EngineType subclass: #Gasoline
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Gasoline methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 19:49:31'!
accelerate
	device accelerateWithGasolineEngine.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Gasoline class' category: #'4.Replace-if-Strategy'!
Gasoline class
	instanceVariableNames: ''!

!Gasoline class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:42:20'!
createEngineForThis: vehicle
	^self new thisEngineIsForThis: vehicle.! !


!classDefinition: #JetFueled category: #'4.Replace-if-Strategy'!
EngineType subclass: #JetFueled
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!JetFueled methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 19:49:43'!
accelerate
	device accelerateWithJetFueledEngine.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JetFueled class' category: #'4.Replace-if-Strategy'!
JetFueled class
	instanceVariableNames: ''!

!JetFueled class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:26:49'!
createEngineForThis: vehicle
	^self new thisEngineIsForThis: vehicle.! !


!classDefinition: #PowerState category: #'4.Replace-if-Strategy'!
Object subclass: #PowerState
	instanceVariableNames: 'transportationDevice'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!PowerState methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:53:25'!
accelerate
	^self subclassResponsibility.! !

!PowerState methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:06:24'!
thisPowerStateIsForThis: vehicle
	transportationDevice := vehicle.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PowerState class' category: #'4.Replace-if-Strategy'!
PowerState class
	instanceVariableNames: ''!

!PowerState class methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:03:25'!
powerStateForThis: vehicle
	^self new thisPowerStateIsForThis: vehicle.! !


!classDefinition: #Off category: #'4.Replace-if-Strategy'!
PowerState subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Off methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:54:11'!
accelerate
	transportationDevice accelerateWhenOff.! !

!Off methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 19:12:18'!
canNotAccelerateErrorMessage
	! !


!classDefinition: #On category: #'4.Replace-if-Strategy'!
PowerState subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!On methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 15:54:26'!
accelerate
	transportationDevice accelerateWhenOn.! !


!classDefinition: #Vehicle category: #'4.Replace-if-Strategy'!
Object subclass: #Vehicle
	instanceVariableNames: 'state speed engineType altitude where'
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Vehicle methodsFor: 'initialization' stamp: 'merb 6/16/2025 18:59:37'!
engineType: anEngineType andSurroundings: surroundings

	^self subclassResponsibility.! !

!Vehicle methodsFor: 'initialization' stamp: 'merb 6/16/2025 20:01:20'!
initialize

	self turnOff.
	"type := typeToTake."
	"engineType := anEngineType."
	"where := surroundings."
	speed := 0 * kilometer / hour.
	"altitude := 0 * meter"! !


!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:24:00'!
altitudeAt: anAltitude

	^ altitude = anAltitude! !

!Vehicle methodsFor: 'move' stamp: 'merb 6/16/2025 21:01:04'!
reduceSpeedToCitySpeedLimit
	speed := 70 * kilometer / hour.! !

!Vehicle methodsFor: 'move' stamp: 'merb 6/16/2025 20:18:29'!
reduceSpeedToLimit
	^self subclassResponsibility.! !

!Vehicle methodsFor: 'move' stamp: 'merb 6/16/2025 20:40:11'!
reduceSpeedToOpenRoadSpeedLimit
	speed := 130 * kilometer / hour.! !

!Vehicle methodsFor: 'move' stamp: 'merb 6/16/2025 20:40:47'!
reduceSpeedToSkiesSpeedLimit
	speed := 500 * kilometer / hour.! !

!Vehicle methodsFor: 'move' stamp: 'NR 9/7/2024 18:23:27'!
speedAt: aSpeed

	^ speed = aSpeed! !


!Vehicle methodsFor: 'on/off' stamp: 'merb 6/16/2025 20:01:30'!
turnOff

	state := Off powerStateForThis: self.
	speed := 0 * kilometer / hour! !

!Vehicle methodsFor: 'on/off' stamp: 'merb 6/16/2025 20:01:41'!
turnOn

	state := On powerStateForThis: self.! !


!Vehicle methodsFor: 'error messages' stamp: 'merb 6/16/2025 19:16:21'!
canNotAccelerateErrorMessage

	^self subclassResponsibility.
	"type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off']."! !


!Vehicle methodsFor: 'acceleration' stamp: 'merb 6/16/2025 17:41:04'!
accelerate

	
	
	"state = #Off ifTrue: [ self error: self canNotAccelerateErrorMessage ]."
	state accelerate.
	"engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ].

	type = #Helicopter
		ifTrue:[ | altitude | speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ].
		
	where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]"! !

!Vehicle methodsFor: 'acceleration' stamp: 'merb 6/16/2025 19:15:09'!
accelerateWhenOff
	^self error: self canNotAccelerateErrorMessage.! !

!Vehicle methodsFor: 'acceleration' stamp: 'merb 6/16/2025 20:39:50'!
accelerateWhenOn

	"engineType = #ElectricEngine ifTrue: [ acceleration := (speed + (5 * kilometer / hour)) * 2 ].
	engineType = #GasolineEngine ifTrue: [ acceleration := 10 * kilometer / hour ].
	engineType = #JetFueledEngine ifTrue: [ acceleration := ((speed amount + 1) ^ 2) * kilometer / hour ]."
	
	engineType accelerate.

	"type = #Helicopter
		ifTrue:[ | altitude | speed := speed + acceleration.
			altitude := altitude + (5 * meter) ].
		
	type = #Motorcycle
		ifTrue:[ speed := speed + acceleration ]."
		
	"where = #city ifTrue: [ speed > (70 * kilometer / hour) ifTrue: [ speed := 70 * kilometer / hour ] ].
	where = #openRoad ifTrue: [ speed > (130 * kilometer / hour) ifTrue: [ speed := 130 * kilometer / hour ] ].
	where = #skies ifTrue: [ speed > (500 * kilometer / hour) ifTrue: [ speed := 500 * kilometer / hour ] ]"! !

!Vehicle methodsFor: 'acceleration' stamp: 'merb 6/16/2025 17:57:30'!
accelerateWithElectricEngine
	| acceleration |
	acceleration := (speed + (5 * kilometer / hour)) * 2.
	self accelerate: acceleration.
	! !

!Vehicle methodsFor: 'acceleration' stamp: 'merb 6/16/2025 18:08:16'!
accelerateWithGasolineEngine
	| acceleration |
	acceleration := 10 * kilometer / hour.
	self accelerate: acceleration.
	! !

!Vehicle methodsFor: 'acceleration' stamp: 'merb 6/16/2025 18:09:00'!
accelerateWithJetFueledEngine
	| acceleration |
	acceleration := ((speed amount + 1) ^ 2) * kilometer / hour.
	self accelerate: acceleration.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'4.Replace-if-Strategy'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'merb 6/16/2025 19:02:47'!
withEngineType: anEngineType inThe: aDisplacementZone
	^self new engineType: anEngineType andSurroundings: aDisplacementZone.! !


!classDefinition: #Helicopter category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Helicopter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:33:11'!
accelerate: acceleration
	speed := speed + acceleration.
	altitude := altitude + (5 * meter).
	where isSpeedLimitBeingBrokenBy: self movingAt: speed.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 19:16:40'!
canNotAccelerateErrorMessage
	^'Can not fly when turned off'.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:53:16'!
engineType: anEngineType andSurroundings: surroundings
	where := surroundings displacementZoneWith: self.
	engineType := anEngineType createEngineForThis: self.
	altitude := 0 * meter.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:19:25'!
reduceSpeedToLimit
	speed := 70 * kilometer / hour.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:21:39'!
reduceSpeedToSpeedLimit
	speed := 70 * kilometer / hour.! !


!classDefinition: #Motorcycle category: #'4.Replace-if-Strategy'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '4.Replace-if-Strategy'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:43:41'!
accelerate: acceleration
	speed := speed + acceleration.
	where isSpeedLimitBeingBrokenBy: self movingAt: speed.
	! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 19:17:13'!
canNotAccelerateErrorMessage
	^'Can not run when turned off'.! !

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'merb 6/16/2025 20:55:29'!
engineType: anEngineType andSurroundings: surroundings
	where := surroundings displacementZoneWith: self.
	engineType := anEngineType createEngineForThis: self.
	 
! !
