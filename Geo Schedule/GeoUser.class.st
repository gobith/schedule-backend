Class {
	#name : #GeoUser,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'surname',
		'email',
		'phone',
		'password',
		'role',
		'websiteRole',
		'eventStatus'
	],
	#category : #'Geo Schedule'
}

{ #category : #accessing }
GeoUser >> email [

	^ email
]

{ #category : #accessing }
GeoUser >> email: anObject [

	email := anObject
]

{ #category : #accessing }
GeoUser >> eventStatus [
	^ eventStatus
]

{ #category : #accessing }
GeoUser >> id [

	^ id
]

{ #category : #accessing }
GeoUser >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GeoUser >> initialize [ 

	super initialize.
	eventStatus := Dictionary new
]

{ #category : #accessing }
GeoUser >> name [

	^ name
]

{ #category : #accessing }
GeoUser >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoUser >> password [

	^ password
]

{ #category : #accessing }
GeoUser >> password: anObject [

	password := anObject
]

{ #category : #accessing }
GeoUser >> phone [

	^ phone
]

{ #category : #accessing }
GeoUser >> phone: anObject [

	phone := anObject
]

{ #category : #printing }
GeoUser >> printOn: aStream [

	aStream
		nextPutAll: name
]

{ #category : #accessing }
GeoUser >> role [

	^ role
]

{ #category : #accessing }
GeoUser >> role: anObject [

	role := anObject
]

{ #category : #accessing }
GeoUser >> surname [

	^ surname
]

{ #category : #accessing }
GeoUser >> surname: anObject [

	surname := anObject
]

{ #category : #accessing }
GeoUser >> websiteRole [

	^ websiteRole
]

{ #category : #accessing }
GeoUser >> websiteRole: anObject [

	websiteRole := anObject
]
