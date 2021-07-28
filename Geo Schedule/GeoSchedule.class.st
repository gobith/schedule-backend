Class {
	#name : #GeoSchedule,
	#superclass : #Object,
	#instVars : [
		'events',
		'users',
		'categories',
		'database'
	],
	#category : #'Geo Schedule'
}

{ #category : #actions }
GeoSchedule >> addCategory: aDictionary [

	GeoAddCategory fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> addEvent: aDictionary [

	GeoAddEvent fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> addUser: aDictionary [

	^GeoAddUser fromPayload: aDictionary schedule: self
]

{ #category : #accessing }
GeoSchedule >> categories [

	^ categories
]

{ #category : #accessing }
GeoSchedule >> database [

	^ database
]

{ #category : #accessing }
GeoSchedule >> database: anObject [

	database := anObject
]

{ #category : #accessing }
GeoSchedule >> events [

	^ events
]

{ #category : #initialization }
GeoSchedule >> fileIn [
	database fileInto: self
]

{ #category : #initialization }
GeoSchedule >> initialize [ 

	super initialize .
	events := Dictionary new.
	users := Dictionary new.
	categories := Dictionary new.
	database := GeoExternalFileDatabase new.
	
]

{ #category : #accessing }
GeoSchedule >> modDateAndTime [

	^ database modDateAndTime
]

{ #category : #actions }
GeoSchedule >> modifyCategory: aDictionary [

	GeoModifyCategory fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> modifyEvent: aDictionary [

	GeoModifyEvent fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> modifyUser: aDictionary [

	^GeoModifyUser fromPayload: aDictionary schedule: self
]

{ #category : #accessing }
GeoSchedule >> nextId [

	^database nextId
]

{ #category : #actions }
GeoSchedule >> updateEventStatus: aDictionary [

	^GeoUpdateEventStatus fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> updateUserEventStatus: aDictionary [

	^GeoUpdateUserEventStatus fromPayload: aDictionary schedule: self
]

{ #category : #accessing }
GeoSchedule >> users [

	^ users
]
