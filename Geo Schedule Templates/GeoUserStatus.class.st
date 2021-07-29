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
