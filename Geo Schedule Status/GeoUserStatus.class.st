Class {
	#name : #GeoUserStatus,
	#superclass : #GeoStatus,
	#instVars : [
		'color'
	],
	#category : #'Geo Schedule Status'
}

{ #category : #accessing }
GeoUserStatus >> color [

	^ color
]

{ #category : #accessing }
GeoUserStatus >> color: anObject [

	color := anObject
]
