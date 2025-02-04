Class {
	#name : #GeoSchedule,
	#superclass : #Object,
	#instVars : [
		'events',
		'users',
		'categories',
		'database',
		'templates'
	],
	#category : #'Geo Schedule-Domain'
}

{ #category : #actions }
GeoSchedule >> addCategory: aDictionary [

	^GeoAddCategory fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> addEvent: aDictionary [

	^GeoAddEvent fromPayload: aDictionary schedule: self
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
GeoSchedule >> categoryNamed: categoryName [

	^ categories
		  detect: [ :each | each name = categoryName ]
		  ifNone: [ nil ]
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
GeoSchedule >> eventAt: eventId [

	^events at: eventId ifAbsent: nil
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
	templates := Dictionary new
	
]

{ #category : #accessing }
GeoSchedule >> modDateAndTime [

	^ database modDateAndTime
]

{ #category : #actions }
GeoSchedule >> modifyCategory: aDictionary [

	^GeoModifyCategory fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> modifyEvent: aDictionary [

	^GeoModifyEvent fromPayload: aDictionary schedule: self
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
GeoSchedule >> removeLastDBEntry: idx [

	database removeLast: idx
]

{ #category : #accessing }
GeoSchedule >> templateAtCategory: aCategory typeClass: templateType [

	^ (self templates at: aCategory ifAbsentPut: [ Dictionary new ])
		  at: templateType
		  ifAbsentPut: [ templateType category: aCategory schedule: self ]
]

{ #category : #accessing }
GeoSchedule >> templates [
	templates ifNil: [ templates := Dictionary new ].
	^templates
]

{ #category : #actions }
GeoSchedule >> updateEventStatus: aDictionary [

	^GeoUpdateEventStatus fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> updateUserCategoryStatus: aDictionary [

	^GeoUpdateUserCategoryStatus fromPayload: aDictionary schedule: self
]

{ #category : #actions }
GeoSchedule >> updateUserEventStatus: aDictionary [

	^GeoUpdateUserEventStatus fromPayload: aDictionary schedule: self
]

{ #category : #accessing }
GeoSchedule >> userAt: userId [

	^users at: userId ifAbsent: nil
]

{ #category : #accessing }
GeoSchedule >> userNamed: userName [

	^users detect: [ :user | user name = userName ] ifNone: [ nil ]
]

{ #category : #accessing }
GeoSchedule >> userWithEmail: emailString [

	^users detect: [ : user | user email = emailString ] ifNone: nil
]

{ #category : #accessing }
GeoSchedule >> users [

	^ users
]
