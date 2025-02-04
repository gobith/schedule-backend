"
A GeoScheduleTest is a test class for testing the behavior of GeoSchedule
"
Class {
	#name : #GeoScheduleTest,
	#superclass : #TestCase,
	#category : #'Geo Schedule-Tests'
}

{ #category : #tests }
GeoScheduleTest >> testAddUser [

	| schedule user |
	schedule := GeoSchedule new.
	schedule database: GeoTestDatabase new.
	user := Dictionary new.
	user
		at: 'name' put: 'John';
		at: 'surname' put: 'Doe';
		at: 'email' put: '123@566.com';
		at: 'phone' put: '1234567890';
		at: 'password' put: 'secret'.
	schedule addUser: user.

	self
		assert: schedule database file
		equals:
		'GeoAddUser{#modDateAndTime:DateAndTime[''2021-07-26T00:00:00+02:00''],#payload:{''password'':''secret'',''email'':''123@566.com'',''surname'':''Doe'',''name'':''John'',''id'':''1'',''phone'':''1234567890''}} '
]

{ #category : #tests }
GeoScheduleTest >> testModifyUser [

	| schedule user |
	schedule := GeoSchedule new.
	schedule database: GeoTestDatabase new.
	user := Dictionary new.
	user
		at: 'name' put: 'John';
		at: 'surname' put: 'Doe';
		at: 'email' put: '123@566.com';
		at: 'phone' put: '1234567890';
		at: 'password' put: 'secret'.
	
	schedule addUser: user.

	user := user copy.
	user at: 'name' put: 'Kees'.
	schedule modifyUser: user.
	
self
		assert: schedule database file
		equals:
		'GeoAddUser{#modDateAndTime:DateAndTime[''2021-07-26T00:00:00+02:00''],#payload:{''password'':''secret'',''email'':''123@566.com'',''surname'':''Doe'',''name'':''John'',''id'':''1'',''phone'':''1234567890''}} GeoModifyUser{#modDateAndTime:DateAndTime[''2021-07-26T00:00:00+02:00''],#payload:{''password'':''secret'',''email'':''123@566.com'',''surname'':''Doe'',''name'':''Kees'',''id'':''1'',''phone'':''1234567890''}} '
]

{ #category : #tests }
GeoScheduleTest >> testSchedule [

	| schedule |
	schedule := GeoSchedule new.
	schedule 
]

{ #category : #tests }
GeoScheduleTest >> testStartUp001 [

	| schedule user |
	schedule := GeoSchedule new.
	schedule database: GeoTestDatabase new.
	schedule database file:
		'GeoAddUser{#modDateAndTime:DateAndTime[''2021-07-26T00:00:00+02:00''],#payload:{''password'':''secret'',''email'':''123@566.com'',''surname'':''Doe'',''name'':''John'',''id'':''1'',''phone'':''1234567890''}} '.

	schedule fileIn.
	self assert: schedule users size equals: 1
]

{ #category : #tests }
GeoScheduleTest >> testSton [

	STON fromString: 'GeoAddUser{#modDateAndTime:DateAndTime[''2021-07-26T22:47:12.96076+02:00''],#payload:{''password'':''secret'',''email'':''123@566.com'',''surname'':''Doe'',''name'':''John'',''id'':''60ed4198-6e84-0d00-9f37-371201ddb1f0'',''phone'':''1234567890''}}'
]
