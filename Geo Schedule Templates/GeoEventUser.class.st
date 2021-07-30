Class {
	#name : #GeoEventUser,
	#superclass : #Object,
	#instVars : [
		'event',
		'user',
		'status',
		'color'
	],
	#category : #'Geo Schedule Templates'
}

{ #category : #accessing }
GeoEventUser class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #userId to: #user;
		mapAccessor: #status;
		mapAccessor: #color
]

{ #category : #accessing }
GeoEventUser >> color [

	color ifNil: [ 
		color := (GeoStatusModel
			         colorForEventStatus: event status
			         userStatus: status) asHexString ].
	^ color
]

{ #category : #accessing }
GeoEventUser >> event [

	^ event
]

{ #category : #accessing }
GeoEventUser >> event: anObject [

	event := anObject
]

{ #category : #accessing }
GeoEventUser >> status [

	^ status
]

{ #category : #accessing }
GeoEventUser >> status: anObject [

	status := anObject
]

{ #category : #accessing }
GeoEventUser >> user [

	^ user
]

{ #category : #accessing }
GeoEventUser >> user: anObject [

	user := anObject
]

{ #category : #accessing }
GeoEventUser >> userId [

	^user id
]
