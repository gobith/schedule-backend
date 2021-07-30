Class {
	#name : #GeoUserStatus,
	#superclass : #Object,
	#instVars : [
		'user',
		'status'
	],
	#category : #'Geo Schedule Templates'
}

{ #category : #accessing }
GeoUserStatus class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #userId to: #user;
		mapAccessor: #status
]

{ #category : #accessing }
GeoUserStatus >> status [

	^ status
]

{ #category : #accessing }
GeoUserStatus >> status: anObject [

	status := anObject
]

{ #category : #accessing }
GeoUserStatus >> user [

	^ user
]

{ #category : #accessing }
GeoUserStatus >> user: anObject [

	user := anObject
]

{ #category : #accessing }
GeoUserStatus >> userId [

	^user id
]
