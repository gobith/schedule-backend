Class {
	#name : #GeoEventUser,
	#superclass : #Object,
	#instVars : [
		'user',
		'status'
	],
	#category : #'Geo Schedule Templates'
}

{ #category : #accessing }
GeoEventUser class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #userId to: #user;
		mapAccessor: #status
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
