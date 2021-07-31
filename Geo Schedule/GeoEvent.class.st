Class {
	#name : #GeoEvent,
	#superclass : #Object,
	#instVars : [
		'id',
		'dateAndTime',
		'status',
		'description',
		'category',
		'nrOfUsers',
		'location',
		'userStatus'
	],
	#category : #'Geo Schedule'
}

{ #category : #comparing }
GeoEvent >> < anEvent [

	^dateAndTime < anEvent dateAndTime
]

{ #category : #comparing }
GeoEvent >> <= anEvent [

	^dateAndTime <= anEvent dateAndTime
]

{ #category : #accessing }
GeoEvent >> category [

	^ category
]

{ #category : #accessing }
GeoEvent >> category: anObject [

	category := anObject
]

{ #category : #accessing }
GeoEvent >> dateAndTime [

	^ dateAndTime
]

{ #category : #accessing }
GeoEvent >> dateAndTime: anObject [

	dateAndTime := anObject
]

{ #category : #accessing }
GeoEvent >> dateAndTimeString [
	^dateAndTime asStringYMDHM
]

{ #category : #accessing }
GeoEvent >> description [

	^ description
]

{ #category : #accessing }
GeoEvent >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GeoEvent >> id [

	^ id
]

{ #category : #accessing }
GeoEvent >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GeoEvent >> initialize [ 

	super initialize.
	userStatus := Dictionary new
]

{ #category : #testing }
GeoEvent >> isActive [
	
	^status ~= 'archived'
]

{ #category : #accessing }
GeoEvent >> location [

	^ location
]

{ #category : #accessing }
GeoEvent >> location: anObject [

	location := anObject
]

{ #category : #accessing }
GeoEvent >> nrOfUsers [

	^ nrOfUsers
]

{ #category : #accessing }
GeoEvent >> nrOfUsers: anObject [

	nrOfUsers := anObject
]

{ #category : #printing }
GeoEvent >> printOn: aStream [

	aStream
		print: category ;
		space;
		print: dateAndTime  
]

{ #category : #accessing }
GeoEvent >> status [

	^ status
]

{ #category : #accessing }
GeoEvent >> status: anObject [

	status := anObject
]

{ #category : #accessing }
GeoEvent >> statusForUser: aUser [

	^ userStatus
		  at: aUser id
		  ifPresent: [ :userSts | userSts status ]
		  ifAbsent: [ 'neutral' ]
]

{ #category : #accessing }
GeoEvent >> userStatus [
	^ userStatus
]
