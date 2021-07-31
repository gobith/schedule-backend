Class {
	#name : #GeoCapabilities,
	#superclass : #Object,
	#instVars : [
		'schedule',
		'user'
	],
	#category : #'Geo Schedule Capabilities'
}

{ #category : #'instance creation' }
GeoCapabilities class >> schedule: aSchedule user: aUser [

	^self new schedule: aSchedule user: aUser
]

{ #category : #initialization }
GeoCapabilities >> schedule: aSchedule user: aUser [

	schedule := aSchedule.
	user := aUser
]

{ #category : #accessing }
GeoCapabilities >> scheduleObjects [

	| dict |
	dict := Dictionary new.

	dict
		at: 'events' put: self events;
		at: 'users' put: self users.

	^ dict
]
