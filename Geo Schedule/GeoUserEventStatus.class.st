Class {
	#name : #GeoUserEventStatus,
	#superclass : #Object,
	#instVars : [
		'user',
		'event',
		'status'
	],
	#category : #'Geo Schedule'
}

{ #category : #accessing }
GeoUserEventStatus >> event [

	^ event
]

{ #category : #accessing }
GeoUserEventStatus >> event: anObject [

	event := anObject
]

{ #category : #printing }
GeoUserEventStatus >> printOn: aStream [

	aStream
		print: event ;
		space;
		print: user  
]

{ #category : #accessing }
GeoUserEventStatus >> status [

	^ status
]

{ #category : #accessing }
GeoUserEventStatus >> status: anObject [

	status := anObject
]

{ #category : #accessing }
GeoUserEventStatus >> user [

	^ user
]

{ #category : #accessing }
GeoUserEventStatus >> user: anObject [

	user := anObject
]
