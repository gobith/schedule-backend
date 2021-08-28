Class {
	#name : #GeoUser,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'surname',
		'email',
		'phone',
		'password',
		'role',
		'websiteRole',
		'eventStatus',
		'categoryStatus'
	],
	#category : #'Geo Schedule-Domain'
}

{ #category : #testing }
GeoUser >> canViewCategory: aGeoCategory [

	self isActive ifFalse: [ ^false ].
	^ categoryStatus
		  at: aGeoCategory id
		  ifPresent: [ :catStatus | catStatus canView ]
		  ifAbsent: [ false ]
]

{ #category : #testing }
GeoUser >> canViewEvent: anEvent [

	^anEvent isActive and: [(self canViewCategory: anEvent category)]
]

{ #category : #testing }
GeoUser >> canViewUser: aUser [

	self isAdmin ifTrue: [ ^ true ].
	aUser isArchived ifTrue: [ ^false ].
	^self categoryStatus anySatisfy: [ :myCategoryStatus | 
		myCategoryStatus canView and: [ 
			aUser categoryStatus
				at: myCategoryStatus category id
				ifPresent: [ :otherCategoryStatus | otherCategoryStatus canView ]
				ifAbsent: [ false ] ] ]
]

{ #category : #accessing }
GeoUser >> capabilitiesClass [
	self shouldBeImplemented.
]

{ #category : #accessing }
GeoUser >> capabilitiesFor: aSchedule [

	^ (self isAdmin
		   ifTrue: [ GeoAdminCapabilities ]
		   ifFalse: [ GeoUserCapabilities ]) schedule: aSchedule user: self
]

{ #category : #accessing }
GeoUser >> categoryStatus [

	^categoryStatus
]

{ #category : #accessing }
GeoUser >> email [

	^ email
]

{ #category : #accessing }
GeoUser >> email: anObject [

	email := anObject
]

{ #category : #accessing }
GeoUser >> eventStatus [
	^ eventStatus
]

{ #category : #accessing }
GeoUser >> id [

	^ id
]

{ #category : #accessing }
GeoUser >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GeoUser >> initialize [ 

	super initialize.
	eventStatus := Dictionary new.
	categoryStatus := Dictionary new
]

{ #category : #testing }
GeoUser >> isActive [ 
	^role = 'normal'
]

{ #category : #testing }
GeoUser >> isAdmin [
	
	^websiteRole = 'admin'
]

{ #category : #testing }
GeoUser >> isAdminFor: aCategory [

	| catStatus  |
	catStatus := categoryStatus
		           detect: [ :catStat | catStat category = aCategory ]
		           ifNone: [ nil ].
	catStatus ifNil: [ ^ false ].

	^ catStatus isAdmin
]

{ #category : #testing }
GeoUser >> isArchived [
	^role = 'archive' 
]

{ #category : #accessing }
GeoUser >> name [

	^ name
]

{ #category : #accessing }
GeoUser >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoUser >> password [

	^ password
]

{ #category : #accessing }
GeoUser >> password: anObject [

	password := anObject
]

{ #category : #accessing }
GeoUser >> phone [

	^ phone
]

{ #category : #accessing }
GeoUser >> phone: anObject [

	phone := anObject
]

{ #category : #printing }
GeoUser >> printOn: aStream [

	aStream
		nextPutAll: name
]

{ #category : #accessing }
GeoUser >> role [

	^ role
]

{ #category : #accessing }
GeoUser >> role: anObject [

	role := anObject
]

{ #category : #accessing }
GeoUser >> surname [

	^ surname
]

{ #category : #accessing }
GeoUser >> surname: anObject [

	surname := anObject
]

{ #category : #accessing }
GeoUser >> websiteRole [

	^ websiteRole
]

{ #category : #accessing }
GeoUser >> websiteRole: anObject [

	websiteRole := anObject
]
