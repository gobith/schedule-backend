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

{ #category : #accessing }
GeoCapabilities >> events [

	^self subclassResponsibility 
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
		  yourself
]

{ #category : #accessing }
GeoCapabilities >> users [

	^self subclassResponsibility 
]
