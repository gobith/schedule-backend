Class {
	#name : #GeoCapabilities,
	#superclass : #Object,
	#instVars : [
		'schedule',
		'user'
	],
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #'instance creation' }
GeoCapabilities class >> schedule: aSchedule user: aUser [

	^self new schedule: aSchedule user: aUser
]

{ #category : #actions }
GeoCapabilities >> addEvent: aRequest [

	^nil
]

{ #category : #accessing }
GeoCapabilities >> categories [ 
	^self subclassResponsibility 
]

{ #category : #accessing }
GeoCapabilities >> events [

	^self subclassResponsibility 
]

{ #category : #testing }
GeoCapabilities >> isAdmin [ 
	^false
]

{ #category : #accessing }
GeoCapabilities >> loggedIn [ 
	^true
]

{ #category : #actions }
GeoCapabilities >> modifyCategory: aRequest [

	^nil
]

{ #category : #actions }
GeoCapabilities >> modifyUser: aRequest [

	^nil
]

{ #category : #accessing }
GeoCapabilities >> newJSONObject [

	^GeoJSONObject new
]

{ #category : #initialization }
GeoCapabilities >> schedule: aSchedule user: aUser [

	schedule := aSchedule.
	user := aUser
]

{ #category : #accessing }
GeoCapabilities >> scheduleObject [

	^ self newJSONObject
		  events: self events;
		  users: self users;
		  userId: self userId;
		  categories: self categories;
		  loggedIn: self loggedIn;
		  isAdmin: self isAdmin;
		  yourself
]

{ #category : #accessing }
GeoCapabilities >> userId [ 

	^user id
]

{ #category : #accessing }
GeoCapabilities >> users [

	^self subclassResponsibility 
]
